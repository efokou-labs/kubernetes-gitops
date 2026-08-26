# Progressive delivery

When Argo Rollouts is installed on the cluster, canary weights are 5, 20, 50, then 100.

Promotion gates (to be wired to Prometheus):

- error rate below the overlay SLO
- p99 latency below the overlay SLO

Until Rollouts is enabled, Deployment rolling updates are the default.
