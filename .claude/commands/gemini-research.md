# Gerar prompt de pesquisa para o Gemini Deep Research

Você receberá uma descrição de capítulo de TCC como argumento. Gere um prompt completo e pronto para colar no Gemini Deep Research, seguindo exatamente o formato abaixo.

**Contexto fixo do TCC:**
- Curso: Tecnologia em Redes de Computadores — FATEC-SP
- Tema geral: Detecção de intrusão em redes usando Random Forest e Deep Neural Network com o dataset CICIDS2017
- Idioma alvo: português brasileiro
- Norma bibliográfica: ABNT NBR 6023

**Argumento recebido:** $ARGUMENTS

---

Com base no argumento acima, gere o seguinte prompt (substitua os campos entre colchetes com o conteúdo apropriado):

```
Preciso de referências bibliográficas em português para escrever um capítulo de TCC sobre [TEMA PRINCIPAL]. O capítulo tem [N] seções: [LISTA DAS SEÇÕES com breve descrição de cada uma].

Critérios de busca:

Priorize capítulos de livros de minicursos publicados pela SBC nos eventos SBRC (Simpósio Brasileiro de Redes de Computadores e Sistemas Distribuídos) ou SBSeg (Simpósio Brasileiro de Segurança da Informação e de Sistemas Computacionais).

Aceite também livros didáticos amplamente adotados no Brasil relacionados ao tema, se houver edição em português ou uso consolidado em cursos brasileiros.

Foque em textos didáticos e introdutórios que expliquem [CONCEITO CENTRAL DO CAPÍTULO], não em artigos de pesquisa avançada.

[CRITÉRIOS ADICIONAIS ESPECÍFICOS DO TEMA, se houver — ex: priorizar fontes que tratem de aplicação em segurança de redes]

Formato da resposta:

Retorne no máximo 3 referências. Para cada uma informe:

Citação completa no formato ABNT

Duas frases explicando o que o texto cobre e por qual seção do capítulo ele é mais útil

Não liste mais do que 3 referências, mesmo que encontre mais candidatos.
```

Após gerar o prompt, exiba-o em um bloco de código para facilitar a cópia, e indique ao usuário que pode colar diretamente no Gemini Deep Research (gemini.google.com) com o modelo "Deep Research" ativado.
