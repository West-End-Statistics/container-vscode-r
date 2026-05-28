FROM westendstatistics/rstats-dev:r4.5.2-20260320 AS base

USER root
# Other packages to install - move away from dev when ready
# RUN install2.r --error \
#     bayesDP furrr memoise plotly

USER vscode

# Create directory so it's easy to install packages on the fly if needed
RUN Rscript -e "dir.create(path = Sys.getenv('R_LIBS_USER'), showWarnings = FALSE, recursive = TRUE)"
RUN   echo ".libPaths(Sys.getenv('R_LIBS_USER'))" >> /home/vscode/.Rprofile

