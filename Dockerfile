FROM python:3.11-slim

WORKDIR /app

RUN pip install --no-cache-dir Flask==3.1.1 gunicorn==23.0.0

COPY app.py .

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
