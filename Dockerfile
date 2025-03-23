# Use the official Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Update the package list and install Python 3 and pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy your project files into the container (optional)
# COPY . /app

# Set Python 3 as the default Python version
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Verify Python installation
RUN python --version
RUN pip3 --version

# Default command to run when the container starts
CMD ["bash"]