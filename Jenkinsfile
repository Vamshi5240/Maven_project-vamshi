pipeline {
    agent any
    
    tools {
        maven "Maven3"
    }
       
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Aseemakram19/maven-app.git'
            }
        }
        
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Create Docker Image') {
            steps {
                sh 'docker build -t aseem1 .'
            }
        }
        
        stage('Check Port') {
            steps {
                script {
                    def portStatus = sh(script: 'netstat -tuln | grep ":9000"', returnStatus: true)
                    if (portStatus == 0) {
                        echo "Port 9000 is in use, stopping and removing the existing container"
                        sh 'docker stop aseem_container'
                        sh 'docker rm aseem_container'
                    } else {
                        echo "Port 9000 is available"
                    }
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 9000:8080 --name aseem_container -t aseem1'
            }
        }
    }
}
