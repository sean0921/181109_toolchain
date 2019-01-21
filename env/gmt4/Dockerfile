FROM debian:jessie
MAINTAINER sean0921
ARG GMT_VER="4.5.12"
ARG GMT_DEBIAN_SUBVER="-1"
ARG GMT_GSHHS_VER="2.2.0"
ARG GMT_GSHHS_DEBIAN_SUBVER="-2"
RUN groupadd --gid 1000 user \
    && useradd -g user -s /bin/bash -d /work --uid 1000 user \
    && rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install --no-install-recommends -y \
                    gmt=$GMT_VER$GMT_DEBIAN_SUBVER \
                    gmt-gshhs-low=$GMT_GSHHS_VER$GMT_GSHHS_DEBIAN_SUBVER \
                    gmt-gshhs-high=$GMT_GSHHS_VER$GMT_GSHHS_DEBIAN_SUBVER \
                    gmt-gshhs-full=$GMT_GSHHS_VER$GMT_GSHHS_DEBIAN_SUBVER \
                    vim-tiny \
                    csh
ENV PATH=/usr/lib/gmt/bin/:$PATH
CMD ["GMT"]
