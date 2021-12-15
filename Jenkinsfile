pipeline {
    agent { dockerfile true }
    stages {
        stage("build") {
            steps {
                echo 'building the app'
            }
        }
		stage("create docker image") {
            steps {
                dir (env.WORKSPACE) {
					sh 'docker build Dockerfile'
				}
            }
        }
    }
}