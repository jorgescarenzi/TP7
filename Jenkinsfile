pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    $ECOM=jorgescarenzi/ecom
  }
  
  stages {
  
    stage('gitclone') {
      steps {
        git branch : "main", url:'https://github.com/jorgescarenzi/TP7'
      }
    }
    
    stage('Build') {
      steps {
        sh 'docker build -t $ECOM:$BUILD_NUMBER .'
      }
    }
    
    stage('test') {
      steps {
        dif response = httpRequest "http://localhost:80"
        println('Status: '+response.status)
        println('Response: '+response.content)
      }
    }
    
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    
    stage('Push') {
      steps {
        sh 'docker push $ECOM:$BUILD_NUMBER'
      }
    }
  }
  
  stage('Remove Unused docker image') {
      steps{
        sh 'docker rmi $ECOM + :$BUILD_NUMBER'
      }
    }
  
  post {
    always {
      sh 'docker logout'
    }
  }
}
