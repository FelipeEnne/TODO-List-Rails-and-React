# TODO List — Rails + React

Aplicação de lista de tarefas construída com **Ruby on Rails 7.2** no backend e **React 18** no frontend, com autenticação via **Devise**.

## Stack

| Camada | Tecnologia |
|--------|------------|
| Backend | Ruby 3.2.11, Rails 7.2, PostgreSQL |
| Frontend | React 18, Bootstrap 5, Bootstrap Icons |
| Assets | esbuild, Sass, Propshaft |
| Hotwire | Turbo Rails, Stimulus |
| Autenticação | Devise |

## Pré-requisitos

- [Ruby](https://www.ruby-lang.org/) 3.2.11 (veja `.ruby-version`)
- [Bundler](https://bundler.io/)
- [Node.js](https://nodejs.org/) e [Yarn](https://yarnpkg.com/)
- [PostgreSQL](https://www.postgresql.org/) em execução

No Windows, configure o PostgreSQL com `host: localhost` em `config/database.yml` se necessário.

## Instalação

```bash
bin/setup
```

Esse script instala as dependências Ruby e JavaScript, compila os assets e prepara o banco de dados.

Alternativamente, passo a passo:

```bash
bundle install
yarn install
yarn build && yarn build:css
bin/rails db:prepare
```

## Desenvolvimento

Inicie o servidor Rails e os watchers de assets com um único comando:

```bash
bin/dev
```

Isso executa o `Procfile.dev`:

- **web** — servidor Rails (`bin/rails server`)
- **js** — esbuild em modo watch
- **css** — Sass em modo watch

A aplicação ficará disponível em [http://localhost:3000](http://localhost:3000).

### Rotas

| Rota | Descrição |
|------|-----------|
| `/` | Página inicial |
| `/pages/my_todo_items` | Lista de tarefas do usuário |

### React

Componentes React ficam em `app/javascript/components/`. O ponto de montagem é o elemento `#react-root` no layout da aplicação. Novos componentes devem ser importados e montados em `app/javascript/application.js`.

## Scripts de assets

```bash
yarn build          # Compila JavaScript (esbuild)
yarn build:watch    # Compila JS com watch
yarn build:css      # Compila CSS (Sass)
yarn build:css:watch # Compila CSS com watch
```

## Banco de dados

```bash
bin/rails db:create    # Cria os bancos
bin/rails db:migrate   # Executa migrations
bin/rails db:seed      # Popula dados iniciais
bin/rails db:prepare   # Cria, migra e carrega o schema
```

Bancos padrão:

- `todo-application_development`
- `todo-application_test`
- `todo-application_production`

## Produção

Antes do deploy, compile os assets:

```bash
yarn build && yarn build:css
RAILS_ENV=production bin/rails assets:precompile
```

Variáveis de ambiente relevantes:

- `TODO-APPLICATION_DATABASE_PASSWORD` — senha do PostgreSQL
- `RAILS_MASTER_KEY` — chave para credentials
- `RAILS_SERVE_STATIC_FILES` — defina como `true` se o servidor não servir arquivos estáticos
- `RAILS_LOG_TO_STDOUT` — redireciona logs para stdout

## Estrutura do projeto

```
app/
├── controllers/          # Controllers Rails
├── javascript/
│   ├── application.js    # Entry point JS (Turbo, Stimulus, React)
│   ├── components/       # Componentes React
│   └── controllers/      # Controllers Stimulus
├── assets/
│   ├── builds/           # Assets compilados (gerados)
│   └── stylesheets/      # Sass (Bootstrap)
└── views/                # Templates ERB
config/
├── database.yml
└── routes.rb
```

## Licença

Projeto privado.
