pipeline {
    agent any
	environment {
		USER = 'puffik4ever'
		rep = 'petclinic'
		VERSION = '2.5.0-SNAPSHOT'
		HUB_VERSION = '2.5.0-snapshot'
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
					docker.build("${USER}/${rep}:${VERSION}", "--build-arg JAR_VERSION=${VERSION} --build-arg JAR_ARTIFACT_ID=${ART_ID} -f Dockerfile .")
				}
			}
        }
		stage("push docker image") {
		steps {
			withCredentials([usernamePassword(credentialsId: 'credentials', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
						echo "login in and pushing the image"
						bat 'docker push ${USER}/${rep}:${HUB_VERSION}'
					}
			}
		}
    }
}