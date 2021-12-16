pipeline {
    agent any
    stages {
        stage("build") {
            steps {
                echo 'building the app'
            }
        }
		stage("create docker image") {
			steps {
				echo "building the image"
				sh 'docker build .'
			}
        }
    }
}