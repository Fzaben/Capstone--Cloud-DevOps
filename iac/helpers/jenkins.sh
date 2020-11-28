# kubectl create namespace jenkins
# kubectl get namespaces
# helm repo add jenkinsci https://charts.jenkins.io
# helm repo update

# kubectl apply -f jenkins-volume.yml
# kubectl apply -f jenkins-sa.yml
#  export chart=jenkinsci/jenkins
#  helm install jenkins -n jenkins -f jenkins-values.yml $chart


 ## get the password 
path="{.data.jenkins-admin-password}"
secret=$(kubectl get secret -n jenkins jenkins -o jsonpath=$path)
echo $(echo $secret | base64 --decode)

# ## Get the Jenkins URL to visit by running these commands in the same shell:
# path="{.spec.ports[0].nodePort}"
# NODE_PORT=$(kubectl get -n jenkins -o jsonpath=$path services jenkins)
# path="{.items[0].status.addresses[0].address}"
# NODE_IP=$(kubectl get nodes -n jenkins -o jsonpath=$path)
# echo http://$NODE_IP:$NODE_PORT/login


## Deploy 
kubectl create -f jenkins-deployment.yml -n jenkins