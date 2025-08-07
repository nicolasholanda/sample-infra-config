pipeline {
    agent none

    parameters {
        string(name: 'TOFU_DIR', defaultValue: 'tofu', description: 'Directory containing OpenTofu configs')
        string(name: 'KUBECONFIG_CREDS_ID', defaultValue: 'jenkins-kubeconfig', description: 'Kubeconfig credential ID')
    }

    environment {
        TOFU_DIR = "${params.TOFU_DIR}"
        KUBECONFIG_CREDS_ID = "${params.KUBECONFIG_CREDS_ID}"
    }

    stages {
        stage('Checkout') {
            agent any
            steps {
                checkout scm
            }
        }

        stage('Static Tests') {
            agent any
            steps {
                sh 'pip install --user checkov'
                sh 'checkov -d $TOFU_DIR'
            }
        }

        stage('Deploy') {
            agent any
            steps {
                dir(env.TOFU_DIR) {
                    withCredentials([file(credentialsId: env.KUBECONFIG_CREDS_ID, variable: 'KUBECONFIG_PATH')]) {
                        sh '''
                            tofu init
                            tofu apply -auto-approve -var="kubeconfig_path=$KUBECONFIG_PATH"
                        '''
                    }
                }
            }
        }
    }

    post {
        always {
            echo "OpenTofu infra pipeline finished"
        }
        success {
            echo "Infrastructure deployed successfully"
        }
        failure {
            echo "Infrastructure deployment failed"
        }
    }
}
