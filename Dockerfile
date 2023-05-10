# Dockerfile to create lab image in which FEM BEM examples can be run using FEniCSx and Bempp-cl

ARG TINI_VERSION=0.19.0


FROM bempp/cl-dev-env-with-dolfinx:latest as lab
LABEL maintainer="Matthew Scroggs <bempp@mscroggs.co.uk>"
LABEL description="Bempp-cl and FEniCSx lab image with FEM-BEM examples"

ARG TINI_VERSION

WORKDIR /tmp
RUN git clone https://github.com/bempp/bempp-cl
RUN cd bempp-cl && python3 -m pip install .

# Clear /tmp
RUN rm -rf /tmp/*

WORKDIR /root

RUN git clone https://github.com/MichalBosy/FEM_BEM_coupling.git

ARG TINI_VERSION
ADD https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini /tini
RUN chmod +x /tini && \
    python3 -m pip install --no-cache-dir jupyter jupyterlab plotly
EXPOSE 8888/tcp

ENTRYPOINT ["/tini", "--", "jupyter", "lab", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]


