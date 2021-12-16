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
					 dir "C://Users/Hope/petclinic/spring-petclinic"
				}
			}
			steps {
				echo "building the image"
			}
        }
    }
}