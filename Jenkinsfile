pipeline {

    agent { label 'ARUN_VM1' }

    stages {

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }

        stage('Generate Log') {
            steps {
                sh 'echo "Deployment Successful" > deploy.log'
            }
        }

        stage('Upload Log') {
            steps {
                sh '''
                az storage blob upload \
                --account-name arunlogstorage12345 \
                --container-name applicationlogs \
                --name deploy.log \
                --file deploy.log \
                --auth-mode login
                '''
            }
        }
    }
}
