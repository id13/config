function prodbox --description "Open a bash shell in the prodbox pod"
    set -l pod (kubectl get pods --no-headers 2>/dev/null | awk '/prodbox/ && $3 == "Running" {print $1; exit}')

    if test -z "$pod"
        echo "😢 No running prodbox pod found in the current context/namespace."
        return 1
    end

    echo "→ Connecting to $pod"
    kubectl exec -it $pod -- bash
end
