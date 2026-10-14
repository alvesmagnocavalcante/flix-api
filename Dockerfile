FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PYTHONUNBUFFERED=1

CMD ["sh", "-c", "exec gunicorn app.wsgi:application --bind 0.0.0.0:${PORT:-8080} --workers 2"]
