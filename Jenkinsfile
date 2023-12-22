pipeline {
    agent any
    stages {
        stage('Compilation') {
            steps {
                sh './gradlew compileJava'
            }
        }
        stage('Test unitaire') {
            steps {
                sh './gradlew test'
            }
        }
        stage('Code coverage') {
            steps {
                sh './gradlew jacocoTestReport'
                publishHTML(target : [allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: 'reports',
                reportFiles: 'myreport.html',
                reportName: 'My Reports',
                reportTitles: 'The Report'])
                sh './gradlew jacocoTestCoverageVerification'
            }
        }
        stage('Analyse statistique du code') {
                steps {
                sh './gradlew checkstyleMain'
                publishHTML(target : [allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: 'reports',
                reportFiles: 'myreport.html',
                reportName: 'My Reports',
                reportTitles: 'The Report'])
                }
        }
        stage('Package') {
            steps {
                sh './gradlew build'
            }
        }
        stage('Docker build') {
            steps {
                sh 'docker build -t calculator .'
        }
        }
        stage("Docker push") {
            steps {
                sh "docker push localhost:5000/calculator"
        }
        }
        stage("Déploiement sur staging") {
            steps {
                sh "docker run -d --rm -p 8765:8080 --name calculator localhost:5000/calculator"
        }
        }
    }
}
