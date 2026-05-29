# HANDOFF — TCC FATEC-SP (Eduardo de Mattos Bortoto)

## Goal

Revisar e refinar o TCC "Desenvolvimento de um Laboratório de Detecção de Intrusão: Comparando Machine Learning e Deep Learning na Identificação de Ameaças em Redes" para apresentação à banca de graduação da FATEC-SP.

---

## Project Context

- **Documento principal**: `TCC - Laboratorio de Intrusão.tex` (compilado com `latexmk`, saída em `build/`)
- **Capítulos**: `chapters/cap1.tex` a `chapters/cap8.tex`
- **Experimentos**: RF e DNN sobre CICIDS2017 e LycoS-IDS2017, com Melhorias A–G (veja `CLAUDE.md`)
- **Branch atual**: `main` (estado pré-melhorias, commit `85aee39`)
- **Branch com as melhorias**: `revisao-tcc` (local + remoto `TCC/revisao-tcc`)
- **Remote**: `TCC` → `https://github.com/ebortoto/TCC.git`

---

## Current Progress

### Todas as melhorias do arquivo `Possível Melhorias.md` foram implementadas:

| TODO | O que foi feito | Arquivo(s) |
|---|---|---|
| **TODO 9** | Frases de transição ao final de cap3, cap4 e cap6 | cap3, cap4, cap6 |
| **TODO 2** | Parágrafo na seção Objetivos explicando natureza offline/experimental | cap1 |
| **TODO 1** | "tráfego criptografado" removido da hipótese; substituído por "ataques com padrões de alta variabilidade e classes de baixo suporte" | cap1 |
| **TODO 6** | cap2 seção 2.2 reescrita para distinguir classificação supervisionada (RF/DNN) de detecção por anomalia (Autoencoder); intro do cap7 atualizada | cap2, cap7 |
| **TODO 8** | Seção `Limitações do Trabalho` adicionada no cap8 (tom de delimitação de escopo, não apologético) | cap8 |
| **TODO 7** | 9 frases longas simplificadas em cap1 e cap5 | cap1, cap5 |
| **TODO 5** | 4 redundâncias removidas no cap5 (custo computacional duplicado, "justifica" duplicado, parágrafo redundante, duas frases fundidas) | cap5 |
| **TODO 3** | Nova seção `Configuração dos modelos e ambiente computacional` no cap6 com arquitetura DNN, RF, Autoencoder e tabela de hardware/software; bug StandardScaler→MinMaxScaler corrigido | cap6 |
| **TODO 4** | Seção `Considerações Práticas` no cap8 com recomendações baseadas nos números dos experimentos | cap8 |
| **TODO 10** | 4 adições no cap7: conexões à literatura (Cantone, Ravindran, Silva) em seções críticas + nova seção `Respostas às Hipóteses` antes da Visão Geral | cap7 |
| **TODO Opcional** | Seção `Trabalhos Futuros` preenchida com 5 parágrafos temáticos (XAI, tempo real/edge, cross-dataset, TLS/HTTPS, federated learning) | cap8 |

### cap8 (Conclusão) — **COMPLETAMENTE PREENCHIDO** com:
- Parágrafo introdutório do capítulo
- `Síntese do Trabalho` (3 parágrafos: motivação, modelos/datasets, melhorias A–G)
- `Respostas às Hipóteses` (H1 refutada, H2 confirmada, com números)
- `Considerações Práticas` (RF recomendado, quando usar DNN, quando usar Autoencoder)
- `Limitações do Trabalho`
- `Trabalhos Futuros`

---

## What Worked

- Edits cirúrgicos em vez de reescritas — preservou voz acadêmica original
- Tom de "delimitação de escopo" nas limitações (não apologético)
- Conectar seções de resultados diretamente às citações do cap5 (Cantone, Ravindran, Silva)
- Simplificar frases longas quebrando em duas ao invés de reescrever do zero
- Verificar notebooks antes de escrever seção de reprodutibilidade (encontrou bug StandardScaler→MinMaxScaler)

## What Didn't Work / Avoid

- **Em-dashes (—) no texto corrido**: usuário pediu para remover, pois parecem texto escrito por IA. Usar vírgulas ou parênteses no lugar.
- **Negritos (\textbf{}) no texto corrido**: usuário pediu para remover. Reservar para tabelas/listas onde é convenção.
- **Tom apologético nas limitações**: primeira versão foi considerada "muito pesada". Preferir "o escopo delimita-se a X" em vez de "não foram realizados Y".
- **Frases excessivamente elaboradas**: usuário pediu texto mais simples. Evitar nominalizações encadeadas.
- **Não modificar scripts de laboratório** (`Laboratório/scripts/`): restrição explícita do usuário.

---

## Current File Structure

```
chapters/
├── cap1.tex  — Introdução (hipótese corrigida, parágrafo offline adicionado)
├── cap2.tex  — IDS (seção 2.2 reescrita: supervisionado vs. anomalia)
├── cap3.tex  — ML (transição para cap4 adicionada)
├── cap4.tex  — DNN (transição para cap5/cap6 adicionada)
├── cap5.tex  — Trabalhos Relacionados (redundâncias removidas, frases simplificadas)
├── cap6.tex  — Metodologia (MinMaxScaler corrigido, seção de configuração dos modelos adicionada)
├── cap7.tex  — Resultados (conexões à literatura, seção Respostas às Hipóteses adicionada)
└── cap8.tex  — Conclusão (NOVO — completamente preenchido)
```

---

## Next Steps

O TCC está substancialmente completo. O que pode ainda ser feito:

1. **Compilar o PDF** e revisar visualmente: `latexmk "TCC - Laboratorio de Intrusão.tex"` (saída em `build/`)
2. **Revisar cap8 com o próprio autor**: as seções Síntese e Respostas às Hipóteses foram escritas por IA com base nos resultados — o autor deve ajustar para sua voz pessoal
3. **Reunião com orientadora**: branch `revisao-tcc` tem todas as melhorias. Após a reunião, fazer `git merge revisao-tcc` no `main`
4. **Tabela de hardware** (cap6): está preenchida com CPU AMD Ryzen 5 5600, GPU RTX 3060, 32 GB RAM, Windows 64-bit, Python 3.12.10, TF 2.21.0, Keras 3.13.2, Sklearn 1.8.0, Pandas 3.0.1, NumPy 2.4.3
5. **Possível melhoria opcional**: adicionar abstract/resumo se exigido pela FATEC-SP (verificar normas da `fatectcc.cls`)

---

## Key Technical Details (for context)

- **Normalização**: MinMaxScaler (não StandardScaler — estava errado no texto original)
- **DNN**: 128→64 neurônios, ReLU, Dropout 0.2, Adam, 10 épocas, batch 256
- **Autoencoder**: 78→64→32→16→32→64→78, ReLU+sigmoid, Adam+MSE, 50 épocas, EarlyStopping(patience=3)
- **Random Forest**: 100 árvores, random_state=42, n_jobs=-1
- **Resultados-chave**: RF macro F1=0.86 (Baseline) vs DNN 0.67; RF macro F1=0.97 (LycoS) vs DNN 0.87; RF é 5x mais rápido
