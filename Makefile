.PHONY : test-local test-local-file serve build-docs check-readme lint format dev-setup test_setting_b

test:
	poetry run python -m migrate
	poetry run python -m pytest --ds=testproject.settings -m 'not settings_b' --cov=gql_social_auth --cov-report=xml

serve:
	python docs/pre_build.py
	mkdocs serve

build-docs:
	poetry install
	python docs/pre_build.py
	mkdocs build

# gh only!
deploy-docs:
	python -m pip install -r docs/requirements.txt
	python docs/pre_build.py
	mkdocs gh-deploy --force
