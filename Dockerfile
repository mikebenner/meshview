# Use the official Python base image
FROM python:3.11-alpine

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY . .

# Expose the port that the application listens on
EXPOSE 8000

# Set the command to run the application
CMD ["python", "main.py"]
