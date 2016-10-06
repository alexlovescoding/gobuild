FROM fedora:latest

RUN dnf install -y wget tar
RUN wget https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz && \
	tar -C /usr/local -xvf go1.7.1.linux-amd64.tar.gz
ENV PATH /usr/local/go/bin:$PATH

ENV CGO_ENABLED 0

VOLUME /build
WORKDIR /build

CMD go build -o bin/main --ldflags '-extldflags "-static"' main.go
