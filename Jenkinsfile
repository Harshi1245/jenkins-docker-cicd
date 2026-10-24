        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build \
                      --build-arg PIP_DEFAULT_TIMEOUT=120 \
                      -t "$DOCKER_IMAGE:$IMAGE_TAG" .
                    docker tag "$DOCKER_IMAGE:$IMAGE_TAG" "harshitha1245/$DOCKER_IMAGE:$IMAGE_TAG"
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
                        docker push "harshitha1245/$DOCKER_IMAGE:$IMAGE_TAG"
                        docker logout
                    '''
                }
            }
        }