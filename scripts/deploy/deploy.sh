#!/bin/sh
export IMAGE_NAME=fzaben/capstone-app:$BUILD_NUMBER
    #export
kubectl  --kubeconfig=~/.kube/config --namespace=default set image deployment/capstone-app-dep capstone-app-dep=$IMAGE_NAME --record=true
