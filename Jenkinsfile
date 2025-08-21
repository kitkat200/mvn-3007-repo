pipeline {
    agent any
    
    tools {
        jdk "java-17"
        maven "maven-3.9.11"
    }

    stages {
        stage('maven clean and build'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('scanning code'){
            environment {
                SONAR_TOKEN = credentials('sonarqube')
            }
            steps{
                sh 'mvn clean package sonar:sonar -Dsonar.projectKey=newsonarbinorg_dev-project -Dsonar.organization=newsonarbinorg -Dsonar.projectName=dev-project -Dsonar.host.url=https://sonarcloud.io/ -Dsonar.login=$SONAR_TOKEN'
            }
        }
    }
}