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
			withCredentials([usernamePassword(credentialsId: 'credentials', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
						echo "login in and pushing the image"
						echo '$PASSWORD"
						bat "echo ${PASSWORD} | docker login -u ${USER} --password-stdin"
						sh "docker push ${USER}/${REP}:${VERSION.toLowerCase()}"
					}
			}
		}
    }
}