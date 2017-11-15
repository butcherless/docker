def myVar

pipeline {
  agent any
    stages {
        stage('build') {
            steps {
              script {
                myVar = "var-value"
                sh 'echo ${myVar}'
              }
            }
        }
        stage("deploy") {
            steps {
                sh '''
                #!/bin/bash
                echo "hello world!"
                echo ${USER}
                '''
            }
        }
    }
}