
pipeline {
    agent any

    environment {
        BUILDKIT_HOST = 'tcp://buildkit-builder:1234'
        DOCKER_IMAGE = 'jenkins-docker-cicd'
        IMAGE_TAG = '1.1'
        TLS_DIR = '/var/jenkins_home/buildkit-certs'
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

        stage('Build Docker Image with BuildKit') {
            steps {
                sh '''
                    buildctl \
                      --addr="$BUILDKIT_HOST" \
                      --tlsservername=buildkit-builder \
                      --tlscacert="$TLS_DIR/ca.pem" \
                      --tlscert="$TLS_DIR/client.pem" \
                      --tlskey="$TLS_DIR/client-key.pem" \
                      build \
                      --frontend=dockerfile.v0 \
                      --local context=. \
                      --local dockerfile=. \
                      --output type=image,name="harshitha1245/$DOCKER_IMAGE:$IMAGE_TAG",push=false
                '''
            }
        }
    }
}
