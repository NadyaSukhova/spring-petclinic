pipeline {
    agent any
	environment {
		USER = 'puffik4ever'
		REP = 'petclinic'
		VERSION = '2.5.0-SNAPSHOT'
		ART_ID = 'spring-petclinic'
		NET_PET = UUID.randomUUID().toString()
		NET_CURL = UUID.randomUUID().toString()
	}
    stages {
        stage("say something and create nerwork") {
            steps {
                echo 'Im just sayin'
				echo 'open'
				bat "docker network create ${NET_PET}"
				bat "docker network rm ${NET_PET}"
				echo 'close'
            }
        }

    }
}