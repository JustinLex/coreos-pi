# coreos-pi

ghcr.io/justinlex/coreos-pi

The real magic is in the guestfish container I wrote that contains 
the scripts used to mount the disk image without root and install the files we need onto the image.

## How to use
Use Raw 4K native image

`docker run -v $PWD:/root/src:Z -it --rm ghcr.io/justinlex/coreos-pi fedora-coreos-36.20220723.3.1-metal4k.x86_64.raw.xz`
