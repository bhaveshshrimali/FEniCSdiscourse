FROM dbaroliaices/mgisfenics:latest
# FROM quay.io/fenicsproject/dev:latest

# create user with a home directory
ARG NB_USER
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

# Copy home directory for usage in binder
WORKDIR ${HOME}
COPY . ${HOME}
RUN pip3 install --no-cache-dir jupyterhub notebook gmsh-sdk
RUN pip3 install --upgrade numpy scipy matplotlib pandas numba
# RUN cd ~ && \
#     git clone https://gitlab.com/materiaux/materiaux.git && \
#     cd materiaux && \
#     pip3 install -U -e .

USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
ENTRYPOINT []