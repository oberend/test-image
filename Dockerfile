FROM condaforge/mambaforge AS build

# Copy dependencies
COPY environment.yml /tmp/conda-tmp/

# Install conda-pack and create environment from dependencies
RUN mamba install conda-pack \
    && mamba env create -f /tmp/conda-tmp/environment.yml

# Pack myenv
RUN conda-pack -n myenv -o /tmp/conda-tmp/myenv.tar.gz