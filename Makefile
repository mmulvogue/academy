export ORG_NAME?=devopsacademyau
export REPO_NAME?=academy
export BRANCH_NAME?=
export FOLDER_NAME?=

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

dashboard:   # Creates a scorecard dashboard in CSV. You can pass GH_USER and GH_TOKEN to authenticate in GitHub
	$(ROOT_DIR)/scripts/dashboard.sh ${GH_USER} ${GH_TOKEN}

presentation:
	docker-compose up -d
	sleep 5
	open "http://localhost:9000/${ORG_NAME}/${REPO_NAME}?p=${FOLDER_NAME}"

stop:
	docker-compose down

pitchme_to_readme:
  #Example: FOLDER_NAME=classes/01class/git/ make pitchme_to_readme
	#Example: FOLDER_NAME=classes/01class/git/ BRANCH_NAME=MY_BRANCH make pitchme_to_readme
	bash scripts/pitchme_to_readme.sh

rtr-cleanup:
	$(ROOT_DIR)/scripts/rtr-cleanup.sh ${GH_USER} ${GH_TOKEN}