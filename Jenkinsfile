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
                    sh 'docker build -t adi144/your-webapp-image:latest .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'dockerhub-credentials-id', url: 'https://registry.hub.docker.com']) {
                        sh 'docker push adi144/your-webapp-image:latest'
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sshagent([SSH_CREDENTIALS_ID]) {
                    script {
                        // Copy Ansible playbook and inventory from remote server
                        sh 'scp -i ~/devops.pem ubuntu@:18.232.66.30 ~/ansible/1.yml /var/lib/jenkins/ansible/1.yml'
                        sh 'scp -i ~/devops.pem ubuntu@:18.232.66.30 ~/ansible/inventory.ini /var/lib/jenkins/ansible/inventory.ini'
                        
                        // Execute Ansible playbook
                        sh 'ansible-playbook -i /var/lib/jenkins/ansible/inventory.ini /var/lib/jenkins/ansible/1.yml'
                    }
                }
            }
        }
    }
}
