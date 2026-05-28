# Contexto do Projeto — TCC FATEC-SP

## O que é este projeto

TCC de Eduardo de Mattos Bortoto para a FATEC-SP. Laboratório de detecção de intrusão em redes comparando **Random Forest (RF)** e **Deep Neural Network (DNN)** usando o dataset CICIDS2017. Documento LaTeX principal: `TCC - Laboratorio de Intrusão.tex`, compilado com `latexmk` (saída em `build/`).

## Estrutura do projeto

```
TCC/
├── TCC - Laboratorio de Intrusão.tex   # documento principal
├── fatectcc.cls                         # classe LaTeX da FATEC
├── referencias.bib                      # 16 entradas (inclui sharafaldin2018 e engelen2021)
├── RESULTADOS.md                        # inventário completo de todas as tabelas dos notebooks
├── chapters/
│   ├── cap1.tex – cap7.tex
│   └── tables/
│       ├── Baseline-CICIDS2017/         # 15 tabelas inseridas no LaTeX
│       ├── MelhoriaA-LycoS/             # tabelas inseridas no LaTeX
│       ├── MelhoriaB-CICIDS2017-MDI/    # tabelas inseridas no LaTeX
│       ├── MelhoriaC-LycoS-MDI/         # tabelas inseridas no LaTeX
│       └── MelhoriaD-G-Autoencoder/     # tabelas inseridas no LaTeX
└── Laboratório/
    ├── tarefas.md                       # checklist de experimentos (todos ✅)
    └── scripts/
        ├── Treinamento DNN/             # 14 notebooks DNN
        ├── Treinamento Random Forest/   # 6 notebooks RF
        ├── Redução de Dimensionalidade/ # 2 notebooks MDI via RF
        └── Não Supervisionado/          # 4 notebooks Autoencoder
```

## O que os capítulos fazem

Todos os capítulos têm um parágrafo introdutório logo após o `\chapter{}` que orienta o leitor sobre o conteúdo da seção.

- **cap1.tex** — Introdução: contextualização + seções Contextualização, Hipóteses, Objetivos, Metodologia
- **cap2.tex** — Sistemas de Detecção de Intrusão: conceitos, abordagens (assinatura/anomalia), desafios
- **cap3.tex** — Aprendizado de Máquina: supervisionado, Random Forest + MDI, métricas de avaliação
- **cap4.tex** — Redes Neurais Profundas: fundamentos de DL, Autoencoder, aplicação em IDS
- **cap5.tex** — Trabalhos relacionados + seção de melhorias propostas (Melhorias A–G)
- **cap6.tex** — Base teórica do laboratório: escolha do dataset, pipeline de dados, cenários, métricas
- **cap7.tex** — Resultados: todas as seções Baseline + Melhorias A–G completas. Usa `\input{chapters/tables/...}` para todas as 51 tabelas.

## Estado atual (atualizado em 2026-05-28)

### O que já foi feito
- **Todos os 7 capítulos completos**, sem placeholders
- **cap6.tex** escrito do zero com base no cap7: justificativa do CICIDS2017 e LycoS-IDS2017, pipeline de preparação (consolidação de CSVs, limpeza, split estratificado 70/30, normalização via StandardScaler, MDI), definição dos 3 cenários com números exatos, explicação de todas as métricas
- **Parágrafos introdutórios** adicionados em todos os capítulos que não tinham (cap1–cap4, cap6)
- **cap1.tex** ganhou seção `Contextualização` para estruturar os parágrafos de contexto antes das seções Hipóteses/Objetivos/Metodologia
- **referencias.bib** com 16 entradas, incluindo `sharafaldin2018` (paper original do CICIDS2017) e `engelen2021` (LycoS-IDS2017 / crítica do CICIDS2017)
- **Todas as 51 tabelas** extraídas para `chapters/tables/` nas subpastas corretas
- **LaTeX compila** sem erros — PDF de 64 páginas em `build/`

### O que falta
- Nenhuma tarefa pendente identificada — documento completo

## Experimentos realizados (todos completos e inseridos)

| Melhoria | Dataset | MDI | Modelo | Pasta de destino |
|---|---|---|---|---|
| Baseline | CICIDS2017 | Não | RF + DNN | `Baseline-CICIDS2017/` ✅ |
| A | LycoS-IDS2017 | Não | RF + DNN | `MelhoriaA-LycoS/` ✅ |
| B | CICIDS2017 | Sim | DNN | `MelhoriaB-CICIDS2017-MDI/` ✅ |
| C | LycoS-IDS2017 | Sim | DNN | `MelhoriaC-LycoS-MDI/` ✅ |
| D | CICIDS2017 | Não | Autoencoder | `MelhoriaD-G-Autoencoder/` ✅ |
| E | LycoS-IDS2017 | Não | Autoencoder | `MelhoriaD-G-Autoencoder/` ✅ |
| F | CICIDS2017 | Sim | Autoencoder | `MelhoriaD-G-Autoencoder/` ✅ |
| G | LycoS-IDS2017 | Sim | Autoencoder | `MelhoriaD-G-Autoencoder/` ✅ |

## Convenção de labels LaTeX

- Baseline: `table:dnn_completo_mc`, `table:rf_sem_portscan_metricas`, `tab:total_completo_metricas`
- Melhoria A (LycoS): `table:dnn_lycos_completo_mc`, `table:rf_lycos_sem_xss_metricas`
- Melhoria B (CICIDS2017+MDI): `table:dnn_cicids_reducao_mc`, `table:dnn_cicids_reducao_sem_xss_mc`
- Melhoria C (LycoS+MDI): `table:dnn_lycos_reducao_mc`, `table:dnn_lycos_reducao_sem_portscan_metricas`
- Melhorias D–G (Autoencoder): `table:ae_cicids_completo_mc`, `table:ae_lycos_mdi_completo_metricas`

## Como compilar

```bash
cd /mnt/c/Users/e/Desktop/Faculdade/TCC
latexmk "TCC - Laboratorio de Intrusão.tex"
# PDF gerado em build/TCC - Laboratorio de Intrusão.pdf
```
