#!/usr/bin/env groovy

repoOwner = "james-ni"
repoName = "surveydonkey-service-poll"

echo "Loading template..."
load("jobs/surveydonkey-microservices-build/microservices_build_multibranch_template.dsl")