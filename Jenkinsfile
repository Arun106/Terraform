pipeline {

    agent { label 'ARUN_VM1' }

    stages {
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
