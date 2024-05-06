FROM python:3.8-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip install django

COPY . /app/

RUN python3 manage.py makemigrations
RUN python3 manage.py migrate

EXPOSE 8000

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]



