def myVar

pipeline {
  agent any
    stages {
        stage('build') {
            steps {
              script {
                myVar = "var-value"
              }
            }
        }
        stage("deploy") {
            steps {
                sh '''
                #!/bin/bash
                echo "hello world!"
                echo ${USER}
                echo 
                '''
            }
        }
    }
}