FROM quay.io/jupyter/scipy-notebook:python-3.11

USER root

ARG NB_UID=1000
ENV USER jdh
ENV NB_UID ${NB_UID}
ENV HOME /home/jdh

RUN useradd -o \
    --uid ${NB_UID} \
    jdh

RUN chown -R ${NB_UID} ${HOME}
USER jdh

RUN pip install altair
RUN pip install altair_viewer
RUN pip install pandas

WORKDIR ${HOME}

RUN python --version
