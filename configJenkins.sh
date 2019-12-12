!#/bin/bash

#install maven

apt update
apt install -y maven
mvn -version

#install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
kubectl version

#install tekton cli

curl -LO https://github.com/tektoncd/cli/releases/download/v0.5.1/tkn_0.5.1_Linux_x86_64.tar.gz
tar xvzf tkn_0.5.1_Linux_x86_64.tar.gz -C /usr/local/bin/ tkn
tkn version

#copy kube config for authorization

wget https://raw.githubusercontent.com/naveenkumarsp/k8sstack/master/config
mkdir -p /root/.kube
cp config /root/.kube/config

#validate the connection
kubectl get all --all-namespaces

ssh-keygen -t rsa -b 4096 -P "" -C "jenkinsConn" -f /root/.ssh/id_rsa -q
apt install -y sshpass
sshpass -p ${DOCKER_HOST_PASSWORD} ssh-copy-id -o StrictHostKeyChecking=no jenkins@${DOCKER_HOST_IP}
ssh jenkins@{DOCKER_HOST_IP} hostname
