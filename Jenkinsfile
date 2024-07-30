pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/nicol144/practise-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("adi144/your-webapp-image:latest")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', '6b086e3f-5dbb-42fb-a7c0-150fe32fe0b0') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sshagent(['ac249d92-3f02-466e-a7c4-a09777d31a5b']) {
                    sh 'ansible-playbook -i ~/ansible/inventory.ini ~/ansible/deploy_app.yml'
                }
            }
        }
    }
}
