FROM continuumio/miniconda:latest

WORKDIR /home/docker_conda_template

COPY . .

# Create conda environment
RUN conda env create -f environment.yml

# Activate conda environment
ENV PATH /opt/conda/envs/my_env/bin:$PATH
RUN /bin/bash -c "source activate my_env"

# Run python script
RUN pip3 install -r requirements.txt
CMD streamlit run app.py

# RUN /bin/bash -c ". activate myenv && \
#     pip install pandas && \ 
#     pip install ../mylocal_package/