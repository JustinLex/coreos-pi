FROM ghcr.io/justinlex/guestfish:8e7d118dd05136c3f798db19831f2836e6d47219

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
          zip \
          unzip

COPY bootpart-commands.txt /root/bootpart-commands.txt
COPY ignition-commands.txt /root/ignition-commands.txt

COPY install_coreos.sh /root/install_coreos.sh

ENTRYPOINT ./install_coreos.sh
