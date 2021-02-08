FROM dhaks/mule4.3.0

COPY /Users/sachinsajan/AnypointStudio/myTrains/jenkins-test/target/*.jar /opt/mule/apps/

EXPOSE 8081

CMD ["/opt/mule/bin/mule"]
