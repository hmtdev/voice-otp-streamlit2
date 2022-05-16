FROM continuumio/miniconda3

WORKDIR /app
COPY . . 
# Create the environment:
RUN conda env create -f environment.yml

# Activate the environment, and make sure it's activated:
RUN conda activate myenv
RUN pip install -r requirements.txt
RUN echo "Make sure flask is installed:"
RUN python -c "import flask"

# The code to run when container is started:
ENTRYPOINT ["streamlit","run","app.py"]