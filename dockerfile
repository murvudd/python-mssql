FROM mcr.microsoft.com/mssql-tools:latest

# Install zip
RUN apt update && apt install -y python3.5 python3-pip

# alias
#RUN bash -c 'alias python=python3'
#RUN bash -c 'alias pip=pip3'

#there is no pyhton2 thus, sym link python -> python3
RUN bash -c 'ln -s /usr/bin/python3.5 /usr/bin/python'
RUN bash -c 'ln -s /usr/bin/pip3 /usr/bin/pip'

#ENV PATH="$PATH:/usr/bin/python"
#ENV PATH="$PATH:/usr/bin/pip"

# Print python and pip version
CMD ["which python"]
CMD ["which pip"]
CMD ["echo $PATH"]
CMD ["python -V"]
CMD ["pip -V"]


#CMD ["python"]
#CMD ["/bin/sh -c /bin/bash"]