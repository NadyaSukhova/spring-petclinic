pipeline {
    agent any
    stages {
        stage("build") {
            steps {
                echo 'building the app'
            }
        }
		stage("create docker image") {
			environment {
                HOME="."
            }
			agent { dockerfile {
					 filename 'Dockerfile'
				}
			}
			steps {
				echo "building the image"
			}
        }
    }
}