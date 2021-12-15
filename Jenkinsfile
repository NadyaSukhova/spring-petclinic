pipeline {
    agent any
    stages {
        stage("build") {
            steps {
                echo 'building the app'
            }
        }
		stage("create docker image") {
			agent { dockerfile {
					 dir './Dockerfile'
				}
			}
			steps {
				echo "building the image"
			}
        }
    }
}