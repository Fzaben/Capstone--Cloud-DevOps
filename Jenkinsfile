pipeline {
	agent any
  environment {
        VERSION = 'latest'
        PROJECT = 'capstone-app'
		IMAGE = "$PROJECT"
		ECRURL = "https://582512839761.dkr.ecr.us-west-2.amazonaws.com/$PROJECT"
		ECRURI = "582512839761.dkr.ecr.us-west-2.amazonaws.com/$PROJECT"
		ECRCRED = 'ecr:us-west-2:Capston'
  }
	stages {
		stage ("lint dockerfile") {
			agent {
				docker {
					image 'hadolint/hadolint:latest-debian'
				}
			}
			steps {
				sh 'hadolint Dockerfile'
			}
        stage('Lint') {
            steps {
                sh 'hadolint --ignore DL3013 $WORKSPACE/Dockerfile'
                sh 'tidy -q -e $WORKSPACE/index.html'
            }
        }

		stage('build') {
		  steps {
				script {
				// Build the docker image using a Dockerfile
				docker.build("$IMAGE")
				}
			}
		}
		stage('push') {
			steps {
				script {
					// Push the Docker image to ECR
					docker.withRegistry(ECRURL, ECRCRED) {
						docker.image(IMAGE).push("latest")
						docker.image(IMAGE).push(VERSION)
					}
				}
			}
		}
		stage('K8S Deploy') {
			steps {
				withAWS(credentials: 'Capston', region: 'us-west-2') {
					sh "aws eks --region us-west-2 update-kubeconfig --name UdacityCapStone-Cluster"
					// Configure deployment
					sh "kubectl apply -f k8s/deployment.yml"
					// Configure service for loadbalancing
					sh "kubectl apply -f k8s/service.yml"
					// Set created image to do a rolling update
					sh "kubectl set image deployments/$PROJECT $PROJECT=$ECRURI:$VERSION"
				}
			}
		}
  	}
	post {
		always {
		    // make sure that the Docker image is removed
		    sh "docker rmi $IMAGE | true"
		}
	}
}
