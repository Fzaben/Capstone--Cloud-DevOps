pipeline {
    
  agent any
  
  parameters {
	choice(name: 'action', choices: 'create\nrollback', description: 'Create/rollback of the deployment')
    string(name: 'ImageName', description: "Name of the docker build")
	string(name: 'ImageTag', description: "Name of the docker build")
	string(name: 'AppName', description: "Name of the Application")
    string(name: 'docker_repo', description: "Name of docker repository")
  }
      

    stages {

	    stage("Docker Build and Push") {

                
	        steps {
	            dir("${params.AppName}") {
	                dockerBuild ( "${params.ImageName}", "${params.docker_repo}" )
	            }
	        }
	    }
	    stage("Docker CleanUP") {
	        when {
				expression { params.action == 'create' }
			}
	        steps {
	            dockerCleanup ( "${params.ImageName}", "${params.docker_repo}" )
			}
		}
	    stage("Create deployment") {
			when {
				expression { params.action == 'create' }
			}
	        steps {
	            dir("${params.AppName}") {
	                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
	                        accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
	                        credentialsId: 'aws_id', 
	                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
	                    withCredentials([kubeconfigFile(credentialsId: 'kubernetes_config', 
	                        variable: 'KUBECONFIG')]) {
	                        sh 'kubectl create -f kubernetes-configmap.yml'
	                    }
	                }
	            }
	        }
	    }
		stage("rollback deployment") {
			when {
				expression { params.action == 'rollback' }
			}
	        steps {
	           withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
	                        accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
	                        credentialsId: 'AWS_Credentials', 
	                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
	               withCredentials([kubeconfigFile(credentialsId: 'kubernetes_config', 
	                        variable: 'KUBECONFIG')]) {
	               sh """
	                    kubectl delete deploy ${params.AppName}
					    kubectl delete svc ${params.AppName}
				   """
	               }
	            }
	        }
	    }
    }
}