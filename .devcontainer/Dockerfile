FROM rocker/r-ver:4.3.2 as base
RUN /rocker_scripts/setup_R.sh \
    https://packagemanager.posit.co/cran/__linux__/jammy/2023-11-20
    # https://code.visualstudio.com/docs/devcontainers/create-dev-container#:~:text=Note%3A%20The%20DEBIAN_FRONTEND%20export%20avoids%20warnings%20when%20you%20go%20on%20to%20work%20with%20your%20container.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive

# Install Latest Quarto
RUN apt-get install -y --no-install-recommends \
    gdebi-core pandoc curl \
    && rm -rf /var/lib/apt/lists/*
RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb

# Install R packages
RUN install2.r --error \
    rstan \
    broom \
    quarto \
    checkmate \
    ggplot2 \
    purrr \
    targets\
    && rm -rf /tmp/downloaded_packages \
    && strip /usr/local/lib/R/site-library/*/libs/*.so

FROM base as development
# https://www.makeuseof.com/install-python-ubuntu/
# install radian and python
RUN apt-get update && apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa && apt-get update
RUN apt-get -y install python3.11 python3-pip git
RUN pip3 install radian
# https://github.com/randy3k/radian/issues/446
RUN pip3 install --force-reinstall prompt-toolkit==3.0.39
# end install radian

# Packages needed for development with vscode
RUN install2.r --error \
    languageserver jsonlite rlang httpgd