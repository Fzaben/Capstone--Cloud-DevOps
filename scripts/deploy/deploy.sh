#!/bin/sh
export IMAGE_NAME=fzaben/capston-app:$BUILD_NUMBER
#export --kubeconfig=$CONFIG_FILE_PATH  CONFIG_FILE_PATH=./pipeline/k8s/hemma-stg-cluster-kubeconfig.yaml
kubectl --namespace=default set image deployment/capston-app capston-app=$IMAGE_NAME --record=true
