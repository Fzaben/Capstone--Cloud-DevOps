pipeline {
    
  agent any
      

    stages {
		stage("rollback deployment") {
	
	        steps {
	           withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', 
	                        accessKeyVariable: 'AWS_ACCESS_KEY_ID', 
	                        credentialsId: 'aws_id', 
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