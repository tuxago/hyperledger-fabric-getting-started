#!/bin/bash

export ARCH=$(uname -s|tr '[:upper:]' '[:lower:]'|sed 's/mingw64_nt.*/windows/')-$(go env GOARCH)
export ARCH=linux-amd64

curl https://nexus.hyperledger.org/service/local/repositories/releases/content/org/hyperledger/fabric/fabric-binary/${ARCH}-1.0.0-alpha2/fabric-binary-${ARCH}-1.0.0-alpha2.tar.gz | tar xz
cd release/${ARCH}
sh download-dockerimages.sh -c $(uname -m)-1.0.0-alpha2 -f $(uname -m)-1.0.0-alpha2
docker images


