FROM mcr.microsoft.com/mssql-tools:latest
#
RUN apt update && apt install -y python3.5 python3-pip \
#    freetds-bin \
#    freetds-common \
#    freetds-dev
#
#
# alias
RUN bash -c 'alias python=python3'
RUN bash -c 'alias pip=pip3'
#
##there is no pyhton2 thus, sym link python -> python3
RUN bash -c 'ln -s /usr/bin/python3.5 /usr/bin/python'
RUN bash -c 'ln -s /usr/bin/pip3 /usr/bin/pip'
#RUN bash -c 'pip install --upgrade pip'
RUN pip install --upgrade pip
#
ENV PATH="$PATH:/usr/bin/python"
ENV PATH="$PATH:/usr/bin/pip"
ENV PATH="$PATH:/opt/mssql-tools/bin"

#
#
#RUN pip install Cython
##ADD . /opt/src/pymssql/
##RUN pip install /opt/src/pymssql
RUN pip install pymssql
#
##CMD ["python"]
##CMD ["/bin/sh -c /bin/bash"]
#FROM python:3.6
#RUN pip install pymssql
