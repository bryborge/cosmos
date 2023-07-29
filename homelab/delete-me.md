## Master Node

1. Install raspberry pi extra packages on master: `sudo apt install linux-modules-extra-raspi`
2. Install k3s: `curl -sfL https://get.k3s.io | sh -`
3. Get K3S_URL: `hostname -I | awk '{print $1}'`
4. Get K3S_TOKEN: `sudo cat /var/lib/rancher/k3s/server/node-token`
5. Reboot


## Worker Node

1.  Install raspberry pi extra packages on master: `sudo apt install linux-modules-extra-raspi`

2.  Install k3s (w/ env_vars set):

    ``` 
    curl -sfL https://get.k3s.io | K3S_URL=https://<master_node_ip>:6443 K3S_TOKEN=<token> sh -
    ```


## Master Node

6. Check that Worker node is registered with the Master node: `sudo k3s kubectl get nodes`
