# Contexto do Projeto — TCC FATEC-SP

## O que é este projeto

TCC de Eduardo de Mattos Bortoto para a FATEC-SP. É um laboratório de detecção de intrusão em redes comparando **Random Forest (RF)** e **Deep Neural Network (DNN)** usando o dataset CICIDS2017. O documento LaTeX está em `TCC - Laboratorio de Intrusão.tex` e é compilado com `latexmk` (saída em `build/`).

## Estrutura do projeto

```
TCC/
├── TCC - Laboratorio de Intrusão.tex   # documento principal
├── fatectcc.cls                         # classe LaTeX da FATEC
├── referencias.bib
├── chapters/
│   ├── cap1–cap7.tex
│   └── tables/
│       ├── Baseline-CICIDS2017/         # 15 tabelas já inseridas no LaTeX
│       ├── MelhoriaA-LycoS/             # vazio — tabelas ainda não extraídas
│       ├── MelhoriaB-CICIDS2017-MDI/    # vazio
│       ├── MelhoriaC-LycoS-MDI/         # vazio
│       └── MelhoriaD-G-Autoencoder/     # vazio
├── Laboratório/
│   ├── tarefas.md                       # checklist de experimentos (todos ✅)
│   └── scripts/
│       ├── Treinamento DNN/             # 14 notebooks DNN
│       ├── Treinamento Random Forest/   # 6 notebooks RF
│       ├── Redução de Dimensionalidade/ # 2 notebooks MDI via RF
│       └── Não Supervisionado/          # 4 notebooks Autoencoder
└── RESULTADOS.md                        # inventário completo de tabelas
```

## O que os capítulos fazem

- **cap5.tex** — Trabalhos relacionados + seção de melhorias propostas
- **cap6.tex** — Base teórica do laboratório (em construção, tem placeholders)
- **cap7.tex** — Resultados: usa `\input{chapters/tables/Baseline-CICIDS2017/...}` para incluir as 15 tabelas do baseline

## Experimentos realizados (todos completos)

Os notebooks em `Laboratório/scripts/` têm os resultados e as tabelas LaTeX formatadas nas células de saída. O `RESULTADOS.md` mapeia exatamente qual label/arquivo corresponde a qual notebook.

| Melhoria | Dataset | MDI | Modelo | Pasta de destino |
|---|---|---|---|---|
| Baseline | CICIDS2017 | Não | RF + DNN | `Baseline-CICIDS2017/` ✅ |
| A | LycoS-IDS2017 | Não | RF + DNN | `MelhoriaA-LycoS/` ⏳ |
| B | CICIDS2017 | Sim | DNN | `MelhoriaB-CICIDS2017-MDI/` ⏳ |
| C | LycoS-IDS2017 | Sim | DNN | `MelhoriaC-LycoS-MDI/` ⏳ |
| D | CICIDS2017 | Não | Autoencoder | `MelhoriaD-G-Autoencoder/` ⏳ |
| E | LycoS-IDS2017 | Não | Autoencoder | `MelhoriaD-G-Autoencoder/` ⏳ |
| F | CICIDS2017 | Sim | Autoencoder | `MelhoriaD-G-Autoencoder/` ⏳ |
| G | LycoS-IDS2017 | Sim | Autoencoder | `MelhoriaD-G-Autoencoder/` ⏳ |

## Próximos passos esperados

1. **Compilar o LaTeX** no WSL com `latexmk` (o `.latexmkrc` já configura saída em `build/`)
2. **Extrair tabelas** dos notebooks das Melhorias A–G para os respectivos subfolders em `chapters/tables/`
3. **Escrever cap6.tex** — ainda tem placeholders em todas as seções
4. **Inserir tabelas das melhorias** no cap7.tex com `\input{chapters/tables/MelhoriaX-.../arquivo.tex}`

## Convenção de labels LaTeX

- Baseline: `table:dnn_completo_mc`, `table:rf_sem_portscan_metricas`, `tab:total_completo_metricas`, etc.
- Melhoria A (LycoS): `table:dnn_lycos_completo_mc`, `table:rf_lycos_sem_xss_metricas`, etc.
- Melhoria B (CICIDS2017+MDI): `table:dnn_cicids_reducao_mc`, etc.
- Melhoria C (LycoS+MDI): `table:dnn_lycos_reducao_mc`, etc.
- Melhorias D–G (Autoencoder): `table:ae_cicids_completo_mc`, `table:ae_lycos_mdi_completo_metricas`, etc.

## Como compilar

```bash
latexmk "TCC - Laboratorio de Intrusão.tex"
# PDF gerado em build/TCC - Laboratorio de Intrusão.pdf
```
