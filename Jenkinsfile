pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh ""
        docker build -t xanderire/duo-deploy-flask:latest -t 
        xanderire/duo-deploy-flask:v$BUILD_NUMBER .
        ""
      }
    }
    stage('Push') {
      steps {
        sh ""
        docker push xanderire/duo-deploy-flask:latest
        docker push xanderire/duo-deploy-flask:v$BUILD_NUMBER
        ""
      }
    }
    stage('Cleanup') {
      steps {
        sh ""
        docker rmi xanderire/duo-deploy-flask:latest
        docker rmi xanderire/duo-deploy-flask:v$BUILD_NUMBER
        ""
      }
    }
    stage('Deploy') {
      steps {
        sh ""
        kubectl apply -f ./k8s-deployments
        kubectl rollout restart deployment flask-deployment
        ""
      }
    }
  }
}
