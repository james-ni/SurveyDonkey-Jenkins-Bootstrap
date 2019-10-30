#!/usr/bin/env groovy

pipeline {
  agent any
  
  stages {
    stage('Creat Jobs') {
      steps {
        script {
          echo 'creating SurveyDonkey-microservices-build folder'
          build_folder = "surveydonkey-microservices-build"
          jobDsl scriptText:
          """
            folder('${build_folder}'){
              description 'collection of microservice build pipelines'
            }
            
          """
          load "jobs/${build_folder}/surveydonkey-service-poll.groovy"
        }
      }
    }    
  }
}
