#!/usr/bin/env python3
"""
check_italics.py

Aponta palavras em inglês que aparecem no texto sem \\textit{}.

Estratégia dupla:
  1. Auto-referência: coleta termos já italicizados no corpus e
     reporta onde aparecem sem itálico. Palavras individuais de
     frases só entram se também constam no dicionário inglês.
  2. Dicionário NLTK: palavras com 6+ letras presentes no dicionário
     inglês e ausentes do vocabulário português básico.

Uso:
    python check_italics.py [arquivo.tex ...]
    (sem argumentos: varre chapters/cap*.tex automaticamente)
"""

import re
import sys
from collections import defaultdict
from pathlib import Path

import nltk

nltk.download("words", quiet=True)
from nltk.corpus import words as nltk_words

ENGLISH_WORDS = set(w.lower() for w in nltk_words.words())

# ── Regex ──────────────────────────────────────────────────────────────────────

RE_COMMENT = re.compile(r"%.*$", re.MULTILINE)
RE_TEXTIT  = re.compile(r"\\textit\{([^}]+)\}")
RE_TEXTTT  = re.compile(r"\\texttt\{[^}]+\}")   # código inline — ignorar
RE_ENV     = re.compile(r"\\(?:begin|end)\{[^}]+\}")
RE_CMD_ARG = re.compile(
    r"\\(?:cite|ref|autoref|label|input|includegraphics|parencite|textcite"
    r"|textbf|chapter|section|subsection|footnote|emph|item"
    r"|usepackage|RequirePackage|newcommand|renewcommand|addbibresource"
    r"|printbibliography|tableofcontents|listoffigures|listoftables"
    r"|pagestyle|fancyhf|fancyfoot|setlength|geometry|hypersetup"
    r"|titleformat|titlespacing|cellcolor)\*?\{[^}]*\}"
)
RE_CMD    = re.compile(r"\\[a-zA-Z]+\*?")
RE_BRACES = re.compile(r"[{}]")
RE_WORD   = re.compile(r"\b([a-zA-Z]{4,})\b")

# ── Vocabulário compartilhado PT/EN — não sinalizar ───────────────────────────

PT_SHARED = {
    # conjunções, preposições, artigos
    "para", "como", "mais", "este", "esta", "estes", "estas",
    "mesmo", "mesma", "entre", "sobre", "pela", "pelo", "onde",
    "algo", "cada", "toda", "todo", "todos", "esse", "essa",
    "pois", "logo", "sera", "pode", "deve", "dois", "tres",
    "pelos", "pelas", "neste", "nesta", "nesse", "dessa", "desse",
    "numa", "ante", "apos", "alem", "aqui", "pelo", "pela",
    "contra", "outra", "outro", "outros", "outras", "nosso", "nossa",
    # adjetivos e substantivos partilhados PT/EN
    "total", "base", "parte", "fase", "tipo", "meta", "nota",
    "item", "real", "modo", "forma", "dado", "dados", "area",
    "taxa", "nivel", "caso", "nova", "novo", "alto", "alta",
    "local", "global", "normal", "digital", "final", "inicial",
    "central", "virtual", "manual", "natural", "social", "formal",
    "linear", "similar", "regular", "popular", "serial", "geral",
    "lateral", "plural", "circular", "especial", "media", "opera",
    "lista", "valor", "serie", "campo", "fonte", "linha", "coluna",
    "indice", "numero", "figura", "classe", "classes", "modelo",
    "rede", "redes", "fluxo", "tempo", "custo", "conta",
    "principal", "fundamental", "artificial", "inferior", "superior",
    "volume", "magnitude", "sensor", "sensores",
    # sufixos -al/-ional idênticos em PT e EN
    "experimental", "computacional", "nacional", "internacional",
    "funcional", "operacional", "racional", "adicional", "opcional",
    "original", "horizontal", "vertical", "temporal", "espacial",
    # palavras claramente portuguesas presentes no corpus NLTK
    "pronto", "ponto", "tanto", "certo", "basta", "falta", "banco",
    "porta", "terra", "anos", "solo", "junto", "atual", "atuais",
    "erro", "erros", "falha", "falhas", "treino", "teste", "testes",
    "conter", "risco", "riscos", "fator", "fatores",
    "autor", "autores", "texto", "textos", "etapa", "etapas",
    "passo", "passos", "dada", "dadas", "alvo", "alvos",
    "chave", "chaves", "profunda", "profundo", "profundas", "profundos",
    "anormal", "anormais", "auditoria", "tarefa", "tarefas",
    "manter", "depender", "formular", "auxiliar", "resolve", "divide",
    "desconhecido", "desconhecida", "desconhecidos", "desconhecidas",
    "treinamento", "camada", "camadas", "entrada", "saida",
    "saidas", "entradas", "peso", "pesos", "limiar",
    "arvore", "arvores", "floresta", "florestas", "validacao",
    "ataques", "ataque", "maior", "menor",
    "neurais", "neural",
    # adjetivos com forma idêntica em PT e EN
    "anterior", "posteriores", "integral", "integrais",
    "amplitude", "particular", "marginal", "versus",
    # verbos PT cuja conjugação coincide com o infinitivo EN
    "remove", "emerge", "resume", "ignore", "memorize",
    "divide", "resolve", "combine", "capture", "compare",
    "include", "produce", "reduce", "require", "execute",
    "generate", "indicate", "separate", "simulate", "estimate",
    # sem itálico por convenção neste documento
    "linux", "python", "java", "scala", "spark",
    "true", "false", "null", "void",
}

# Rótulos de classe dos datasets CICIDS2017 / LycoS — só filtrar em tabelas
DATASET_LABELS = {
    # nomes capitalizados
    "DDoS", "PortScan", "GoldenEye", "Slowhttptest", "Slowloris",
    "Heartbleed", "Infiltration", "Botnet", "Brute", "Force",
    "Injection", "Hulk", "Slowhttp", "Infil", "Attack", "Web",
    "Benign", "Patator", "Nikto", "Hulk",
    # variantes minúsculas (LycoS usa lowercase)
    "ddos", "portscan", "goldeneye", "slowhttptest", "slowloris",
    "heartbleed", "infiltration", "botnet", "benign",
    "hulk", "patator", "nikto",
    # cabeçalho de métricas nas tabelas
    "score", "suporte",
}

# Nomes próprios (pessoas, organizações) — não sinalizar
PROPER_NOUNS = {
    "Dorothy", "Denning", "Mitchell", "Neto", "Gomes", "Rego", "Nunes",
    "Silva", "Cantone", "Marrocco", "Ravindran", "Ojha", "Kamboj",
    "Sharafaldin", "Engelen", "Lashkari",
    "Google", "Scholar", "Canadian", "Institute", "Cybersecurity",
    "Security", "Xplore", "Cisco", "Colab", "Jupyter", "Keras",
    "Scikit", "TensorFlow", "Anaconda", "Github",
    "Bloom", "Bagging", "Gini", "Shannon",
    "LycoS",
}

# ── Funções auxiliares ─────────────────────────────────────────────────────────


def strip_comments(text: str) -> str:
    return RE_COMMENT.sub("", text)


def extract_italic_terms(text: str) -> set[str]:
    """
    Termos já italicizados no corpus.
    Frase de uma palavra → adiciona direto.
    Frase multi-palavra → adiciona a frase inteira + palavras individuais
    apenas se estiverem no dicionário inglês (evita propagar palavras PT).
    """
    terms: set[str] = set()
    for m in RE_TEXTIT.finditer(text):
        phrase = m.group(1).strip().lower()
        words = phrase.split()
        if len(words) == 1:
            if len(phrase) >= 4 and phrase not in PT_SHARED:
                terms.add(phrase)
        else:
            terms.add(phrase)
            for word in words:
                if (
                    len(word) >= 5
                    and word not in PT_SHARED
                    and word not in {n.lower() for n in PROPER_NOUNS}
                    and word in ENGLISH_WORDS
                ):
                    terms.add(word)
    return terms


def clean_line(line: str) -> str:
    """Remove marcações LaTeX, deixando apenas texto corrido."""
    line = RE_TEXTIT.sub("", line)
    line = RE_TEXTTT.sub("", line)
    line = RE_ENV.sub("", line)
    line = RE_CMD_ARG.sub("", line)
    line = RE_CMD.sub("", line)
    line = RE_BRACES.sub(" ", line)
    return line


def get_snippet(raw_line: str, word: str, window: int = 50) -> str:
    """Trecho centrado na primeira ocorrência da palavra FORA de \\textit{}."""
    pattern = re.compile(r"\b" + re.escape(word) + r"\b", re.IGNORECASE)
    italic_ranges = [(m.start(), m.end()) for m in RE_TEXTIT.finditer(raw_line)]

    match = None
    for m in pattern.finditer(raw_line):
        inside = any(s <= m.start() <= e for s, e in italic_ranges)
        if not inside:
            match = m
            break

    if match is None:
        match = pattern.search(raw_line)
    if match is None:
        return raw_line[:90]

    start = max(0, match.start() - window)
    end   = min(len(raw_line), match.end() + window)
    snippet = raw_line[start:end].strip()
    prefix = "…" if start > 0 else ""
    suffix = "…" if end < len(raw_line) else ""
    return prefix + snippet + suffix


# ── Verificação principal ──────────────────────────────────────────────────────


def check_files(files: list[Path]) -> int:
    full_corpus = strip_comments(
        "\n".join(f.read_text(encoding="utf-8") for f in files)
    )
    italic_terms = extract_italic_terms(full_corpus)

    results: dict[Path, list[tuple[int, str, str]]] = defaultdict(list)

    for filepath in files:
        is_table = "tables" in filepath.parts
        lines = filepath.read_text(encoding="utf-8").splitlines()
        for lineno, raw in enumerate(lines, 1):
            line = strip_comments(raw)
            cleaned = clean_line(line)

            seen_on_line: set[str] = set()
            for m in RE_WORD.finditer(cleaned):
                word = m.group(1)
                wl = word.lower()

                # ignora acrônimos/rótulos em maiúsculas (ex: BENIGN, DDOS)
                if word.isupper():
                    continue

                # em tabelas, ignora rótulos de classe do dataset
                if is_table and (word in DATASET_LABELS or wl in DATASET_LABELS):
                    continue

                if wl in PT_SHARED or word in PROPER_NOUNS or wl in seen_on_line:
                    continue

                in_italic_terms = wl in italic_terms
                in_english_dict = len(wl) >= 6 and wl in ENGLISH_WORDS

                if in_italic_terms or in_english_dict:
                    seen_on_line.add(wl)
                    snippet = get_snippet(raw, word)
                    results[filepath].append((lineno, word, snippet))

    total = 0
    for filepath, findings in sorted(results.items(), key=lambda x: x[0].name):
        if findings:
            print(f"\n{'═' * 64}")
            print(f"  {filepath.name}")
            print(f"{'═' * 64}")
            for lineno, word, snippet in findings:
                print(f"  L{lineno:<5} \033[93m{word}\033[0m")
                print(f"         {snippet}")
            total += len(findings)

    print(f"\n{'═' * 64}")
    print(f"  {total} ocorrência(s) em {len(results)} arquivo(s)")
    return total


def main() -> None:
    root = Path(__file__).resolve().parent.parent

    if len(sys.argv) > 1:
        files = [Path(p).resolve() for p in sys.argv[1:]]
    else:
        extra = [
            p for p in [
                root / "chapters" / "resumo.tex",
                root / "chapters" / "abreviaturas.tex",
            ] if p.exists()
        ]
        files = (
            extra
            + sorted(root.glob("chapters/cap*.tex"))
            + sorted(root.glob("chapters/tables/**/*.tex"))
        )

    if not files:
        print("Nenhum arquivo .tex encontrado.")
        sys.exit(1)

    existing = [f for f in files if f.exists()]
    if not existing:
        print("Nenhum dos arquivos informados existe.")
        sys.exit(1)

    print(f"Verificando {len(existing)} arquivo(s)...")
    sys.exit(0 if check_files(existing) == 0 else 1)


if __name__ == "__main__":
    main()
