pipeline {
    agent {
        dockerfile true
    }
    stages {
        stage('Back-end') {
            steps {
                sh 'mvn --version'
            }
        }
        stage('Front-end') {
            agent {
                docker { image 'node:14-alpine' }
            }
            steps {
                sh 'node --version'
            }
        }
    }
}