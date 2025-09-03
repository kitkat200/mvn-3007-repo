pipeline{
    agent any
    tools{
        jdk 'java-17'
        maven 'maven-3.9.11'
    }
    options{
        buildDiscarder(logRotator(numToKeepStr: '1', artifactNumToKeepStr: '1'))
    }
    stages{
        stage('clean installation'){
            steps{
                sh "mvn clean install"
            }
        }
        stage('image build'){
            steps{
                sh "docker image build -t dockluck24/java-mvn-app:v2 ."
            }
        }
        stage('image push'){
            steps{
                script{
                    withDockerRegistry(credentialsId: 'docker-credentials') {
                        sh "docker image push dockluck24/java-mvn-app:v2"
                    }
                }
            }
        }
    }
    post{
        always{
            echo "cleaning up old builds"
        }
        success{
            echo "Build succeeded"
        }
        
        failure{
            echo "build failed"
        }
    }
}