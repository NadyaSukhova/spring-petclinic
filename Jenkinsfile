def checkCurlOutput(String curlOutput) {
    return curlOutput.contains('<title>PetClinic :: a Spring Framework demonstration</title>')
}

pipeline {
    agent any
	environment {
		USER = 'puffik4ever'
		REP = 'petclinic'
		VERSION = '2.5.0-SNAPSHOT'
		ART_ID = 'spring-petclinic'
		NET_PET = UUID.randomUUID().toString()
	}
    stages {
        stage("say something and create nerwork") {
            steps {
                echo 'Im just sayin'
				echo 'open'
				bat "docker network create ${NET_PET}"
				bat "docker network rm ${NET_PET}"
				echo 'close'
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
		stage("login and push into docker image") {
			steps {
				withCredentials([usernamePassword(credentialsId: 'credentials_dockerhub', passwordVariable: 'pass_dockerhub', usernameVariable: 'user_dockerhub')]) {
					echo "loging in Docker Hub"
					bat "echo ${pass_dockerhub}| docker login -u ${user_dockerhub} --password-stdin"
					echo "pushing into Docker Hub"
					bat "docker push ${USER}/${REP}:${VERSION}"
				}
			}
		}
		stage("pull curl") {
            steps {
				bat "docker pull curlimages/curl:7.81.0"
				echo "pull curl, yo"
            }
        }
		stage("pull and run from Docker Hub") {
            steps {
				echo "pulling from Docker Hub"
                bat "docker pull ${USER}/${REP}:${VERSION}"
				echo "run the app"
				bat "docker run -d -p 3000:3000 ${USER}/${REP}:${VERSION}"
				echo "now it is curl time"
            }
        }
		stage("run curl") {
            steps {
				echo "run curl container"
				script {
					sleep(60)
					def curlOutput = bat (script: "docker run --rm curlimages/curl:7.81.0 -L -v http://localhost:3000/",
										  returnStdout: true)
					if (!checkCurlOutput(curlOutput)) {
							warnError(message: 'FAIL')
						} 
					else {
							println("SUCCESS")
						}
				}
            }
        }
    }
}

				