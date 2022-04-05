FROM condaforge/mambaforge

ARG USERNAME=noroot

COPY environment.yml /tmp/conda-tmp/environment.yml
COPY py-pde /pypackages/py-pde
COPY py-phasesep /pypackages/py-phasesep

RUN yes | mamba env update -n base -f /tmp/conda-tmp/environment.yml \
    && rm -rf tmp/conda-tmp \
    && conda clean -a

ENV PYTHONPATH=/pypackages/py-pde:/pypackages/py-phasesep:${PYTHONPATH}

RUN adduser ${USERNAME}