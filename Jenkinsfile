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
					 dir 'C:\\Users\\Hope\\petclinic\\spring-petclinic'
					 reuseNode true
				}
			}
			steps {
				echo "building the image"
			}
        }
    }
}