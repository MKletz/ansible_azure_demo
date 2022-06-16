python3.8 -m venv appenv
source appenv/bin/activate
pip3 install --upgrade pip --user
pip3 install ansible-builder
ansible-builder build --tag azure_ee --container-runtime podman

podman login registry.redhat.io
podman login docker.io
podman push azure_ee docker.io/mkletz/azure_ee
