pipeline {

    agent any



    environment {

        DOCKERHUB_CREDENTIALS = 'dockercredentials'

        IMAGE_NAME = 'blniharika995/i2'

    }



    stages {



        stage('Build Java Application') {

            steps {

                bat 'javac Hello.java'

            }

        }



        stage('Run Java Program') {

            steps {

                bat 'java Hello'

            }

        }



        stage('Build Docker Image') {

            steps {

                bat 'docker build -t %IMAGE_NAME%:latest .'

            }

        }



        stage('Build and Push Docker Image') {
    steps {
        script {
            // Log in using credentials stored in Jenkins
            withCredentials([usernamePassword(
                credentialsId: 'Docker-credentials', // Ensure this matches your ID in Jenkins
                usernameVariable: 'USER',
                passwordVariable: 'PASS')]) {
                
                // Login
                bat 'echo %PASS% | docker login -u %USER% --password-stdin'
                
                // Push
                bat 'docker push blniharika995/i2:latest'
            }
        }
    }
}
