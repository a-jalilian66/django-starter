#!/bin/sh

echo "Waiting for database..."

while ! nc -z db 5432; do
  sleep 1
done

echo "Database is ready, starting migrations..."

python manage.py makemigrations
python manage.py migrate

echo "Starting Django server..."
python manage.py runserver 0.0.0.0:8003