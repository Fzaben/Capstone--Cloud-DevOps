# Udacity Cloud DevOps Nanodegree
[Udacity Cloud DevOps Cloud Engineer Nanodegree]

http://abefb74d1177f4dcf9c39449b9f4f29f-187350353.us-west-2.elb.amazonaws.com/

## Project Overview
In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. This project tests your ability to operationalize a Python flask app—in a provided file, app.py—that serves out predictions (inference) about housing prices through API calls.

### prerequest tools and services
- VSCode
- nginx
- docker
- kubectl
- make
- Jenkins
- hadolint
- CloudFormation
- aws-cli
- jenkins
- git bash

## Pre-reqs

Run Jenkins in [Docker](https://www.docker.com/products/docker-desktop):

```
docker-compose -f jenkins/docker-compose.yml up -d
```

> Plugins configured in [install-plugins.groovy](../jenkins/20.04/scripts/install-plugins.groovy)

## 1.1 Create a simple pipeline

Log into Jenkins at http://localhost:8080 with `psod`/`psod`.

- New item, pipeline, `demo1-1`
- Select sample pipeline script
- Replace echo with `echo "This is build number $BUILD_NUMBER"`
- Run and check output

### scripts files 
- `./aws/create_stack.sh UdacityCapStone-Network aws/network/network.yml aws/network/params.json` Creating application infastructure
- `./aws/create_stack.sh UdacityCapStone-Cluster aws/cluster/cluster.yml aws/cluster/params.json` Creating k8s cluster
- `./aws/create_stack.sh UdacityCapStone-Nodes aws/nodes/nodes.yml aws/nodes/params.json` Creating k8s 
- `Run kubectl apply -f ./iac/k8s/configmap.yaml` configure with the EKS 
    `aws eks --region us-west-2 update-kubeconfig --name UdacityCapStone-Cluster` to apply kubectl command from local    

- `./aws/create_stack.sh UdacityCapStone-ECR aws/container-registry/cluster.yml aws/container-registry/params.json` Creating k8s container registry

### Deploy the application
Retrieve an authentication token and authenticate your Docker client to your registry.
Use the AWS CLI:
- `aws ecr get-login-password --region <regoin>| docker login --username <username> --password-stdin <url-regstiry>`

Note: If you receive an error using the AWS CLI, make sure that you have the latest version of the AWS CLI and Docker installed.
Build your Docker image using the following command. For information on building a Docker file from scratch see the instructions here . You can skip this step if your image is already built:

- `docker build -t capstone-app .`

After the build completes, tag your image so you can push the image to this repository:
`docker tag capstone-sample-app:latest <url->:latest`

Run the following command to push this image to your newly created AWS repository:
docker push 582512839761.dkr.ecr.us-west-2.amazonaws.com/capstone-sample-app:latest

To have a proper deployment double-check the parameters in environment in the
`Jenkinsfile`


