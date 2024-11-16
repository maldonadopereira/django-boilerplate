# Django Boilerplate (Em Desenvolvimento.)

Este é um boilerplate para iniciar novos projetos Django com Docker, PostgreSQL, Redis, Celery, e CI/CD com GitHub Actions.

## Features

- Docker para a aplicação e banco de dados PostgreSQL.
- Redis e Celery configurados para tarefas assíncronas. (Em Desenvolvimento)
- GitHub Actions configurado para CI/CD (flake8 e pytest).
- django-debug-toolbar para depuração em desenvolvimento.
- Configuração do banco de dados via dj-database-url.

## Como começar

1. Clone o repositório:
    ```bash
    git clone https://github.com/maldonadopereira/django-boilerplate.git
    cd django-boilerplate
    ```

2. Instale as dependências:
    ```bash
    pipenv install
    ```

3. Crie o banco de dados:
    ```bash
    python manage.py migrate
    ```

4. Rode o servidor:
    ```bash
    python manage.py runserver
    ```

5. Acesse `http://127.0.0.1:8000/` no seu navegador.
