pipeline {
    agent any

    environment {
        ROLE = 'blue'

        DOCKER_USER = "AWS"
        NGINX_IMAGE = "$DOCKER_USER/capstone-nginx:$ROLE"
        FLASK_IMAGE = "$DOCKER_USER/capstone-flask:$ROLE"
        CI_IMAGE = "$DOCKER_USER/capstone-flask:ci"
    }

    stages {
        stage('Setup') {
            steps {
                script {
					ls -la
                    make lint
                }
            }
        }

        stage('Linting') {
            steps {
                script {
                    docker.image("$CI_IMAGE").withRun { c ->
                        sh "docker exec -i ${c.id} python -m flake8 ."
                    }
                }
            }
        }
    }

    //     stage('Build') {
    //         steps {
    //             script {
    //                 docker.build("$NGINX_IMAGE", "-f ./infra/docker/$ROLE/nginx/Dockerfile .")
    //                 docker.build("$FLASK_IMAGE", "-f ./infra/docker/$ROLE/flask/Dockerfile .")
    //             }
    //         }
    //     }

    //     stage('Publish') {
    //         steps {
    //             script {
    //                 docker.image("$NGINX_IMAGE").push()
    //                 docker.image("$FLASK_IMAGE").push()
    //             }
    //         }
    //     }

    //     stage('Deploy') {
    //         steps {
    //             withAWS(credentials: 'aws-creds', region: 'us-west-2') {
    //                 sh """
    //                 kubectl apply --kubeconfig=${K8S_CONFIG_FILE} \
    //                     -f ./infra/k8s/deployments/${ROLE}.yaml \
    //                     -f ./infra/k8s/services/${ROLE}.yaml
    //                 """
    //             }
    //         }
    //     }
    // }
}