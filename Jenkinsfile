pipeline {
    agent {
        label 'terraform-slave'
    }
    parameters {
        choice(name: 'TERRAFORM_WORKSPACE', choices: ['dev', 'prod'], description: 'Choose Terraform workspace: dev or prod')
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/zaynapsabry/Jenkins_project'
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    dir('terraform') {
                        sh 'terraform init'
                    }
                }
            }
        }
        
        stage('Check and Create Workspace') {
            steps {
                script {
                    dir('terraform') {
                        def workspace = params.TERRAFORM_WORKSPACE
                        def workspaceExists = sh(script: "terraform workspace list | grep -q '${workspace}'", returnStatus: true) == 0
                        
                        if (!workspaceExists) {
                            echo "Workspace '${workspace}' does not exist. Creating"
                            sh "terraform workspace new ${workspace}"
                        }
                    }
                }
            }
        }

        stage('Terraform Plan') {
            when {
                expression {
                    params.TERRAFORM_WORKSPACE != 'dev' && params.TERRAFORM_WORKSPACE != 'prod'
                }
            }
            steps {
                error("Invalid workspace chosen. Please choose either dev or prod.")
            }
        }
        stage('Terraform Plan: ${params.TERRAFORM_WORKSPACE}') {
            when {
                expression {
                    params.TERRAFORM_WORKSPACE == 'dev' || params.TERRAFORM_WORKSPACE == 'prod'
                }
            }
            steps {
                script {
                    dir('terraform') {
                        sh "terraform workspace select ${params.TERRAFORM_WORKSPACE}"
                        sh "terraform plan -var-file=${params.TERRAFORM_WORKSPACE}.tfvars"
                    }
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression {
                    params.TERRAFORM_WORKSPACE != 'dev' && params.TERRAFORM_WORKSPACE != 'prod'
                }
            }
            steps {
                error("Invalid workspace chosen. Please choose either dev or prod.")
            }
        }
        stage('Terraform Apply: ${params.TERRAFORM_WORKSPACE}') {
            when {
                expression {
                    params.TERRAFORM_WORKSPACE == 'dev' || params.TERRAFORM_WORKSPACE == 'prod'
                }
            }
            steps {
                script {
                    dir('terraform') {
                        sh "terraform workspace select ${params.TERRAFORM_WORKSPACE}"
                        sh "terraform apply -auto-approve -var-file=${params.TERRAFORM_WORKSPACE}.tfvars"
                    }
                }
            }
        }

        // stage('destroy') {
        //      steps {
        //          script {
        //              dir('Terraform') {
        //                  sh "terraform destroy -auto-approve -var-file=${params.TERRAFORM_WORKSPACE}.tfvars"
        //              }
        //          }
        //      }
        //  }
    }
}
