pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/abhishek853/clinicease.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t clinicease-site .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh 'docker rm -f clinicease || true'
                    sh 'docker run -d --name clinicease -p 80:80 clinicease-site'
                }
            }
        }
    }
}
