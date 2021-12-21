pipeline {
    agent any
	environment {
		user = 'puffik4ever'
		rep = 'petclinic'
		version = '2.5.0-SNAPSHOT'
		art_id = 'spring-petclinic'
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
					docker.build("${user}/${rep}:${version}", "--build-arg JAR_VERSION=${version} --build-arg JAR_ARTIFACT_ID=${art_id} -f Dockerfile .")
				}
			}
        }
		stage("push docker image") {
		steps {
			withCredentials([usernamePassword(credentialsId: 'credentials', usernameVariable: 'user', passwordVariable: 'PASSWORD')]) {
						echo "login in and pushing the image"
						bat 'docker push ${user}/${rep.toLowerCase()}:${version.toLowerCase()}'
					}
			}
		}
    }
}