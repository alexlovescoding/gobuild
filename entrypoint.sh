#!/bin/bash

go build -o bin/main --ldflags '-extldflags "-static"' $@
