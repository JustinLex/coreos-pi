FROM ghcr.io/justinlex/guestfish:86c97703f8e416e2524fa7d09606e4b26972c3b9

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
          zip \
          unzip

COPY guestfish_commands/bootpart-commands.txt /root/bootpart-commands.txt
COPY guestfish_commands/ignition-commands.txt /root/ignition-commands.txt

COPY install_coreos.sh /root/install_coreos.sh

ENTRYPOINT ["/usr/bin/bash", "./install_coreos.sh"]
