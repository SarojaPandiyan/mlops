# Use a stable base image
FROM python:3.9-buster

# Update and install system dependencies
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libhdf5-dev \
    python3-dev \
    pkg-config \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy and install Python dependencies
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the necessary ports
EXPOSE 80
EXPOSE 8080
EXPOSE 5000

# Run the application
CMD ["python", "application.py"]
