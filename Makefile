.PHONY: docs clean upload build

docs: ## Update python docs
	@cd docs; sphinx-apidoc -f -o ./source ../haicu
	@cd docs; make html

clean: ## Clean python cache files
	@rm -rf rm -rf build/ dist/ haicu.egg-info/ haicu/__pycache__
	@cd docs; make clean

build:
	@python -m build -w -s

test: ## Build and upload python scripts to testpypi
	@make clean build
	@twine upload -r testpypi dist/* || true

upload: ## Build and upload python scripts
	@make clean build
	@twine upload -r pypi dist/* || true
