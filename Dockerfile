# Use the official Jupyter base image
FROM quay.io/jupyter/base-notebook:latest

# Set the working directory
WORKDIR /home/jovyan/work

# Copy requirements
COPY requirements.txt /home/jovyan/work/

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the notebooks and static assets into the container
COPY notebooks /home/jovyan/work/notebooks
COPY _static /home/jovyan/work/_static

# Expose the port that Jupyter Notebook will run on
EXPOSE 8888

# Start Jupyter Notebook server
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]
