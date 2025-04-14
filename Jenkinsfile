pipeline {
    agent any

    environment {
        IMAGE_NAME = "flask-k8s-demo"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/priyankakanna/Demo-Pipeline.git'
            }
        }

        stage('Set Minikube Docker Env') {
            steps {
                script {
                    // This sets up Docker to use Minikube's Docker daemon
                    sh 'eval $(minikube docker-env)'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Load Image into Minikube') {
            steps {
                sh 'minikube image load $IMAGE_NAME'
            }
        }

        stage('Deploy to Kubernetes with Helm') {
            steps {
                sh 'helm upgrade --install flask-app helm/flask-chart'
            }
        }

        stage('Run the Kubernetes Health Check') {
            steps {
                sh 'chmod +x kube-check.sh && ./kube-check.sh'
            }
        }
    }
}
