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
                echo 'i'm just sayin...'
            }
        }
		stage("build and push docker image") {
			steps {
				echo "building the image"
				docker.build("${USER}/${REP}:${VERSION}", "--build-arg JAR_VERSION=${VERSION} --build-arg JAR_ARTIFACT_ID=${ART_ID} -f Dockerfile .")
				bat 'docker push ${USER}/${REP}:${VERSION}'
			}
        }
    }
}