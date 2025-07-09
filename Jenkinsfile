pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Code already present locally – skipping checkout from GitHub.'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flask-jenkins-app .'
            }
        }

        stage('Run Container') {
            steps {
                // Stop existing container if running
                sh 'docker rm -f flask-jenkins-container || true'
                sh 'docker run -d -p 5000:5000 --name flask-jenkins-container flask-jenkins-app'
            }
        }
    }
}
