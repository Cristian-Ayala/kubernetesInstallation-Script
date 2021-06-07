
# Kubernetes
#### All this steps were provided by this [page.](https://stackoverflow.com/questions/48854905/how-to-add-roles-to-nodes-in-kubernetes)

1. Add ip and hostnames to "/etc/hosts" (on each one)
E.g.: 
```
192.168.122.50 master
192.168.122.60 worker1
192.168.122.70 worker2
```
2. Change hostname (if necessary):
```
hostnamectl set-hostname master # On master server
hostnamectl set-hostname worker1 # On worker1 server
hostnamectl set-hostname worker2 # On worker2 server
```
> To make the changes take effect, log out and log in on each server.

3. Run the "installKubernetes.sh" bash file as root.

4. Set up master node (by running "kubeadm init") and after that, set up all the worker nodes (with "kubeadm join ...")

5. (Optional)  You can change the label of the nodes. [Click Here.](https://stackoverflow.com/questions/48854905/how-to-add-roles-to-nodes-in-kubernetes)


