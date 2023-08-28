FROM determinedai/environments:cuda-11.3-pytorch-1.12-tf-2.11-gpu-2b7e2a1
ENV PACHCTL_VERSION=2.7.1

# This runs the following section as root; if adding to an existing Dockerfile, set the user back to whatever you need. 
USER root

# This is the directory files will be mounted to, mirroring how pipelines are run. 
RUN mkdir -p /pfs /mnt/pfs 
RUN chmod 777 /pfs /mnt/pfs

# Fuse is a requirement for the mount extension 
RUN apt-get clean && apt-get update && apt-get -y install curl fuse 

# Optionally Install Pachctl - Set the version of Pachctl that matches your cluster deployment. 
RUN curl -L https://github.com/pachyderm/pachyderm/releases/download/v$PACHCTL_VERSION/pachctl_${PACHCTL_VERSION}_linux_amd64.tar.gz | tar -xzv --strip-components=1 -C /usr/local/bin
RUN curl -L https://github.com/pachyderm/pachyderm/releases/download/v$PACHCTL_VERSION/mount-server_${PACHCTL_VERSION}_linux_amd64.tar.gz | tar -xzv --strip-components=1 -C /usr/local/bin

USER $NB_UID
RUN pip install --upgrade pip
RUN pip install jupyterlab-pachyderm==$PACHCTL_VERSION
# jupyterlab-pachyderm forces jupyter_server<=2.0 which breaks jupyterlab
# Reinstall one compatible with DeterminedAI dependencies so the jupyterlab works.
RUN pip install jupyter_server==2.7.0

# If intending to use this with a root-less container platform (Singularity/Apptainer/Podman/Enroot), also include the following line
ENV  NONPRIV_CONTAINER=1 
