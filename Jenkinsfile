pipeline {
    agent any

    stage('Test') {
      steps {
        container('golang') {
          sh """
            go test
          """
        }
      }
    }
}