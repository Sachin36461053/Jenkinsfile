pipeline {
    agent any
    tools {
        maven 'Maven' 
    }
    stages {
   	stage('SonarQube Analysis'){
        	steps {
                	withSonarQubeEnv('SonarQube') {
                    		script {
					container_Up = false
		    			LAST_STARTED = env.STAGE_NAME 
					sh " mvn -f /Users/sachinsajan/AnypointStudio/myTrains/jenkins-test sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=admin -Dsonar.password=Jerry123 -Dsonar.sources=src/"   
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
	    
     stage('Build image') {
      		steps {
        		script {
			//      sh "docker stop apiops-salesforce-sapi" 
        		//   	sh "docker rm apiops-salesforce-sapi"
			   	LAST_STARTED = env.STAGE_NAME
				container_Up = false
			   	sh "docker build -t jenkins-test:mule -f Dockerfile ."
                	 
                        }
               }
      }
	    
      stage('Run container') {
      		steps {
        		script {
			     	LAST_STARTED = env.STAGE_NAME
				
          		    	sh ' docker run -itd -p 8095:8081 --name jenkins-test jenkins-test:mule'
				container_Up = true
				sh 'sleep 90'
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
	    
	          stage('Munit & Functional Testing'){
        	steps {
			script {

				LAST_STARTED = env.STAGE_NAME

				//sh "mvn -f apiops-generic-db-sapi/pom.xml -Dhttp.port=8086 -Dkey=mymulesoft test -Dtestfile=apiops-generic-db-sapi/src/test/javarunner.TestRunner.java "

				sh "mvn -f /Users/sachinsajan/AnypointStudio/myTrains/jenkins-test/src/test/java/runner/TestRunner.java test "

			}

             	}   

     }
  
    stage('Deploy to Cloudhub'){
        	steps {
			script {
			    LAST_STARTED = env.STAGE_NAME
				sh 'mvn package deploy -DmuleDeploy -DskipTests -Danypoint.username=ssajangeorge -Danypoint.password=Jerry@123 -DapplicationName=jenkins-test'
            }
       }
   }
   
    }  
   }
