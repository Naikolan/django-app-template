FROM python:3

WORKDIR /miapp

COPY requirements.txt /miapp/

RUN pip install -r requirements.txt

COPY . /miapp/

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]