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
                    docker.withRegistry('https://index.docker.io/v1/', '6b086e3f-5dbb-42fb-a7c0-150fe32fe0b0') {
                        dockerImage.push('latest')
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sshagent(['ac249d92-3f02-466e-a7c4-a09777d31a5b']) {
                    script {
                        // Run Ansible playbook directly on the remote server
                        sh '''
                            ssh -i ~/devops.pem ubuntu@18.232.66.30 << 'EOF'
                                ansible-playbook -i ~/ubuntu/ansible/invemtory.ini ~/ubuntu/ansible/1.yml
                            EOF
                        '''
                    }
                }
            }
        }
    }
}
