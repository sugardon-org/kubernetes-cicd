export GPG_TTY=$(tty)

all: lint

setup:
	pip install -r requirements.txt

install-plugin:
	helm plugin install https://github.com/futuresimple/helm-secrets

add-repo:
	helm repo add argo https://argoproj.github.io/argo-helm

lint: yamllint helmfile-lint

helmfile-lint:
	helmfile -e default lint

yamllint:
	yamllint -c .yamllint.yaml ./

encrypt:
	cd ./argo-cd/environments/default && helm secrets enc argo-cd-secrets.yaml

decrypt:
	cd ./argo-cd/environments/default && helm secrets dec argo-cd-secrets.yaml
