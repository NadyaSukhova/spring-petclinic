pipeline {
    agent any
    environment {
        JAR_VERSION = sh (returnStdout: true, script: 'mvn help:evaluate -Dexpression=project.version -q -DforceStdout').trim()
        JAR_ARTIFACT_ID = sh (returnStdout: true, script: 'mvn help:evaluate -Dexpression=project.artifactId -q -DforceStdout').trim()
        DOCKER_HUB_VERSION = JAR_VERSION.replace("-SNAPSHOT", "-snapshot")
        DOCKER_HUB_USER = 'puffik4ever'
        DOCKER_HUB_REPOSITORY = 'petclinic'
    }
    stages {
        stage("say something") {
            steps {
                echo 'Im just sayin'
            }
        }
		stage("build and push docker image") {
			steps {
				echo "building the image"
				docker.build("${DOCKER_HUB_USER}/${DOCKER_HUB_REPOSITORY}:${DOCKER_HUB_VERSION}", "--build-arg JAR_VERSION=${JAR_VERSION} --build-arg JAR_ARTIFACT_ID=${JAR_ARTIFACT_ID} -f Dockerfile .")
				sh 'docker push ${DOCKER_HUB_USER}/${DOCKER_HUB_REPOSITORY}:${DOCKER_HUB_VERSION}'
			}
        }
    }
}