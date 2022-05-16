FROM continuumio/miniconda:latest

WORKDIR /

COPY . .

# Create conda environment
RUN conda config --add channels conda-forge
RUN conda install pyaudio
# Activate conda environment
ENV PATH /opt/conda/envs/my_env/bin:$PATH
RUN /bin/bash -c "source activate my_env"
RUN conda install --yes --file requirements.txt
# Run python script
CMD ["python", "run.py"]