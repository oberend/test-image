FROM condaforge/mambaforge AS build

# Copy dependencies
COPY environment.yml /tmp/conda-tmp/

# Install dependencies