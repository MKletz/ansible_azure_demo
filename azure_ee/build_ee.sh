python3.8 -m venv appenv
source appenv/bin/activate
pip install --upgrade pip
pip3 install ansible-builder
ansible-builder build --tag azure_ee --container-runtime podman

podman login docker.io
podman push azure_ee docker.io/mkletz/azure_ee
