#!/usr/bin/env groovy

credential="surveydonkey-github-user"

jobDsl scriptText: """
  multibranchPipelineJob("surveydonkey-microservices-build/SurveyDonkey-Service-Poll") {
    factory {
      workflowBranchProjectFactory {
        scriptPath('Jenkinsfile.build')
      }
    }
    
    triggers {
      periodicFolderTrigger{
        interval('1h')
      }
    }

    branchSources {
      github {
        id('SurveyDonkey-Service-Poll')
        scanCredentialsId('${credential}')
        repoOwner('${repoOwner}')
        repository('${repoName}')

        buildOriginPRHead(true)
        buildForkPRHead(true)
        buildOriginPRMerge(false)
        buildOriginBranch(true)
        buildForkPRMerge(false)
        buildOriginBranchWithPR(false)

        includes("master release* PR*")
        excludes("gh-pages")
      }
    }
  }
"""