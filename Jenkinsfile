pipeline {
    agent {
        node {
            label "maven-build-server"
        }
    }

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
            steps{
                sh 'mvn sonar:sonar -Dsonar.projectKey=newsonarbinorg_dev-project -Dsonar.projectName=dev-project -Dsonar.organization=newsonarbinorg -Dsonar.host.url=https://sonarcloud.io -Dsonar.token=fce9ce232828c3347bc69fa767562a4de61fee92'
            }
        }
    }
}