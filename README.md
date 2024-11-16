# Django Boilerplate (Em Desenvolvimento)

Este é um boilerplate para iniciar novos projetos Django com Docker, PostgreSQL, Redis, Celery, e CI/CD com GitHub Actions.

## Features

- Docker para a aplicação e banco de dados PostgreSQL.
- Redis e Celery configurados para tarefas assíncronas. (Em Desenvolvimento)
- GitHub Actions configurado para CI/CD (flake8 e pytest).
- django-debug-toolbar para depuração em desenvolvimento.
- Configuração do banco de dados via `dj-database-url`.

## Como começar

### Pré-requisitos

Certifique-se de que o Docker e o Docker Compose estão instalados em sua máquina. Caso não tenha, siga os passos para instalar o Docker e o Docker Compose:

- [Instalar Docker](https://docs.docker.com/get-docker/)
- [Instalar Docker Compose](https://docs.docker.com/compose/install/)

### Passos para configurar o ambiente com Docker

1. Clone o repositório:
    ```bash
    git clone https://github.com/maldonadopereira/django-boilerplate.git
    cd django-boilerplate
    ```

2. Construa e inicie os containers Docker:
    ```bash
    docker-compose up --build -d
    ```

   Isso vai iniciar os containers para o banco de dados PostgreSQL, a aplicação Django e o Nginx. Ele também cria um ambiente virtual para a aplicação e instala as dependências definidas no `Pipfile`.

3. Para rodar o servidor Django com Gunicorn, o comando já foi configurado no Dockerfile, então você pode iniciar o servidor com:
    ```bash
    docker-compose up
    ```

   O Gunicorn será iniciado na porta 8000 e você poderá acessar a aplicação via `http://127.0.0.1:8000/`.

4. Acesse `http://127.0.0.1:8000/` no seu navegador.

### Outras operações com Docker

- **Para parar os containers:**
    ```bash
    docker-compose down
    ```

- **Para visualizar os logs dos containers:**
    ```bash
    docker-compose logs -f
    ```

- **Para rodar um comando dentro do container da aplicação (exemplo: rodar shell do Django):**
    ```bash
    docker-compose exec web /bin/bash
    ```

- **Para rodar o servidor Django no container diretamente (se necessário):**
    ```bash
    docker-compose exec web python manage.py runserver
    ```

---

Este modelo agora usa Docker para isolar o ambiente de desenvolvimento, garantindo que a aplicação, banco de dados e dependências sejam configurados corretamente dentro dos containers.
