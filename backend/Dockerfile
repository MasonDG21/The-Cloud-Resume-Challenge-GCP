# Official python image. 3.9-slim to keep the container small.
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy dependencies to the working dir
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the content of the local src directory to the working directory.
COPY . .

# specify the command to run on container start
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app
# CMD: specifies the command
# exec: Ensures that 'gunicorn' runs as the containers main process.
# gunicorn: a production-grade WSGI HTTP Server for python.
# --bind :$PORT: Binds to the port specified by the PORT environment variable. (This is set by Cloud Run automatically)
# --workers 1 --threads 8: Configures gunicorn to use 1 worker process with 8 threads.
# --timeout 0: Disables the timeout for long-running requests.
# main:app: Tells gunicorn to use the 'app' object from the main.py file.
# Purpose: This defines how the flask app will run when the container starts.

# Build: docker build -t gcr.io/<PROJECT_ID>/<SERVICE_NAME> .
# Deploy: docker run -p 8080:8080 gcr.io/<PROJECT_ID>/<SERVICE_NAME>

