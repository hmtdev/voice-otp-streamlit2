FROM continuumio/miniconda:latest

WORKDIR /

COPY . .

# Create conda environment
RUN conda create -n venv
RUN conda config --add channels conda-forge
RUN conda install pyaudio
# Activate conda environment
RUN conda activate venv
RUN conda install --yes --file requirements.txt
# Run python script
CMD ["streamlit","run", "app.py"]