# Use the official Python base image
FROM python:3.11-alpine

# Install system dependencies
RUN apk add --no-cache graphviz

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY . .

# Ensure the /data directory exists
RUN mkdir -p /data

# Expose the port the application listens on
EXPOSE 8000

VOLUME /data

# Set the command to run the application
CMD python main.py
