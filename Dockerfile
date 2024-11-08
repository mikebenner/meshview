# Use Alpine Linux as the base image
FROM alpine:latest

# Install Python3 and pip
RUN apk add --no-cache python3 py3-pip

# Set the working directory
WORKDIR /app

# Create and activate a virtual environment, then install dependencies
RUN python3 -m venv /app/venv \
    && . /app/venv/bin/activate \
    && pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY . .

# Expose the port that the application listens on
EXPOSE 8000

# Set the command to run the application using the virtual environment
CMD ["/app/venv/bin/python", "main.py"]
