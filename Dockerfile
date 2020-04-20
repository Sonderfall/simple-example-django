FROM python:3.8

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . ./

EXPOSE 8000

# Get all local model change from 'app' to prepare a migration to DB
RUN python simpleexampledjango/manage.py makemigrations app

# Sync DB with prepared migration
RUN python simpleexampledjango/manage.py migrate app

# Run the server
CMD ["python", "simpleexampledjango/manage.py", "runserver", "0.0.0.0:8000"]
