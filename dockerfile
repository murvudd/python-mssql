FROM mcr.microsoft.com/mssql-tools:latest

# Install zip
RUN apt update && apt install -y python3.5 python3-pip

# alias
RUN bash -c 'alias python=python3'
RUN bash -c 'alias pip=pip3'

# Print python and pip version
RUN bash -c 'python -V'
RUN bash -c 'pip -V'

CMD ["python"]