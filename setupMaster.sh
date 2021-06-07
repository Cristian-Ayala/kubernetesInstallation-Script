#For master
USER=zeus
touch /home/$USER/salida.txt
kubeadm init --pod-network-cidr=10.80.0.0/16 | tee /home/$USER/salida.txt
mkdir -p /home/$USER/.kube
cp -i /etc/kubernetes/admin.conf /home/$USER/.kube/config
chown $USER:$USER /home/$USER/.kube/config
printf "\n\n\n\n\nSe usará el addon de calico para networking, corra: 'kubectl apply -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml' con su usuario normal\n"
printf "\n\n\n\n\nCorra 'kubectl get nodes -o wide' para ver los nodos activos\n"

#Para un DNS recursivo (actualmente kubernetes corre sobre una vm)
#export KUBE_EDITOR=nano
#kubectl -n kube-system edit configmap coredns
##    forward . /etc/resolv.conf {
#    forward . 8.8.8.8{
#    #Servidor DNS: 168.232.51.11
