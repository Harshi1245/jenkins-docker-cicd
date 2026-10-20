pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Starting Jenkins CI/CD pipeline'
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Preparing Python dependencies'
            }
        }

        stage('Test') {
            steps {
                echo 'Running automated tests'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Preparing to build Docker image'
            }
        }
    }
}