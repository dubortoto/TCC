# Contexto do Projeto — TCC FATEC-SP

## O que é este projeto

TCC de Eduardo de Mattos Bortoto para a FATEC-SP. Laboratório de detecção de intrusão em redes comparando **Random Forest (RF)** e **Deep Neural Network (DNN)** usando o dataset CICIDS2017. Documento LaTeX principal: `TCC - Laboratorio de Intrusão.tex`, compilado com `latexmk` (saída em `build/`).

## Estrutura do projeto

```
TCC/
├── TCC - Laboratorio de Intrusão.tex   # documento principal
├── fatectcc.cls                         # classe LaTeX da FATEC
├── referencias.bib
├── RESULTADOS.md                        # inventário completo de todas as tabelas dos notebooks
├── chapters/
│   ├── cap1.tex – cap7.tex
│   └── tables/
│       ├── Baseline-CICIDS2017/         # 15 tabelas já inseridas no LaTeX (cap7.tex)
│       ├── MelhoriaA-LycoS/             # vazio — tabelas ainda não extraídas
│       ├── MelhoriaB-CICIDS2017-MDI/    # vazio
│       ├── MelhoriaC-LycoS-MDI/         # vazio
│       └── MelhoriaD-G-Autoencoder/     # vazio
└── Laboratório/
    ├── tarefas.md                       # checklist de experimentos (todos ✅)
    └── scripts/
        ├── Treinamento DNN/             # 14 notebooks DNN
        ├── Treinamento Random Forest/   # 6 notebooks RF
        ├── Redução de Dimensionalidade/ # 2 notebooks MDI via RF
        └── Não Supervisionado/          # 4 notebooks Autoencoder
```

## O que os capítulos fazem

- **cap5.tex** — Trabalhos relacionados + seção de melhorias propostas
- **cap6.tex** — Base teórica do laboratório (em construção, tem placeholders)
- **cap7.tex** — Resultados: todas as seções Baseline + Melhorias A–G completas (52 páginas de PDF). Usa `\input{chapters/tables/...}` para todas as 51 tabelas.

## Estado atual (atualizado em 2026-05-20)

### O que já foi feito
- **cap7.tex** completo com análise aprofundada de todos os experimentos:
  - Baseline (Completo, Sem PortScan, Sem XSS) — RF e DNN no CICIDS2017
  - Melhoria A — RF e DNN no LycoS-IDS2017
  - Melhoria B — DNN no CICIDS2017 + MDI (+ variante balanceada)
  - Melhoria C — DNN no LycoS-IDS2017 + MDI (+ variante balanceada)
  - Melhorias D–G — Autoencoders (CICIDS2017, LycoS, CICIDS2017+MDI, LycoS+MDI)
- **Todas as 51 tabelas** extraídas para `chapters/tables/` nas subpastas corretas
- **LaTeX compila** sem erros, sem warnings — PDF de 52 páginas em `build/`

### O que falta
1. **Escrever cap6.tex** — tem placeholders em todas as seções

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
