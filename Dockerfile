# Use a specific version of Tomcat as base image
FROM tomcat:9.0-jre8

# Expose port 8080 to access the application
EXPOSE 8080

# Copy the WAR file from the target directory of your Maven project to the Tomcat webapps directory
COPY target/01-maven-web-app-3.0-RELEASE.war /usr/local/tomcat/webapps/ROOT.war
