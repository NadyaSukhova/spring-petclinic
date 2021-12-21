pipeline {
    agent any
	environment {
		USER = 'puffik4ever'
		REP = 'petclinic'
		VERSION = '2.5.0-SNAPSHOT'
		ART_ID = 'spring-petclinic'
	}
    stages {
        stage("say something") {
            steps {
                echo 'Im just sayin'
            }
        }
		stage("build docker image") {
			steps {
				echo "building the image"
				
				script {
					docker.build("${USER}/${REP}:${VERSION}", "--build-arg JAR_VERSION=${VERSION} --build-arg JAR_ARTIFACT_ID=${ART_ID} -f Dockerfile .")
				}
			}
        }
		stage("login and push docker image") {
			steps {
				withCredentials([usernamePassword(credentialsId: 'credentials_dockerhub', passwordVariable: 'pass_dockerhub', usernameVariable: 'user_dockerhub')]) {
					bat "echo ${pass_dockerhub} | docker login -u ${user_dockerhub} --password-stdin"
				}
			}
		}
    }
}