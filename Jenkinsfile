pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t adi144/your-webapp-image:latest .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Define dockerImage variable with the correct image tag
                    def dockerImage = docker.image('adi144/your-webapp-image:latest')
                    
                    // Push Docker image to Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', '6b086e3f-5dbb-42fb-a7c0-150fe32fe0b0') {
                        dockerImage.push('latest')
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sshagent([SSH_CREDENTIALS_ID]) {
                    script {
                        // Copy Ansible playbook and inventory from remote server
                        sh 'scp -i ~/devops.pem ubuntu@18.232.66.30:~/ansible/1.yml /var/lib/jenkins/ansible/1.yml'
                        sh 'scp -i ~/devops.pem ubuntu@18.232.66.30:~/ansible/inventory.ini /var/lib/jenkins/ansible/inventory.ini'
                        
                        // Execute Ansible playbook
                        sh 'ansible-playbook -i /var/lib/jenkins/ansible/inventory.ini /var/lib/jenkins/ansible/1.yml'
                    }
                }
            }
        }
    }
}
