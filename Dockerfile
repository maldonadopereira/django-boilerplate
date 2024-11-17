FROM python:3.11.9-slim

# Atualizar os pacotes e instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    bash \
    openssl

# Definir diretório de trabalho
WORKDIR /app

# Copiar o Pipfile e Pipfile.lock
COPY Pipfile Pipfile.lock /app/

# Instalar pipenv e as dependências do projeto
RUN pip install pipenv && pipenv install --deploy --ignore-pipfile

# Instalar o gunicorn
RUN pipenv install gunicorn

# Copiar o código da aplicação
COPY . /app/

# Copiar o arquivo .env para o container
COPY contrib/env-example /app/.env

# Copiar o script de inicialização
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Definir o entrypoint para o script de inicialização
ENTRYPOINT ["/entrypoint.sh"]

# Expor a porta 8000
EXPOSE 8000
