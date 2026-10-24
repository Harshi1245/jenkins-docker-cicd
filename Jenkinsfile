
pipeline {
    agent {
    label 'docker-build-agent-2'
}

    environment {
        DOCKER_IMAGE = 'jenkins-docker-cicd'
        IMAGE_TAG = '1.1'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Jenkins pipeline started'
            }
        }

        stage('Setup Python Environment') {
            steps {
                sh 'python3 -m venv .venv'
                sh '.venv/bin/python -m pip install --upgrade pip'
                sh '.venv/bin/python -m pip install -r requirements.txt'
            }
        }

        stage('Code Quality') {
            steps {
                sh '.venv/bin/python -m flake8 app.py test_app.py'
            }
        }

        stage('Test') {
            steps {
                sh '.venv/bin/python -m pytest -v --cov=app --cov-report=term-missing --cov-fail-under=90'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build \
                      --build-arg PIP_DEFAULT_TIMEOUT=120 \
                      -t "$DOCKER_IMAGE:$IMAGE_TAG" .
                '''
            }
        }
    }
}
