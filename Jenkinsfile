pipeline {
    agent any

    environment {
        IMAGE_NAME = 'blniharika995/i2'
    }

    stages {
        stage('Build and Test') {
            steps {
                bat 'javac Hello.java'
                bat 'java Hello'
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    // 1. Build the image
                    bat "docker build -t %IMAGE_NAME%:latest ."

                    // 2. Perform Login and Push inside the SAME block
                    withCredentials([usernamePassword(
                        credentialsId: 'Docker-credentials',
                        usernameVariable: 'USER',
                        passwordVariable: 'PASS')]) {
                        
                        bat 'echo %PASS% | docker login -u %USER% --password-stdin'
                        bat 'docker push %IMAGE_NAME%:latest'
                    }
                }
            }
        }
    }
}
