FROM postgres:latest
EXPOSE 5432

RUN apt -y update
RUN apt -y install make python3 python3-pip python3.11-venv
RUN pip3 install csvkit  --break-system-packages

USER postgres
WORKDIR /data