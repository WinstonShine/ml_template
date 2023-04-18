#image for Machine Learning in python/jupyter notebooks
FROM gitpod/workspace-base
ARG DEBIAN_FRONTEND=noninteractive
ARG USER=gitpod
USER root
EXPOSE 8888:8888/tcp

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
    scikit-learn

ENV XDG_CACHE_HOME="/home/${USER}/.cache/"
RUN MPLBACKEND=Agg python3 -c "import matplotlib.pyplot"

#create and edit jupyter notebook config file
RUN jupyter notebook --generate-config && \
    echo "c.NotebookApp.allow_origin = '*'" > /home/gitpod/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.open_browser = False" > /home/gitpod/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.ip = '0.0.0.0'" > /home/gitpod/.jupyter/jupyter_notebook_config.py