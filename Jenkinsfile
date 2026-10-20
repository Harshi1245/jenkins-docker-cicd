pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Jenkins pipeline started'
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'python --version'
                bat 'python -m pip --version'
            }
        }

        stage('Test') {
            steps {
                bat 'python -m pip install -r requirements.txt'
                bat 'python -m pytest -v'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat '"C:\\Program Files\\Docker\\Docker\\resources\\bin\\docker.exe" build -t jenkins-docker-cicd:1.0 .'
            }
        }
    }
}