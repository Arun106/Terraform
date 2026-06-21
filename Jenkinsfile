pipeline {
    agent { label 'VM1ARUN' }

    environment {
        ARM_USE_AZUREAD = 'true'
    }

    stages {

        stage('Check Tools') {
            steps {
                sh '''
                terraform version
                az version
                '''
            }
        }

        stage('Azure Login Check') {
            steps {
                sh '''
                az account show
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                terraform init
                '''
            }
        }

        stage('Terraform Validate') {
            steps {
                sh '''
                terraform validate
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                terraform plan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                terraform apply -auto-approve
                '''
            }
        }

        stage('Upload Log File') {
            steps {
                sh '''
                echo "Application log created by Jenkins" > application.log

                az storage blob upload \
                  --account-name arunlogstorage12345 \
                  --container-name applicationlogs \
                  --name application.log \
                  --file application.log \
                  --auth-mode login \
                  --overwrite
                '''
            }
        }
    }
}
