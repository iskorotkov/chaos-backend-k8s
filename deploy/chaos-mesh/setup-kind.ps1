# Add Chaos Mesh repository to Helm repos
helm repo add chaos-mesh https://charts.chaos-mesh.org
helm repo update

# Create custom resource type
kubectl apply -f https://mirrors.chaos-mesh.org/v1.0.2/crd.yaml

# Install Chaos Mesh
kubectl create ns chaos-mesh
helm install chaos-mesh chaos-mesh/chaos-mesh --namespace=chaos-mesh --set chaosDaemon.runtime=containerd --set chaosDaemon.socketPath=/run/containerd/containerd.sock --set dashboard.create=true
