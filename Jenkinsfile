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
                sh 'mvn sonar:sonar'
            }
        }
    }
}