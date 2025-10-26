pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        IMAGE_NAME = 'mydockerhub12/jenkins-demo' // replace with your Docker Hub repo name
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Faiz-official/faiz-jenkins-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        docker.image("${IMAGE_NAME}:${BUILD_NUMBER}").push()
                        docker.image("${IMAGE_NAME}:${BUILD_NUMBER}").push('latest')
                    }
                }
            }
        }
    }

    post {
        success {
            echo '✅ Build & Push Successful!'
        }
        failure {
            echo '❌ Build Failed!'
        }
    }
}

