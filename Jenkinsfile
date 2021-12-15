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
                dir ('docker') {
					sh 'docker build.'
				}
            }
        }
    }
}