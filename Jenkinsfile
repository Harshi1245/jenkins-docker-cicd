
pipeline {
    agent {
        label 'docker-build-agent-new'
    }

    environment {
        DOCKER_IMAGE = 'jenkins-docker-cicd'
        IMAGE_TAG = '1.1'
        DOCKERHUB_REPO = 'harshitha1245/jenkins-docker-cicd'
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
                    docker tag "$DOCKER_IMAGE:$IMAGE_TAG" "$DOCKERHUB_REPO:$IMAGE_TAG"
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKERHUB_USER',
                    passwordVariable: 'DOCKERHUB_TOKEN'
                )]) {
                    sh '''
                        echo "$DOCKERHUB_TOKEN" | docker login -u "$DOCKERHUB_USER" --password-stdin
                        docker push "$DOCKERHUB_REPO:$IMAGE_TAG"
                        docker logout
                    '''
                }
            }
        }
    }
}
