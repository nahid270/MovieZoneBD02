# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port the app runs on
EXPOSE 8080

# Define the command to run the application
# This command runs the Gunicorn server, binding it to the correct host and port
# 'app:app' means: in the 'app.py' file, find the Flask object named 'app'
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
