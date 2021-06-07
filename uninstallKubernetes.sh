#!/bin/sh
rm /usr/share/keyrings/kubernetes-archive-keyring.gpg
rm /etc/apt/sources.list.d/kubernetes.list  
apt-mark unhold kubelet kubeadm kubectl containerd  
apt-get remove -y kubelet kubeadm kubectl containerd  
rm /etc/modules-load.d/containerd.conf
rm /etc/sysctl.d/99-kubernetes-cri.conf
rm -rf /etc/containerd  
apt autoremove -y





