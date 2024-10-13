# Use Python 3
FROM python:3

# Set the working directory
WORKDIR /data

# Install necessary packages for Django
RUN apt-get update && apt-get install -y python3-setuptools python3-wheel

# Install Django 3.2
RUN pip install django==3.2

# Copy the project files into the container
COPY . .

# Run the migrations command
RUN python manage.py migrate

# Expose the port
EXPOSE 8000

# Run the Django server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
