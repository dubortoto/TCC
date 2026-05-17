# Inventário de Resultados do Laboratório

Mapeia todos os resultados identificados nos notebooks do laboratório e indica quais tabelas LaTeX já foram extraídas para `chapters/tables/`.

**Legenda:** ✅ Inserido em `chapters/tables/` · ⏳ Disponível no notebook, tabela ainda não extraída

---

## Baseline — CICIDS2017 (sem melhorias)

**Pasta:** `chapters/tables/Baseline-CICIDS2017/`

| Arquivo `.tex` | Label LaTeX | Notebook de origem | Status |
|---|---|---|---|
| `DNN-Completo-Matriz-de-Confusão.tex` | `table:dnn_completo_mc` | `Treinamento DNN - cicids2017.ipynb` | ✅ |
| `DNN-Completo-Métricas.tex` | `table:dnn_completo_metricas` | `Treinamento DNN - cicids2017.ipynb` | ✅ |
| `DNN-Sem-XSS-Matriz-de-Confusão.tex` | `table:dnn_Sem_XSS_mc` | `Treinamento DNN - cicids2017 - Sem XSS.ipynb` | ✅ |
| `DNN-Sem-XSS-Métricas.tex` | `table:dnn_Sem_XSS_metricas` | `Treinamento DNN - cicids2017 - Sem XSS.ipynb` | ✅ |
| `DNN-Sem-PortScan-Matriz-de-Confusão.tex` | `table:dnn_Sem_PortScan_mc` | `Treinamento DNN - cicids2017 - Sem Portscan.ipynb` | ✅ |
| `DNN-Sem-PortScan-Métricas.tex` | `table:dnn_Sem_PortScan_metricas` | `Treinamento DNN - cicids2017 - Sem Portscan.ipynb` | ✅ |
| `RF-Completo-Matriz-de-Confusão.tex` | `table:rf_completo_mc` | `Treinamento Random Forest - cicids2017.ipynb` | ✅ |
| `RF-Completo-Métricas.tex` | `table:rf_completo_metricas` | `Treinamento Random Forest - cicids2017.ipynb` | ✅ |
| `RF-Sem-XSS-Matriz-de-Confusão.tex` | `table:rf_Sem_XSS_mc` | `Treinamento Random Forest - cicids2017 - Sem XSS.ipynb` | ✅ |
| `RF-Sem-XSS-Métricas.tex` | `table:rf_Sem_XSS_metricas` | `Treinamento Random Forest - cicids2017 - Sem XSS.ipynb` | ✅ |
| `RF-Sem-PortScan-Matriz-de-Confusão.tex` | `table:rf_sem_portscan_mc` | `Treinamento Random Forest - cicids2017 - Sem Portscan.ipynb` | ✅ |
| `RF-Sem-PortScan-Métricas.tex` | `table:rf_sem_portscan_metricas` | `Treinamento Random Forest - cicids2017 - Sem Portscan.ipynb` | ✅ |
| `Total-Completo-Metricas.tex` | `tab:total_completo_metricas` | _(comparativo gerado manualmente)_ | ✅ |
| `Total-Completo-Tempo-de-classificação.tex` | `tab:total_completo_tempo_de_classificacao` | _(comparativo gerado manualmente)_ | ✅ |
| `Total-Todos-Tempo-de-classificação.tex` | `tab:total_todos_tempo_de_classificacao` | _(comparativo gerado manualmente)_ | ✅ |

---

## Melhoria A — LycoS-IDS2017 (sem MDI)

**Pasta:** `chapters/tables/MelhoriaA-LycoS/`

| Arquivo `.tex` sugerido | Label LaTeX | Notebook de origem | Status |
|---|---|---|---|
| `DNN-Completo-Matriz-de-Confusão.tex` | `table:dnn_lycos_completo_mc` | `Treinamento DNN - lycos_cicids2017.ipynb` | ⏳ |
| `DNN-Completo-Métricas.tex` | `table:dnn_lycos_completo_metricas` | `Treinamento DNN - lycos_cicids2017.ipynb` | ⏳ |
| `DNN-Sem-XSS-Matriz-de-Confusão.tex` | `table:dnn_lycos_sem_xss_mc` | `Treinamento DNN - lycos_cicids2017 - Sem XSS.ipynb` | ⏳ |
| `DNN-Sem-XSS-Métricas.tex` | `table:dnn_lycos_sem_xss_metricas` | `Treinamento DNN - lycos_cicids2017 - Sem XSS.ipynb` | ⏳ |
| `DNN-Sem-PortScan-Matriz-de-Confusão.tex` | `table:dnn_lycos_sem_portscan_mc` | `Treinamento DNN - lycos_cicids2017 - Sem Portscan.ipynb` | ⏳ |
| `DNN-Sem-PortScan-Métricas.tex` | `table:dnn_lycos_sem_portscan_metricas` | `Treinamento DNN - lycos_cicids2017 - Sem Portscan.ipynb` | ⏳ |
| `RF-Completo-Matriz-de-Confusão.tex` | `table:rf_lycos_completo_mc` | `Treinamento Random Forest - lycos_cicids2017.ipynb` | ⏳ |
| `RF-Completo-Métricas.tex` | `table:rf_lycos_completo_metricas` | `Treinamento Random Forest - lycos_cicids2017.ipynb` | ⏳ |
| `RF-Sem-XSS-Matriz-de-Confusão.tex` | `table:rf_lycos_sem_xss_mc` | `Treinamento Random Forest - lycos_cicids2017 - Sem XSS.ipynb` | ⏳ |
| `RF-Sem-XSS-Métricas.tex` | `table:rf_lycos_sem_xss_metricas` | `Treinamento Random Forest - lycos_cicids2017 - Sem XSS.ipynb` | ⏳ |
| `RF-Sem-PortScan-Matriz-de-Confusão.tex` | `table:rf_lycos_sem_portscan_mc` | `Treinamento Random Forest - lycos_cicids2017 - Sem Portscan.ipynb` | ⏳ |
| `RF-Sem-PortScan-Métricas.tex` | `table:rf_lycos_sem_portscan_metricas` | `Treinamento Random Forest - lycos_cicids2017 - Sem Portscan.ipynb` | ⏳ |

---

## Melhoria B — CICIDS2017 com MDI (DNN)

**Pasta:** `chapters/tables/MelhoriaB-CICIDS2017-MDI/`

> O RF é usado apenas para seleção de features via MDI; os experimentos de classificação desta melhoria usam DNN treinada nas features reduzidas.

| Arquivo `.tex` sugerido | Label LaTeX | Notebook de origem | Status |
|---|---|---|---|
| `DNN-Completo-Matriz-de-Confusão.tex` | `table:dnn_cicids_reducao_mc` | `Treinamento DNN - cicids2017 - Com Redução de Dimensionalidade.ipynb` | ⏳ |
| `DNN-Completo-Métricas.tex` | `table:dnn_cicids_reducao_metricas` | `Treinamento DNN - cicids2017 - Com Redução de Dimensionalidade.ipynb` | ⏳ |
| `DNN-Sem-XSS-Matriz-de-Confusão.tex` | `table:dnn_cicids_reducao_sem_xss_mc` | `Treinamento DNN - cicids2017 - Com Redução de Dimensionalidade - Sem XSS.ipynb` | ⏳ |
| `DNN-Sem-XSS-Métricas.tex` | `table:dnn_cicids_reducao_sem_xss_metricas` | `Treinamento DNN - cicids2017 - Com Redução de Dimensionalidade - Sem XSS.ipynb` | ⏳ |
| `DNN-Sem-PortScan-Matriz-de-Confusão.tex` | `table:dnn_cicids_reducao_sem_portscan_mc` | `Treinamento DNN - cicids2017 - Com Redução de Dimensionalidade - Sem Portscan.ipynb` | ⏳ |
| `DNN-Sem-PortScan-Métricas.tex` | `table:dnn_cicids_reducao_sem_portscan_metricas` | `Treinamento DNN - cicids2017 - Com Redução de Dimensionalidade - Sem Portscan.ipynb` | ⏳ |
| `DNN-Balanced-Matriz-de-Confusão.tex` | `table:dnn_cicids_reducao_balanced_mc` | `Treinamento DNN - cicids2017 - Com Redução de Dimensionalidade e Balanced.ipynb` | ⏳ |
| `DNN-Balanced-Métricas.tex` | `table:dnn_cicids_reducao_balanced_metricas` | `Treinamento DNN - cicids2017 - Com Redução de Dimensionalidade e Balanced.ipynb` | ⏳ |

---

## Melhoria C — LycoS-IDS2017 com MDI (DNN)

**Pasta:** `chapters/tables/MelhoriaC-LycoS-MDI/`

| Arquivo `.tex` sugerido | Label LaTeX | Notebook de origem | Status |
|---|---|---|---|
| `DNN-Completo-Matriz-de-Confusão.tex` | `table:dnn_lycos_reducao_mc` | `Treinamento DNN - lycos_cicids2017 - Com Redução de Dimensionalidade.ipynb` | ⏳ |
| `DNN-Completo-Métricas.tex` | `table:dnn_lycos_reducao_metricas` | `Treinamento DNN - lycos_cicids2017 - Com Redução de Dimensionalidade.ipynb` | ⏳ |
| `DNN-Sem-XSS-Matriz-de-Confusão.tex` | `table:dnn_lycos_reducao_sem_xss_mc` | `Treinamento DNN - lycos_cicids2017 - Com Redução de Dimensionalidade - Sem XSS.ipynb` | ⏳ |
| `DNN-Sem-XSS-Métricas.tex` | `table:dnn_lycos_reducao_sem_xss_metricas` | `Treinamento DNN - lycos_cicids2017 - Com Redução de Dimensionalidade - Sem XSS.ipynb` | ⏳ |
| `DNN-Sem-PortScan-Matriz-de-Confusão.tex` | `table:dnn_lycos_reducao_sem_portscan_mc` | `Treinamento DNN - lycos_cicids2017 - Com Redução de Dimensionalidade - Sem Portscan.ipynb` | ⏳ |
| `DNN-Sem-PortScan-Métricas.tex` | `table:dnn_lycos_reducao_sem_portscan_metricas` | `Treinamento DNN - lycos_cicids2017 - Com Redução de Dimensionalidade - Sem Portscan.ipynb` | ⏳ |
| `DNN-Balanced-Matriz-de-Confusão.tex` | `table:dnn_lycos_reducao_balanced_mc` | `Treinamento DNN - lycos_cicids2017 - Com Redução de Dimensionalidade e Balanced.ipynb` | ⏳ |
| `DNN-Balanced-Métricas.tex` | `table:dnn_lycos_reducao_balanced_metricas` | `Treinamento DNN - lycos_cicids2017 - Com Redução de Dimensionalidade e Balanced.ipynb` | ⏳ |

---

## Melhorias D–G — Autoencoder (Não Supervisionado)

**Pasta:** `chapters/tables/MelhoriaD-G-Autoencoder/`

> Treino exclusivo com tráfego BENIGN; avaliação no conjunto de teste completo de cada dataset.

| Arquivo `.tex` sugerido | Label LaTeX | Notebook de origem | Melhoria | Status |
|---|---|---|---|---|
| `AE-CICIDS2017-Completo-Matriz-de-Confusão.tex` | `table:ae_cicids_completo_mc` | `Autoencoder - cicids2017.ipynb` | D | ⏳ |
| `AE-CICIDS2017-Completo-Métricas.tex` | `table:ae_cicids_completo_metricas` | `Autoencoder - cicids2017.ipynb` | D | ⏳ |
| `AE-LycoS-Completo-Matriz-de-Confusão.tex` | `table:ae_lycos_completo_mc` | `Autoencoder - lycos_cicids2017.ipynb` | E | ⏳ |
| `AE-LycoS-Completo-Métricas.tex` | `table:ae_lycos_completo_metricas` | `Autoencoder - lycos_cicids2017.ipynb` | E | ⏳ |
| `AE-CICIDS2017-MDI-Completo-Matriz-de-Confusão.tex` | `table:ae_cicids_mdi_completo_mc` | `Autoencoder - cicids2017 - Com Redução de Dimensionalidade.ipynb` | F | ⏳ |
| `AE-CICIDS2017-MDI-Completo-Métricas.tex` | `table:ae_cicids_mdi_completo_metricas` | `Autoencoder - cicids2017 - Com Redução de Dimensionalidade.ipynb` | F | ⏳ |
| `AE-LycoS-MDI-Completo-Matriz-de-Confusão.tex` | `table:ae_lycos_mdi_completo_mc` | `Autoencoder - lycos_cicids2017 - Com Redução de Dimensionalidade.ipynb` | G | ⏳ |
| `AE-LycoS-MDI-Completo-Métricas.tex` | `table:ae_lycos_mdi_completo_metricas` | `Autoencoder - lycos_cicids2017 - Com Redução de Dimensionalidade.ipynb` | G | ⏳ |

---

## Resumo Geral

| Experimento | Tabelas identificadas | Em `chapters/tables/` |
|---|:---:|:---:|
| Baseline — CICIDS2017 | 15 | 15 ✅ |
| Melhoria A — LycoS | 12 | 0 ⏳ |
| Melhoria B — CICIDS2017 + MDI | 8 | 0 ⏳ |
| Melhoria C — LycoS + MDI | 8 | 0 ⏳ |
| Melhorias D–G — Autoencoder | 8 | 0 ⏳ |
| **Total** | **51** | **15** |
