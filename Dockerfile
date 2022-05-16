FROM continuumio/miniconda:latest

WORKDIR /

COPY . .

# Create conda environment
RUN conda create -n venv
RUN conda config --add channels conda-forge
RUN conda install pyaudio
# Activate conda environment
ENV PATH /opt/conda/envs/my_env/bin:$PATH
RUN conda activate venv
RUN conda install --yes --file requirements.txt
# Run python script
CMD ["python", "run.py"]