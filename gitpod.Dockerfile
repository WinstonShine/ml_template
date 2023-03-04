#image for Machine Learning in python/jupyter notebooks
FROM gitpod/workspace-base
ARG DEBIAN_FRONTEND=noninteractive
ARG USER=gitpod
USER root
EXPOSE 8888:8888/tcp

#set path for python&pip
ENV PATH="${PATH}:/usr/bin/python3"
ENV PATH="${PATH}:/usr/bin/pip"

WORKDIR /workspace

#update apt-get packages
RUN sudo apt-get update --yes && \
    sudo apt-get install --yes --no-install-recommends python3 \
                                                       python3-pip

USER ${USER}

#install requirements
RUN pip install --no-cache-dir \
    ipykernel \
    matplotlib \
    pandas \
    scipy \
    sqlalchemy \
    numpy \
    notebook \
    scikit-learn && \
    python3 -m ipykernel install

ENV XDG_CACHE_HOME="/home/${USER}/.cache/"
RUN MPLBACKEND=Agg python3 -c "import matplotlib.pyplot"

