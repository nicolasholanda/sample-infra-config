pipeline {
    agent none

    parameters {
        string(name: 'TOFU_DIR', defaultValue: 'tofu', description: 'Directory containing OpenTofu configs')
        string(name: 'KUBECONFIG_CREDS_ID', defaultValue: 'jenkins-kubeconfig', description: 'Kubeconfig credential ID')
        string(name: 'TOFU_WORKSPACE', defaultValue: '', description: 'Optional workspace override')
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

        stage('OpenTofu Init') {
            agent any
            steps {
                dir(env.TOFU_DIR) {
                    withKubeConfig([credentialsId: env.KUBECONFIG_CREDS_ID]) {
                        sh 'tofu init'
                    }
                }
            }
        }

        stage('OpenTofu Plan') {
            agent any
            steps {
                dir(env.TOFU_DIR) {
                    withKubeConfig([credentialsId: env.KUBECONFIG_CREDS_ID]) {
                        sh 'tofu plan -out=tfplan'
                    }
                }
            }
        }

        stage('OpenTofu Apply') {
            agent any
            steps {
                dir(env.TOFU_DIR) {
                    withKubeConfig([credentialsId: env.KUBECONFIG_CREDS_ID]) {
                        sh 'tofu apply -auto-approve tfplan'
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
