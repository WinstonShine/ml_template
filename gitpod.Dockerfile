#image for Machine Learning in python/jupyter notebooks
FROM gitpod/workspace-base
ARG DEBIAN_FRONTEND=noninteractive
ARG USER=gitpod
USER root
EXPOSE 8888:8888/tcp

#install conda
ENV CONDA_DIR=/opt/conda
ENV PATH="${PATH}:/usr/bin/python3"
ENV PATH="${PATH}:/usr/bin/pip"

#update apt-get packages and install mamba
USER ${USER}
RUN sudo apt-get update --yes && \
    sudo apt-get install --yes --no-install-recommends python3 python3-pip

#install requirements
RUN pip install \
    matplotlib \
    pandas \
    scipy \
    sqlalchemy \
    numpy \
    notebook \
    scikit-learn

ENV XDG_CACHE_HOME="/home/${USER}/.cache/"
RUN MPLBACKEND=Agg python3 -c "import matplotlib.pyplot"

WORKDIR /workspace