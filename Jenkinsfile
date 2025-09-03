pipeline{
    agent any
    tools{
        jdk 'java-17'
        maven 'maven-3.9.11'
    }
    options{
        buildDiscarder(logRotation(numtokeepstr: '3', artifactNumtokeepstr: '2'))
    }
    stages{
        stage('clean installation'){
            steps{
                sh "mvn clean install"
            }
        }
        stage('image build'){
            steps{
                sh "docker image build -t dockluck24/java-mvn-app:v1 ."
            }
        }
        stage('image push'){
            steps{
                script{
                    withDockerRegistry(credentialsId: 'docker-credentials') {
                        sh "docker image push dockluck24/java-mvn-app:v1"
                    }
                }
            }
        }
        stage('container creation'){
            steps{
                sh "docker container run --name javaweb -dit -p 7005:80 dockluck24/java-mvn-app:v1"
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