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
        stage("say something") {
            steps {
                echo 'Im just sayin'
				echo 'open'
				bat "docker network create ${networkId}"
				script {
					inner.call(networkId)
					}
				bat "docker network rm ${networkId}"
				echo 'close'
            }
        }
		
		
    }
}