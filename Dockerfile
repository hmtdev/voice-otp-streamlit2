# Define base image
FROM continuumio/miniconda3
 
# Set working directory for the project
# Create Conda environment from the YAML file
COPY . .
RUN conda create --name myenv
 
# Activate Conda environment and check if it is working properly
RUN conda activate myenv
RUN source activate myenv
RUN conda install --file requirements.txt
RUN conda install 
# Python program to run in the container
COPY run.py .
ENTRYPOINT ["python", "run.py"]