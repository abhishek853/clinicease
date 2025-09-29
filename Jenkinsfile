pipeline {
    agent any

    environment {
        APP_NAME = "clinicease-frontend"
        APP_PORT = "8085"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/abhishek853/clinicease.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${APP_NAME} ."
            }
        }

        stage('Run Container') {
            steps {
                sh """
                # Stop existing container if running
                docker stop ${APP_NAME} || true
                docker rm ${APP_NAME} || true

                # Run container on port 8081
                docker run -d --name ${APP_NAME} -p ${APP_PORT}:80 ${APP_NAME}
                """
            }
        }
    }

    post {
        success {
            echo "ClinicEase deployed successfully!"
        }
        failure {
            echo "Deployment failed."
        }
    }
}
