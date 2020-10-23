all: lint

lint: helmfile-lint

helmfile-lint:
	helmfile -e default lint

encrypt:
	cd ./argo-cd/environments/default && helm secrets enc argo-cd-secrets.yaml

decrypt:
	cd ./argo-cd/environments/default && helm secrets dec argo-cd-secrets.yaml
