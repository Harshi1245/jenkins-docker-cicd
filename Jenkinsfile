
pipeline {
    agent any

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
                 sh '.venv/bin/python -m pytest -v --cov=app --cov-report=term-missing'
            }
        }
    }
}
