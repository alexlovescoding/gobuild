FROM fedora:latest

COPY entrypoint.sh /

RUN dnf install -y wget tar
RUN wget https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz && \
	tar -C /usr/local -xvf go1.7.1.linux-amd64.tar.gz
ENV PATH /usr/local/go/bin:$PATH

ENV GOPATH /code

ENV CGO_ENABLED 0

VOLUME /code
WORKDIR /code

ENTRYPOINT ["/entrypoint.sh"]
