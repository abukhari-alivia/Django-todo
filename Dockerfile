# Use an Ubuntu base image with Python pre-installed
FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install Python and other necessary packages
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-dev python3-setuptools python3-wheel build-essential && \
    apt-get clean

# Install Django 3.2
RUN pip3 install django==3.2

# Set the working directory
WORKDIR /data

# Copy the project files into the container
COPY . .

# Run the migrations command
RUN python3 manage.py migrate

# Expose the port
EXPOSE 8000

# Run the Django server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
