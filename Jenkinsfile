pipeline {
    agent any
    tools {
        maven 'Maven' 
    }
    stages {
   	stage('SonarQube Analysis'){
        	steps {
                	withSonarQubeEnv('Sonarqube') {
                    		script {
					container_Up = false
		    			LAST_STARTED = env.STAGE_NAME 
					sh " mvn -f /Users/sachinsajan/AnypointStudio/myTrains/jenkins-test mvn sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=admin -Dsonar.password=Jerry123 -Dsonar.sources=src/"   
                    		}
                	}
                }
	}
	    
	    
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
     }
  
    stage('Deploy to Cloudhub'){
        	steps {
			script {
			    LAST_STARTED = env.STAGE_NAME
				sh 'mvn package deploy -DmuleDeploy -DskipTests -Danypoint.username=ssajangeorge -Danypoint.password=Jerry@123 -DapplicationName=jenkins-test -Dcloudhub.region=us-east-2'
            }
       }
   }
   
    }  
   }
