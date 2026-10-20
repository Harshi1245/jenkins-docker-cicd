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
                sh 'python3 --version'
                sh 'python3 -m pip --version'
            }
        }

        stage('Test') {
            steps {
                sh 'docker run --rm -v "$PWD:/app" -w /app python:3.11-slim sh -c "pip install -r requirements.txt && pytest -v"'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t jenkins-docker-cicd:1.0 .'
            }
        }
    }
}