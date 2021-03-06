FROM python:3.8

WORKDIR app/

# Copy req file then install everything necessary to run Django/REST API
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . ./

EXPOSE 8000

# Defining args with no value which is only there...
ARG QOVERY_DATABASE_MY_POSTGRESQL_3498225_DATABASE
ARG QOVERY_DATABASE_MY_POSTGRESQL_3498225_USERNAME
ARG QOVERY_DATABASE_MY_POSTGRESQL_3498225_PASSWORD
ARG QOVERY_DATABASE_MY_POSTGRESQL_3498225_HOST
ARG QOVERY_DATABASE_MY_POSTGRESQL_3498225_PORT

# ...To pass through the value to our environment variables
# Our env variables will be useful for migration during docker build
ENV QOVERY_DATABASE_MY_POSTGRESQL_3498225_DATABASE ${QOVERY_DATABASE_MY_POSTGRESQL_3498225_DATABASE}
ENV QOVERY_DATABASE_MY_POSTGRESQL_3498225_USERNAME ${QOVERY_DATABASE_MY_POSTGRESQL_3498225_USERNAME}
ENV QOVERY_DATABASE_MY_POSTGRESQL_3498225_PASSWORD ${QOVERY_DATABASE_MY_POSTGRESQL_3498225_PASSWORD}
ENV QOVERY_DATABASE_MY_POSTGRESQL_3498225_HOST ${QOVERY_DATABASE_MY_POSTGRESQL_3498225_HOST}
ENV QOVERY_DATABASE_MY_POSTGRESQL_3498225_PORT ${QOVERY_DATABASE_MY_POSTGRESQL_3498225_PORT}

# Go to the Django project, will be more confortable
WORKDIR simpleexampledjango/

# Get all local model change from 'app' to prepare a migration to DB
RUN python manage.py makemigrations app

# Sync DB with prepared migration
RUN python manage.py migrate app

# Run the server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
