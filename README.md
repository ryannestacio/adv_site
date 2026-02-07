# Vasconcelos Advocacia - Plataforma Web Institucional

**Desenvolvido por AllTech TI**

Este projeto consiste no desenvolvimento de uma aplicação web institucional para o escritório de advocacia Vasconcelos & Associados. O objetivo principal é estabelecer a presença digital do escritório, apresentar áreas de atuação e facilitar o contato com clientes através de integrações diretas.

## Status do Projeto

**Fase Atual:** Execução (Desenvolvimento)
O projeto encontra-se em etapa ativa de codificação. A estrutura base e a landing page estão funcionais, porém sujeitas a alterações de layout e refatoração de código conforme o ciclo de desenvolvimento avança.

### Acesso ao Ambiente de Teste (Staging)
A versão mais recente do projeto pode ser visualizada no seguinte endereço:
- **URL:** https://vasconceloadvse.web.app

---

## Tecnologias Utilizadas

O projeto foi construído visando escalabilidade, performance e manutenibilidade, utilizando as seguintes tecnologias:

### Core
- **Flutter (Framework):** Utilizado para o desenvolvimento da interface de usuário (UI), permitindo a criação de um design responsivo e consistente.
- **Dart (Linguagem):** Linguagem base para toda a lógica de negócio e estruturação do projeto.

### Infraestrutura e Deploy
- **Firebase Hosting:** Hospedagem da aplicação web, garantindo alta disponibilidade, certificado SSL automático e integração contínua.

### Dependências Principais
- **url_launcher:** Gerenciamento de links externos e deeplinks (WhatsApp, Instagram, Discagem telefônica).
- **google_fonts:** Tipografia otimizada para web.

---

## Arquitetura do Projeto

O projeto segue uma estrutura de pastas baseada em funcionalidades (Feature-First) para garantir a organização e facilitar a escalabilidade futura (adição de módulos de login, blog, etc.).

```text
lib/
├── core/                  # Recursos compartilhados globalmente
│   ├── assets/            # Imagens e vetores
│   ├── theme/             # Definições de tema (Cores, Fontes)
│   └── utils/             # Utilitários e constantes
│
├── features/              # Módulos funcionais da aplicação
│   └── landing_page/      # Módulo da página inicial
│       ├── presentation/
│       │   ├── pages/     # Telas completas (Scaffolds)
│       │   └── widgets/   # Componentes reutilizáveis (Cards, Header, Footer)
│
└── main.dart              # Ponto de entrada e configuração de rotas