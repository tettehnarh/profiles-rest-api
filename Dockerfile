# Use the official Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install Python 3, pip, and virtualenv
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Create a virtual environment in the root of the container
RUN python3 -m venv /venv

# Activate the virtual environment and upgrade pip
RUN /venv/bin/python -m pip install --upgrade pip

# Copy the requirements.txt file into the container
COPY requirements.txt /tmp/requirements.txt

# Install dependencies from requirements.txt into the virtual environment
RUN /venv/bin/python -m pip install -r /tmp/requirements.txt

# Set the working directory
WORKDIR /app

# Copy the rest of the application code into the container
COPY . /app

# Set the virtual environment as the default Python environment
ENV PATH="/venv/bin:$PATH"

# Expose port 8000 (if your application uses it)
EXPOSE 8000

# Default command to run when the container starts
CMD ["bash"]