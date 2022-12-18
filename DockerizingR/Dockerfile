FROM rocker/tidyverse:latest

#RUN apt-get update && apt-get install -y \ libcurl4-openssl-dev \ libssl-dev 

##We copy the file inside the container
COPY /install_packages.R /install_packages.R
COPY /script_to_run.R /script_to_run.R

## We install the packages
RUN Rscript /install_packages.R

## We execute the script
CMD ["Rscript", "script_to_run.R"]