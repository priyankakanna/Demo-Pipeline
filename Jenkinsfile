pipeline {
    agent any

    environment {
        IMAGE_NAME = "flask-k8s-demo"
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/your-username/Devops-project.git'
            }
        }

        stage('Set Minikube Docker Env') {
            steps {
                script {
                    // This sets the env for all future shell steps
                    sh 'eval $(minikube docker-env)'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Load Docker Image to Minikube') {
            steps {
                sh 'minikube image load $IMAGE_NAME'
            }
        }

        stage('Deploy with Helm') {
            steps {
                sh 'helm upgrade --install flask-app helm/flask-chart'
            }
        }

        stage('K8s Checks') {
            steps {
                sh 'chmod +x kube-check.sh && ./kube-check.sh'
            }
        }
    }
}

