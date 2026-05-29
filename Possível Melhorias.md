# TODO — Revisão e Refinamento do TCC

## Objetivo Geral

Revisar o TCC "Desenvolvimento de um Laboratório de Detecção de Intrusão: Comparando Machine Learning e Deep Learning na Identificação de Ameaças em Redes" visando:

* corrigir inconsistências metodológicas;
* melhorar clareza e objetividade;
* reduzir redundâncias;
* fortalecer rigor científico;
* aumentar reprodutibilidade experimental;
* alinhar hipóteses, metodologia e conclusões;
* manter o tom acadêmico e técnico original.

---

# PRIORIDADE ALTA

## TODO 1 — Corrigir inconsistência da hipótese sobre tráfego criptografado [em análise]

### Problema

A hipótese afirma que Deep Learning terá desempenho superior especialmente em "tráfego criptografado", porém o trabalho não possui:

* experimentos específicos com TLS/HTTPS;
* análise de tráfego criptografado;
* datasets separados por criptografia;
* métricas relacionadas a encrypted traffic.

### Ação

Modificar a hipótese removendo a referência explícita a tráfego criptografado OU adicionar uma limitação metodológica afirmando que:

* o dataset utilizado não diferencia explicitamente tráfego criptografado;
* o trabalho não avalia IDS em cenários TLS/HTTPS específicos.

### Resultado esperado

Hipótese alinhada com os experimentos efetivamente realizados.

---

## TODO 2 — Esclarecer o significado de "Laboratório" [em análise]

### Problema

O título e o texto sugerem um laboratório IDS operacional, porém os experimentos são majoritariamente offline e baseados em datasets.

### Ação

Adicionar explicação explícita na introdução e/ou metodologia de que:

* o laboratório é experimental;
* os testes são offline;
* os modelos operam sobre datasets previamente coletados;
* não há captura em tempo real ou deploy operacional em produção.

### Resultado esperado

Evitar expectativa incorreta de um IDS fully operational.

---

## TODO 3 — Adicionar detalhes de reprodutibilidade experimental [em análise]

### Problema

Faltam informações técnicas suficientes para reprodução dos experimentos.

### Adicionar:

* hardware utilizado;
* CPU;
* GPU (se houver);
* memória RAM;
* sistema operacional;
* versão do Python;
* versões das bibliotecas;
* arquitetura detalhada da DNN;
* quantidade de camadas;
* neurônios por camada;
* função de ativação;
* optimizer;
* learning rate;
* batch size;
* número de épocas;
* dropout;
* early stopping (se utilizado).

### Resultado esperado

Aumentar rigor científico e reprodutibilidade.

---

## TODO 4 — Fortalecer conclusão prática do trabalho [em análise]

### Problema

O trabalho apresenta muitos resultados, mas ainda não responde claramente:

* qual abordagem foi mais adequada;
* qual seria recomendada na prática;
* qual trade-off realmente vale a pena.

### Ação

Adicionar seção conclusiva mais crítica e opinativa, discutindo:

* estabilidade do Random Forest;
* custo computacional da DNN;
* dificuldade de generalização supervisionada;
* impacto da qualidade do dataset;
* benefícios do Autoencoder;
* limitações reais para produção;
* cenários onde cada abordagem é mais adequada.

### Resultado esperado

Conclusão mais forte e madura academicamente.

---

# PRIORIDADE MÉDIA

## TODO 5 — Reduzir redundâncias nos Trabalhos Relacionados [em análise]

### Problema

Existem repetições frequentes dos temas:

* alto custo computacional;
* generalização;
* overfitting;
* desbalanceamento;
* interpretabilidade do Random Forest.

### Ação

Revisar os capítulos 5.1 até 5.5 para:

* condensar ideias repetidas;
* evitar reformulações equivalentes;
* destacar o diferencial específico de cada artigo.

### Resultado esperado

Texto mais fluido e menos repetitivo.

---

## TODO 6 — Melhorar separação conceitual entre: [em análise]

* classificação supervisionada;
* detecção por anomalia;
* detecção não supervisionada.

### Problema

Em alguns momentos o texto mistura:

* DNN supervisionada;
* detecção baseada em anomalia;
* Autoencoders.

### Ação

Deixar explicitamente claro:

* Random Forest e DNN baseline são classificadores supervisionados;
* apenas os Autoencoders representam efetivamente abordagem não supervisionada/anomaly-based.

### Resultado esperado

Maior rigor conceitual.

---

## TODO 7 — Simplificar períodos excessivamente longos [em análise]

### Problema

Alguns parágrafos possuem:

* excesso de formalismo;
* frases muito extensas;
* excesso de orações subordinadas.

### Ação

Reescrever períodos muito longos preservando:

* linguagem acadêmica;
* tom técnico;
* densidade científica.

Priorizar:

* clareza;
* objetividade;
* legibilidade.

### Resultado esperado

Texto mais agradável e profissional.

---

# PRIORIDADE BAIXA

## TODO 8 — Adicionar limitações explícitas do trabalho [em análise]

### Sugestões de limitações

Adicionar seção discutindo:

* uso exclusivo de datasets públicos;
* ausência de tráfego real corporativo;
* ausência de deploy em produção;
* limitações do CICIDS2017;
* dependência de rotulagem;
* ausência de avaliação em tempo real;
* ausência de tráfego criptografado explicitamente tratado.

### Resultado esperado

Maior maturidade científica.

---

## TODO 9 — Melhorar transições entre capítulos [em análise]

### Problema

Algumas transições são abruptas.

### Ação

Adicionar pequenos parágrafos conectando:

* teoria → experimentos;
* trabalhos relacionados → melhorias;
* metodologia → resultados.

### Resultado esperado

Melhor fluidez narrativa.

---

# TODO ESPECÍFICO PARA O CAPÍTULO 7

## TODO 10 — Garantir análise crítica e não apenas exposição de métricas [em análise]

### Verificar se:

* os resultados explicam POR QUE os modelos falharam;
* existe comparação crítica entre RF e DNN;
* os erros são interpretados;
* há ligação direta com os trabalhos relacionados;
* as hipóteses são confirmadas ou refutadas explicitamente.

### Resultado esperado

Capítulo de resultados mais científico e menos descritivo.

---

# TODO OPCIONAL — Possível melhoria avançada

## Adicionar seção de Trabalhos Futuros

### Sugestões

* Explainable AI (SHAP/LIME);
* IDS híbrido assinatura + anomalia;
* avaliação online/streaming;
* uso de tráfego criptografado;
* federated learning;
* avaliação cross-dataset;
* detecção em tempo real;
* modelos lightweight para edge devices.

### Resultado esperado

Encerramento mais robusto e acadêmico.

---

# RESTRIÇÕES IMPORTANTES

## NÃO alterar:

* a tese principal do trabalho;
* os resultados experimentais;
* os datasets utilizados;
* o tom acadêmico;
* a estrutura geral dos capítulos.

## PRESERVAR:

* rigor técnico;
* linguagem científica;
* comparações metodológicas;
* foco em generalização;
* análise crítica do CICIDS2017;
* organização das melhorias A–G.

---

# META FINAL

O TCC revisado deve:

* possuir consistência metodológica;
* ter maior clareza;
* apresentar melhor rigor experimental;
* reduzir redundâncias;
* fortalecer a conclusão científica;
* manter qualidade técnica elevada;
* estar adequado para avaliação de banca de graduação em tecnologia/computação.
