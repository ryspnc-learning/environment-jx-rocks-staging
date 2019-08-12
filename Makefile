CHART_REPO := http://jenkins-x-chartmuseum:8080
DIR := "env"
NAMESPACE := "cd-staging"
OS := $(shell uname)

build: clean
	rm -rf requirements.lock
	helm version
	helm init
	helm repo add releases ${CHART_REPO}
	helm repo add jenkins-x http://chartmuseum.jenkins-x.io
	helm dependency build ${DIR}
	helm lint ${DIR}

install: 
	helm upgrade ${NAMESPACE} ${DIR} --install --namespace ${NAMESPACE} --debug

delete:
	helm delete --purge ${NAMESPACE}  --namespace ${NAMESPACE}

clean:


test:
    ADDRESS=go-demo-6.cd-staging.35.190.149.250.nip.io go test -v
test:
    ADDRESS=go-demo-6.cd-staging.35.190.149.250.nip.io go test -v
