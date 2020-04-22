FROM python:3.8

WORKDIR app/

# Copy req file then install everything necessary to run Django/REST API
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . ./

EXPOSE 8000

# Go to the Django project, will be more confortable
WORKDIR simpleexampledjango/

# Get all local model change from 'app' to prepare a migration to DB
RUN python manage.py makemigrations app

# Sync DB with prepared migration
RUN python manage.py migrate app

# Run the server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
