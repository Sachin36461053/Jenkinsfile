pipeline {
    agent any
    tools {
        maven 'Maven' 
    }
    stages {
       stage('Build') {
      		steps {
	    		script {
	    			LAST_STARTED = env.STAGE_NAME
				sh "mvn clean install  -DskipTests"     
				
		        } 
              }    
     } 
     stage ('Munit Test'){
        	steps {
			script {
			    LAST_STARTED = env.STAGE_NAME
			   	sh "mvn test"
			}		
          
     }
  
    stage('Deploy to Cloudhub'){
        	steps {
			script {
			    LAST_STARTED = env.STAGE_NAME
				sh 'mvn package deploy -DmuleDeploy -DskipTests -Danypoint.username=ssajangeorge -Danypoint.password=Jerry@123 -DapplicationName=jenkins-test '
			    }
       }
   }
   
    }  
   }
