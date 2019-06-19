#FROM mcr.microsoft.com/mssql-tools:latest
FROM ubuntu:latest
#
RUN apt update && apt install -y python3 python3-pip
#
RUN apt install -y curl apt-transport-https lsb-release gnupg
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/azure-cli.list
RUN apt update
RUN apt install -y azure-cli
# alias
RUN bash -c 'alias python=python3'
RUN bash -c 'alias pip=pip3'
#
##there is no pyhton2 thus, sym link python -> python3
RUN bash -c 'ln -s /usr/bin/python3 /usr/bin/python'
RUN bash -c 'ln -s /usr/bin/pip3 /usr/bin/pip'
RUN pip install --upgrade pip
#
ENV PATH="$PATH:/usr/bin/python"
ENV PATH="$PATH:/usr/bin/pip"
ENV PATH="$PATH:/opt/mssql-tools/bin"

#
RUN pip install pymssql
