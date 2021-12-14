def dv

pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    parameters {
        //string(name: 'VERSION', defaultValue: '', description: 'version to deploy on prod')
        choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
        booleanParam(name: 'executeTests', defaultValue: true, description: '')
    }
    environment {
        NEW_VERSION = '1.3.0'
    }
    stages {
        stage("build") {
            when {
                expression {
                    BRANCH_NAME == 'main'
                }
            }
            steps {
                gv.buildApp()
                //sh 'mvn install'
            }
        }

        stage("test") {
            when {
                expression {
                    BRANCH_NAME == 'main' || BRANCH_NAME == 'master'
                }
            }
            steps {
                echo "testing"
                gv.testApp()
            }
        }

        stage("deploy") {
            when {
                expression {
                    params.executeTests == true // or just params.executeTests
                }
            }
            steps {
                echo "deploying version ${params.VERSION}"
                gv.deployApp()
            }
        }
    }
}