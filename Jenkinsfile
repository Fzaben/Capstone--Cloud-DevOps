pipeline {
   agent any
   
   environment {
       DEMO='1.3'
   }

   stages {
      stage('lint') {
         steps {
            sh '''
                  make lint
            '''
         }
      }
      stage('integration') {
         steps {
            sh '''
               chmod +x ./scripts/integration/build.sh
               ./scripts/integration/build.sh
            '''
         }
      }
      stage('deploy') {
         steps {
            sh '''
               chmod +x ./scripts/deploy/deploy.sh
               ./scripts/deploy/deploy.sh
            '''
         }
      }
   }
}
