pipeline {
    docker {
      image 'node:lts-buster-slim'
      
    }
    agent any
    stages {
        stage('test') {
            steps {
                echo "Hello World!"
                sh 'docker ps' 
            }
        }
    }
}