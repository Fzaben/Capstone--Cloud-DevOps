pipeline {
    agent {
        docker { image 'node:14-alpine' }
    }
    stages {
        stage('test') {
            steps {
                sh 'node --version'
            }
        }
    }
}