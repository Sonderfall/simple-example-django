FROM python:3.8

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . ./

EXPOSE 8000
RUN python simpleexampledjango/manage.py makemigrations 
#RUN python simpleexampledjango/manage.py migrate
CMD ["python", "simpleexampledjango/manage.py", "runserver", "0.0.0.0:8000"]
