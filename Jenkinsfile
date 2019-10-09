pipeline{
    agent any
 
stages
    {
    stage('Git Checkout')
    {
         steps
        {
             checkout scm
        }
    }
     stage('terraform init') {
            steps {
		  
		  
                 sh "terraform init -input=false"
		 
               
            }
        }
        
         stage('terraform plan') {
            steps {
		     wrap([$class: 'MaskPasswordsBuildWrapper', varPasswordPairs: [[password: 'a8a59231-c575-45fb-8e16-2b4c5b6a2271', var: 'AZURE_SUBSCRIPTION_ID']]]) {
        echo env['AZURE_SUBSCRIPTION_ID'];
    }
	
               sh 'terraform plan  -input=false -var subscription_id=env['AZURE_SUBSCRIPTION_ID'] -var tenant_id=${AZURE_TENANT_ID} -var client_id=${AZURE_CLIENT_ID} -var  client_secret=${AZURE_CLIENT_SECRET} -var source_uri=${source_uri}'           
            }
        }
        stage('terraform apply') {
           steps {
               
             sh "terraform apply -input=false -auto-approve  -var subscription_id=${AZURE_SUBSCRIPTION_ID} -var tenant_id=${AZURE_TENANT_ID} -var client_id=${AZURE_CLIENT_ID} -var  client_secret=${AZURE_CLIENT_SECRET} -var source_uri=${source_uri}"
           
           }
        }
    
}
}
