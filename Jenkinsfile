pipeline {
    agent any
    stages {
        stage("Compilation") {
            steps {
                sh "./gradlew compileJava"
            }
        }
        stage("Test unitaire") {
            steps {
                sh "./gradlew test"
            }
        }
        stage("Code coverage") {
            steps {
                sh "./gradlew jacocoTestReport"
                publishHTML (target : [allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: 'reports',
                reportFiles: 'myreport.html',
                reportName: 'My Reports',
                reportTitles: 'The Report'])
                sh "./gradlew jacocoTestCoverageVerification"
            }
        }
    }
}
