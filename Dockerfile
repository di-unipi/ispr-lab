# Use the official Ubuntu LTS 24.04 as a base image
FROM ubuntu:24.04

# Set environment variables to prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory to /app
WORKDIR /app

# Copy the requirements.txt file
COPY requirements.txt ./

# Install Python dependencies
RUN pip3 install -r requirements.txt --break-system-packages

# Mount the notebooks folder to /app/notebooks
# This ensures that edits in the notebooks folder are stored in the original folder
VOLUME /app/notebooks

# Mount the _static folder to /app/_static
# This provides access to images and various assets
VOLUME /app/_static

# Expose the default Jupyter Notebook port
EXPOSE 8888

# Command to run Jupyter Notebook
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
