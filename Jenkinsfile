
pipeline {
    
    agent any
    
     parameters {
        choice(name: 'workspace', choices: ['prod', 'dev'], description: 'worspace to apply changes ')
        choice(name: 'use_prod_or_dev_variable_file', choices: ['prod.tfvars', 'dev.tfvars'], description: 'worspace to apply ')

    }

    stages {
        
        stage('clone') {
            steps {
                git branch: 'main',
                  url: 'https://github.com/hossamesaaa/terrafrom-pipline.git'
            }
        }
        
        stage('authenticate with aws'){
            steps{
                 
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: "aws_keys",
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                ]]) { 
               
                sh 'echo [default] >credentials'
                sh 'echo aws_access_key_id=$AWS_ACCESS_KEY_ID >>credentials'
                sh 'echo aws_secret_access_key=$AWS_SECRET_ACCESS_KEY >>credentials'
         
               }
     
                   
            }
            
        }
        
        stage('test work space'){
            steps{
                 sh "echo ${params.workspace} > work_space "
                 sh ''' #!/bin/bash
                      
                        workspaces=`cat work_space`
                        rm work_space
                        terraform init
                        test=`terraform workspace list  | sed -e  's/*/ /g' | cut -f1`
                        flag=false
                    
                        for i in $test
                        do
                            if [[ $i  == ${workspaces} ]]
                            then
                              terraform workspace select  ${workspaces}
                              flag=true
                              break
                            fi
                        done
                        
                        if [[ flag == false  ]]
                        then
                        terraform workspace new ${workspaces}
                        fi '''
                
            
            }
            
         }
        
        
        stage('terrafrom apply') {
            steps {
          
                sh "terraform apply -auto-approve -var-file=${params.use_prod_or_dev_variable_file}"
                
            }    
        }
       
    }
    

    post {
        always {
            
          sh "rm credentials"    
                    
        }
    
    }
     
}     
     
