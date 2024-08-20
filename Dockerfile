# Use an official NVIDIA CUDA runtime as base image
FROM nvidia/cuda:11.0.3-base-ubuntu20.04

# Set the working directory in the container to /app
WORKDIR /app

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside the container
EXPOSE 80

# Run app.py when the container launches
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]