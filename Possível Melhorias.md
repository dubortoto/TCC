
# Melhorias apontadas pela orientadora (reunião 29/05/2026)

> **Terminologia adotada:**
> - **Cenário** = configuração experimental (Baseline, Cenário A–G — o que antes era chamado de "melhoria")
> - **Variante** = modo de avaliação dentro de cada cenário (Variante Completa, Sem PortScan, Sem XSS — o que antes era chamado de "cenário")

---

- [x] **Cap 1, seção 1.1 (Contextualização), último parágrafo** — Substituir "provou-se" por "tem se mostrado eficaz" para suavizar a afirmação e não soar definitivo. ✅ Já feito.

- [x] **Cap 1, seção 1.1 (Contextualização), último parágrafo** — Adicionar parágrafo de transição ao final da seção explicitando que RF e DNN foram escolhidos para o comparativo deste trabalho. Texto sugerido: *"Dessa forma, escolhemos essas duas tecnologias para fazer um comparativo ao longo desse trabalho para esse laboratório."* ✅ Feito.

- [x] **Cap 1, seção Hipóteses, primeiro parágrafo** — (a) Substituir "apresentarão" por "é esperado que apresentem" para que a hipótese não soe como afirmação definitiva; (b) remover o trecho `, com maior acurácia e menor incidência de falsos negativos, especialmente frente a ataques complexos e tráfego criptografado.` ✅ Feito.

- [x] **Cap 2, parágrafo de introdução** — Corrigir o erro tipográfico: "embasas" → "embasa". ✅ Feito.

- [x] **Cap 3, parágrafo de introdução** — Remover os m-dashes (—) ao redor de "com destaque para a técnica MDI de seleção de características", substituindo por parênteses. ✅ Feito.

- [x] **Cap 1, primeira menção a IDS (página ~3)** — Ao usar "IDS" pela primeira vez na seção Contextualização, expandir para "Sistemas de Detecção de Intrusão (*Intrusion Detection System* - IDS)". ✅ Feito.

- [x] **Itálico em palavras em inglês — revisão por capítulo** — Revisar todos os capítulos e garantir que todas as palavras em inglês estejam formatadas em itálico (`\textit{}`). Siglas consagradas em português (IDS, DNN, RF, MDI, CPU, GPU, etc.) são exceções e não precisam de itálico.

  | Capítulo | Status |
  |---|---|
  | Cap 1 — Introdução | ✅ Feito (`phishing`, `supply chain`, título do relatório IBM, `hardware`) |
  | Cap 2 — IDS | ✅ Feito (`malware`, `software`, `host`, `log`, `web`, `Random Forest`, `XGBoost`, `Autoencoders`, `Datasets`, `dataset`) |
  | Cap 3 — ML | ✅ Feito (`Random Forest` ×4, `XGBoost`, `datasets`) |
  | Cap 4 — DNN | ✅ Feito (`Autoencoders` ×2, `Autoencoder` ×2, `pipeline`, `datasets`, `Random Forest`) |
  | Cap 5 — Trabalhos Relacionados | ✅ Feito (`LIME`, `BLOOM-RNN`, `autoencoder`, `CICIDS2017` ×1, `Baseline` ×2, `dataset` ×2) |
  | Cap 6 — Metodologia | ✅ Feito (`Adam` ×2) |
  | Cap 7 — Resultados | ✅ Feito (`Baseline` ×todos, `autoencoder/autoencoders` ×todos, `dataset` ×1, `Heatmap`, `Random Forest` em legendas, `Autoencoder` em legenda) |
  | Cap 8 — Conclusão | ✅ Feito (`Baseline` ×3, `datasets` ×3, `Autoencoder` ×1, `LIME`) |

- [x] **Cap 1, seção Hipóteses, primeiro parágrafo** — Trocar "apresentarão" por "é esperado que apresentem". *(Resolvido junto com a tarefa anterior.)* ✅ Feito.

- [x] **Cap 1, seção Hipóteses** — Reduzir o nível de detalhe: manter apenas o que se espera observar em termos gerais, sem detalhar mecanismos esperados. ✅ Feito.

- [x] **Cap 5, seções 5.1–5.6** — Remover todas as referências diretas ao próprio trabalho ("neste laboratório", "neste TCC", "os achados deste estudo", etc.) do corpo das seções 5.1–5.5. O último parágrafo da seção 5.6 resume o que foi implementado. ✅ Feito.

- [x] **Página ~22 — palavras em inglês** — Coberta pela revisão global de itálicos capítulo a capítulo. ✅ Feito.

- [x] **Cap 5, seção 5.6 — narrativa de cenários** — Seção renomeada para "Cenários do Experimento". Último parágrafo reescrito em tempo futuro usando "Cenário A/B/C..." em vez de "Melhoria A/B/C...". ✅ Feito.

- [x] **Cap 6 — apresentação do plano experimental** — Adicionado parágrafo na introdução do capítulo explicando a estrutura em dois níveis: Baseline como referência + oito cenários adicionais planejados desde o início para isolar fatores específicos. ✅ Feito.

- [x] **Cap 5 — tabela resumo dos cenários** — Tabela inserida após a seção 5.5, com colunas Cenário, Dataset, MDI e Modelo(s), cobrindo Baseline e Cenários A–G. ✅ Feito.

- [x] **Cap 5, seção 5.6 — tempo verbal e perspectiva** — Seção 5.6 já usa tempo futuro ("são propostos", "reproduzirá", "aplicarão", "investigarão") e a tabela marca a transição. ✅ Feito.

- [x] **Cap 5, estrutura geral** — Seções 5.1–5.5 apresentam literatura pura, tabela faz a transição, seção 5.6 usa perspectiva de planejamento. ✅ Feito.

- [x] **Cap 5 — tabela resumo** *(duplicata)* ✅ Feito junto com a tarefa acima.

- [ ] **Cap 7, figura 7.5 — rótulos** — Adicionar rótulos em cada barra/linha da figura identificando o cenário correspondente (Baseline, Cenário A, B, C, D, E, F, G) para facilitar a leitura sem depender da legenda. *(Requer editar o script Python que gera o gráfico.)*

- [x] **Cap 7, figura 7.5 — tabela de dados** — Tabela adicionada após a figura com Acurácia, F1 Macro e F1 Ponderado dos 10 experimentos na variante completa (label: `tab:comparacao_geral`). ✅ Feito.

- [x] **Referências bibliográficas — links clicáveis** — `hyperref` já ativo na classe. DOIs adicionados a 6 referências que estavam sem: `neto_gomes`, `cantone2024`, `rego_nunes`, `santos2023ercemapi`, `bochie2020sbrc`, `medeiros2019sbrc`. Sem DOI localizável: `sbrc_minicursos` (Lopez 2018), `silva_hsae`, `liborio2015`. ✅ Feito.

- [x] **Terminologia global — substituição no documento** — "cenário(s)" → "variante(s)" para modos de avaliação (Completo, Sem PortScan, Sem XSS) em cap 5, 6, 7, 8 e legendas de tabelas. Usos gerais do português ("em cenários desbalanceados", "cenários de produção", etc.) mantidos. ✅ Feito.

- [x] **Índice de tabelas e índice de figuras** — `\listoffigures` e `\listoftables` adicionados após `\sumario` no documento principal. ✅ Feito.
