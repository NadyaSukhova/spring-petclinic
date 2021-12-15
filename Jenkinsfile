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
					 dir '/c/Users/Hope/AppData/Local/Jenkins/.jenkins/workspace/petclinic-pipeline_main@2/'
				}
			}
			steps {
				echo "building the image"
			}
        }
    }
}