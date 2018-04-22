FROM centos/s2i-core-centos7
MAINTAINER  mickael@azema.net
USER root
COPY requirements.txt .
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && \
    python get-pip.py && \
    pip install mkdocs -r requirements.txt

RUN yum clean all && rm -rf /var/cache
# switch to non-root for openshift usage
USER 1001