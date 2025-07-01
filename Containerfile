FROM ubi9:latest

RUN dnf -y install python3-pip nano git vim-minimal && pip install rdopkg
COPY rdopkg-wrap /bin

# TODO: Switch to venv

ENTRYPOINT ["/bin/rdopkg-wrap"]
