FROM condaforge/mambaforge

ARG USERNAME=noroot

COPY environment.yml /tmp/conda-tmp/environment.yml
COPY py-pde/pde /pypackages/pde
COPY py-phasesep/phasesep /pypackages/phasesep

RUN yes | mamba env update -n base -f /tmp/conda-tmp/environment.yml \
    && rm -rf tmp/conda-tmp \
    && conda clean -a

ENV PYTHONPATH=/pypackages:${PYTHONPATH}

RUN adduser ${USERNAME}

ENTRYPOINT [ "/bin/bash", "-c" "conda run", "-n", "base"]