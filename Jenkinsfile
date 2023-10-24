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
        sh ' echo BUILDING IMAGE ------------------- '
        sh 'docker build -t jorgescarenzi/ecom:$BUILD_NUMBER .'
      }
    }
    
    stage('test') {
      steps {
        sh 'echo VALIDATING PORT AND INSTANCE RUNNING ----- '
        sh 'chmod +x -R $WORKSPACE/checkport.sh'
        sh 'bash $WORKSPACE/checkport.sh 80'
        sh 'chmod +x -R $WORKSPACE/checkrunning.sh'
        sh 'bash $WORKSPACE/checkrunning.sh '
        sh ' echo RUNNING NEW INSTANCE FOR TESTING -------- '
        sh 'docker run -d -p 1000:80 --name ecomtest jorgescarenzi/ecom:$BUILD_NUMBER '
        sh 'sleep 30'
        sh 'chmod +x -R $WORKSPACE/test.sh'
        sh 'bash $WORKSPACE/test.sh'
      }
    }
    
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    
    stage('Push') {
      steps {
        sh 'echo PUSHING IMAGE TO DOCKERHUB --------- '
        sh 'docker push jorgescarenzi/ecom:$BUILD_NUMBER'
      }
    }
  
  stage('Remove Unused docker image') {
      steps{
        sh 'echo CLEAN UP DOCKER  ----------- '
        sh 'docker stop $(docker ps -a -q)'
        sh 'docker rm $(docker ps -a -q)'
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
