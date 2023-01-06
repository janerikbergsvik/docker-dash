export-req: 
	poetry export --without-hashes --format=requirements.txt | awk '{print $1}' >./project/requirements.txt

container-shell:
	docker exec -ti fastapi-sqlmodel-alembic-base-web-1 /bin/bash

build: 
	docker build -f Dockerfile -t docker-dash-example-prod .
	
log:
	docker-compose logs

dev-down:
	docker-compose down -v

dev:
	docker build -f Dockerfile -t docker-dash-example-prod .
	docker run -p 8050:8050 -v app:/app --rm docker-dash-example-prod
