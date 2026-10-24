Jenkins CI/CD Pipeline with Docker



Project Overview



This project demonstrates an automated CI/CD pipeline using Jenkins, Docker, GitHub, and Docker Hub. It automates code quality checks, testing, Docker image building, image publishing, and application deployment.



Technologies Used



Jenkins – CI/CD pipeline automation



GitHub – Source code management



Docker – Application containerization



Docker Hub – Docker image registry



Python and Flask – Application development



Gunicorn – Python application server



Pytest and pytest-cov – Automated testing and code coverage



Flake8 – Code quality checks



CI/CD Workflow



Jenkins retrieves the project from GitHub.



Jenkins creates a Python virtual environment and installs dependencies.



Flake8 checks code quality.



Pytest runs automated tests and enforces at least 90% code coverage.



Docker builds the application image.



Jenkins authenticates using stored credentials and pushes the image to Docker Hub.



Jenkins pulls the published image and deploys the application container.



Jenkins verifies that the container is running.



Project Links



GitHub Repository: https://github.com/Harshi1245/jenkins-docker-cicd



Docker Hub Image: https://hub.docker.com/r/harshitha1245/jenkins-docker-cicd



Run the Application



Pull the published Docker image:



docker pull harshitha1245/jenkins-docker-cicd:1.1



Run the container:



docker run -d --name jenkins-docker-cicd-app -p 8083:5000 harshitha1245/jenkins-docker-cicd:1.1



Open the application:



http://localhost:8083



Check application health:



http://localhost:8083/health



The health endpoint returns a JSON response indicating the application status.



Run Tests Locally



Install the project dependencies:



pip install -r requirements.txt



Run the code quality check:



python -m flake8 app.py test\_app.py



Run the automated tests with coverage:



python -m pytest -v --cov=app --cov-report=term-missing --cov-fail-under=90



Security



Store Docker Hub credentials in Jenkins Credentials.



Do not commit passwords, access tokens, or other secrets to GitHub.



Use appropriate permissions for credentials and deployment access.



Project Result



The Jenkins pipeline has successfully completed code quality checks, automated tests, Docker image building, Docker Hub publishing, and automatic container deployment. The application health endpoint was verified after deployment.

