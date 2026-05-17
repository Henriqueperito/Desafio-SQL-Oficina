# 🛠️ Projetos de Modelagem de Banco de Dados SQL

Este repositório reúne desafios de modelagem conceitual e lógica desenvolvidos no MySQL Workbench para compor meu portfólio técnico.

---

## 🏬 Projeto 1: Refinamento de E-commerce
Modelo de e-commerce expandido para suportar regras complexas de negócios.
- **Destaques:** Separação de clientes por herança (Pessoa Física e Jurídica), múltiplos meios de pagamento vinculados por cliente e controle unificado de logística de entregas.

---

## 🔧 Projeto 2: Sistema de Controle de Oficina Mecânica
Esquema conceitual criado totalmente do zero com base na narrativa de levantamento de requisitos de uma oficina.

### 📋 Decisões de Modelagem:
- **Gestão de Equipes:** Para atender ao requisito de que um veículo é direcionado a uma equipe, isolamos a entidade `Equipe` da entidade `Mecanico`, conectando-as por uma tabela intermediária N:M. Isso garante flexibilidade para os profissionais mudarem de equipe conforme a demanda.
- **Ordem de Serviço (OS) Otimizada:** Centraliza o controle de status, numeração e datas. O relacionamento foi configurado como não-identificável para manter a integridade referencial sem poluir a tabela com chaves compostas redundantes do cliente.
- **Cálculo de Orçamentos:** Tabelas associativas conectam a OS aos catálogos de `Peças` e `Serviços` (Mão de Obra), permitindo calcular o valor total de forma granular.

## 🚀 Tecnologias Utilizadas
- MySQL Server
- MySQL Workbench
- Git / GitHub
