# Use a lightweight Python base image
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY . .

# Expose the port that the application listens on
EXPOSE 8080

# Set the command to run the application
CMD ["python", "main.py"]
