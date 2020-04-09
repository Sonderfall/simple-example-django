FROM python:3.8

WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .

EXPOSE 80
CMD ["python", "simpleexampledjango/manage.py", "runserver", "0.0.0.0:8000"]