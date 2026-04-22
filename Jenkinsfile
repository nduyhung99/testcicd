pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/nduyhung99/testcicd.git'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t testcicd-app .'
            }
        }

        stage('Run') {
            steps {
                sh 'docker rm -f testcicd-app || true'
                sh 'docker run -d -p 8082:8088 --name testcicd-app testcicd-app'
            }
        }
    }
}