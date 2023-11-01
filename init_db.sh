kubectl exec -it postgres -n db -- bash -c 'psql -U postgres -c "CREATE DATABASE wordpress;"'
kubectl exec -it postgres -n db -- bash -c 'psql -U postgres -d wordpress -c "CREATE USER wordpress WITH PASSWORD '\''postgrespassword'\'';"'
kubectl exec -it postgres -n db -- bash -c 'psql -U postgres -d wordpress -c "CREATE SCHEMA IF NOT EXISTS wordpress AUTHORIZATION wordpress;"'
kubectl exec -it postgres -n db -- bash -c 'psql -U postgres -d wordpress -c "ALTER USER wordpress SET search_path = wordpress;"'

test
