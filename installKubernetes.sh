#!/bin/bash
apt-get update
apt-get install -y apt-transport-https ca-certificates curl
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubelet kubeadm kubectl containerd containernetworking-plugins
printf "\n\n\napt-mark hold evitará que el paquete se actualice o elimine automáticamente.\n"
apt-mark hold kubelet kubeadm kubectl containerd
printf "\n\n\nCargando los módulos necesarios para Containerd:\n"
cat <<EOF | tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF
modprobe overlay
modprobe br_netfilter
printf "\n\n\nConfigurando los parámetros requeridos del kernel:\n"
cat <<EOF | tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward = 1
EOF
sysctl --system
printf "\n\n\nConfigurando containerd:\n"
mkdir -p /etc/containerd
containerd config default | tee /etc/containerd/config.toml
systemctl restart containerd
printf "\n\n\n\n\n \"systemctl status kubelet\" está loaded pero not running hasta que haya un 'kubeadm init' (para master) o un 'kubeadm join' (para nodos), más info: https://github.com/kubernetes/kubernetes/issues/61629\n\n\n\n\n"
swapoff -a
printf "\n\n\n\n\nCorra 'nano /etc/fstab' y (#) comente su partición swap para que no haya problemas con kubernetes\n\n\n\n\n"
