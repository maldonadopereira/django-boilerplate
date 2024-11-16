#!/bin/bash

# Aguardar o banco de dados iniciar
echo "Aguardando o banco de dados iniciar..."
sleep 10

# Rodar as migrações
echo "Rodando migrações..."
pipenv run python manage.py migrate --noinput

# Coletar arquivos estáticos
echo "Coletando arquivos estáticos..."
pipenv run python manage.py collectstatic --noinput

# Rodar o Gunicorn
echo "Iniciando o Gunicorn..."
pipenv run gunicorn app.wsgi:application --bind 0.0.0.0:8000
