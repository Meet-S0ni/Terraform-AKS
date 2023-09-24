while [[ $(kubectl get pods -n db -l app=postgres -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') != "True" ]]; do
    echo "waiting for tsdb to be ready..."
    sleep 5

done

echo "postgres database is ready! "