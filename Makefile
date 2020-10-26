all: lint

install-plugin:
	helm plugin install https://github.com/futuresimple/helm-secrets

add-repo:
	helm repo add argo https://argoproj.github.io/argo-helm

lint: helmfile-lint

helmfile-lint:
	helmfile -e default lint

encrypt:
	cd ./argo-cd/environments/default && helm secrets enc argo-cd-secrets.yaml

decrypt:
	cd ./argo-cd/environments/default && helm secrets dec argo-cd-secrets.yaml
