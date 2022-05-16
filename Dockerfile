FROM continuumio/miniconda3

COPY requirements.txt ./requirements.txt
# Create the environment:
RUN conda env create -f environment.yml

# Activate the environment, and make sure it's activated:
RUN conda activate myenv
RUN conda install -r requirements.txt

# The code to run when container is started:
ENTRYPOINT ["streamlit", "run"]

CMD ["app.py"]
EXPOSE 8501