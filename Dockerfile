FROM python:3.11.9-slim

# Atualizar os pacotes e instalar dependências necessárias
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    bash

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

# Copiar o script de inicialização para o container
COPY entrypoint.sh /app/entrypoint.sh

# Tornar o script de inicialização executável
RUN chmod +x /app/entrypoint.sh

# Expor a porta 8000
EXPOSE 8000

# Configurar o ponto de entrada para rodar o script de inicialização
ENTRYPOINT ["/app/entrypoint.sh"]
