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

#expose the endpoint to create a persistent database. Note this is not compatible with Azure Files SMB, only NFS. Not implemented currrently.
VOLUME /data

# Set the command to run the application
CMD python main.py
