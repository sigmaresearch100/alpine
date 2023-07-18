#!/bin/sh

set -e

cat > /etc/apk/repositories << EOF; $(echo)

https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/main/
https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/community/
https://dl-cdn.alpinelinux.org/alpine/edge/testing/

EOF

apk update
apk add --no-cache R
R -e "if (!require('remotes')) install.packages('remotes')"
R -e "remotes::install_github('ijapesigan/rProject')"
R -e "library(rProject) ; sessionInfo()"

#apk add --no-cache \
#    docker         \
#    apptainer      \
#    parallel

#docker --version
#apptainer --version
#parallel --version
