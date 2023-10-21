pipeline {
  agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  
  stages {
  
    stage('gitclone') {
      steps {
        git branch : "main", url:'https://github.com/jorgescarenzi/TP7'
      }
    }
    
    stage('Build') {
      steps {
        sh 'docker build -t jorgescarenzi/ecom:$BUILD_NUMBER .'
      }
    }
    
    stage('test') {
      steps {
        sh 'docker run -d -p 1000:80 jorgescarenzi/ecom:$BUILD_NUMBER'
        sh 'response=$(curl -s -o /dev/null -w "%{http_code}\n" http://localhost:1000/#product-list)
        if [ "$response" != "200" ] {
        then
        exit 1
        else
        print "TEST PASSED"
        fi' 
        }
      }
    }
    
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    
    stage('Push') {
      steps {
        sh 'docker push jorgescarenzi/ecom:$BUILD_NUMBER'
      }
    }
  
  stage('Remove Unused docker image') {
      steps{
        sh 'docker rmi jorgescarenzi/ecom:$BUILD_NUMBER'
      }
    }
  }
   
  post {
    always {
      sh 'docker logout'
    }
  }
}
