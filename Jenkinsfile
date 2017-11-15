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
                sh 'echo "hello world!"'
                sh 'echo ${myVar}'
            }
        }
    }
}