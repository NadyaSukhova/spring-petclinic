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
					 filename 'Dockerfile'
					 dir '/c/Users/Hope/AppData/Local/Jenkins/.jenkins/workspace/petclinic-pipeline_main/'
				}
			}
			steps {
				echo "building the image"
			}
        }
    }
}