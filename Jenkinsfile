pipeline {
    agent any

    stages {
        stage('Validate') {
            steps {
                git 'https://github.com/vijaymargam/jenkins-file-project.git'
                 sh 'mvn validate'
                echo 'Building..'
            }
        }
        stage('Compile') {
            steps {
                git 'https://github.com/vijaymargam/jenkins-file-project.git'
                sh 'mvn compile'
                echo 'Compileing'
            }
        }
        stage('Test') {
            steps {
                git 'https://github.com/vijaymargam/jenkins-file-project.git'
                sh 'mvn test'
                                
                echo 'Testing'
            }
        }
        stage('Report') {
            steps {
                git 'https://github.com/vijaymargam/jenkins-file-project.git'
                sh 'mvn cobertura:cobertura -Dcobertura.report.format=xml'
                echo 'Compileing'
            cobertura autoUpdateHealth: false, autoUpdateStability: false, coberturaReportFile: '**/target/site/cobertura/coverage.xml', conditionalCoverageTargets: '70, 0, 0', failUnhealthy: false, failUnstable: false, lineCoverageTargets: '80, 0, 0', maxNumberOfBuilds: 0, methodCoverageTargets: '80, 0, 0', onlyStable: false, sourceEncoding: 'ASCII', zoomCoverageChart: false

                
            }
        }
            stage('Document') {
            steps {
                git 'https://github.com/vijaymargam/jenkins-file-project.git'
                 sh 'mvn javadoc:javadoc'
                echo 'Building..'
            }
        }
        stage('Sonarqube') {
            steps {
                git 'https://github.com/vijaymargam/jenkins-file-project.git'
                withSonarQubeEnv('sonar1') {
      sh 'mvn clean  sonar:sonar'
    } // SonarQube taskId is automatically attached to the pipeline context
                echo 'Testing'
            }
        }
        stage('Package') {
            steps {
                git 'https://github.com/vijaymargam/jenkins-file-project.git'
                sh 'mvn package'
                echo 'Packageing'
            }
        }
         stage('Nexus') {
            steps {
                git 'https://github.com/vijaymargam/jenkins-file-project.git'
                sh 'mvn deploy'
                echo 'Nexus'
            }
        }
        stage('Deploying') {
            steps {
                git 'https://github.com/vijaymargam/jenkins-file-project.git'
                sh 'mvn clean package'
                sh 'mvn tomcat7:deploy'
                echo 'Deploying'
            }
        }
    }
}
