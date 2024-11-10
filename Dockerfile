FROM postgres:latest

RUN apt -y update
RUN apt -y install make python3 python3-pip python3.11-venv

WORKDIR /app

# testing for convenience
RUN python3 -m venv venv --prompt py_in_docker \
    . ./venv/bin/activate \
    pip3 install csvkit


EXPOSE 5432
USER postgres