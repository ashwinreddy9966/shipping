pipeline {
agent any

  stages {
           stage('Terraform Initialisization') {
            steps {
                sh "cp env-dev/Terrafile . ; terrafile"
                sh "terraform init -backend-config=env-dev/dev-backend.tfvars"
                }
            }

            stage('Terraform Plan') {
            steps {
                sh "terraform plan -var-file=env-dev/dev.tfvars"
                }
            }

            stage('Terraform Apply') {
            steps {
                sh "terraform destroy -auto-approve -var-file=env-dev/dev.tfvars"
                }
            }
         }
     }