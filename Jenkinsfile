pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  
  stages {
    
    stage('gitclone') {
      steps {
        git 'https://github.com/jorgescarenzi/TP7'
        sh 'git "checkout main" 
      }
    }
    
    stage('Build') {
      steps {
        sh 'docker build -t jorgescarenzi/ecom + ":$BUILD_NUMBER" .'
      }
    }
    
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    
    stage('Push') {
      steps {
        sh 'docker push jorgescarenzi/ecom + ":$BUILD_NUMBER"'
      }
    }
  }
  
  post {
    always {
      sh 'docker logout'
    }
  }
}
