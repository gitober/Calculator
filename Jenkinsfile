pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/gitober/Calculator', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Code Coverage') {
            steps {
                jacoco execPattern: '**/target/jacoco.exec'
            }
        }
    }

    post {
        always {
            // Publish JUnit test results
            junit '**/target/surefire-reports/*.xml'

            // Publish JaCoCo code coverage report
            jacoco execPattern: '**/target/jacoco.exec',
                   classPattern: '**/target/classes',
                   sourcePattern: '**/src/main/java',
                   inclusionPattern: '**/*.class'
        }
    }
}
