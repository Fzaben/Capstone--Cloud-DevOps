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
		stage("rollback deployment") {
	
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