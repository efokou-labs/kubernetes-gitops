# kubernetes-gitops

Desired state for the shared kind (and later EKS) cluster. CI builds images in application repos; **this** repo changes tags and overlays. Humans do not `kubectl apply` in production.

## Promotion

| Overlay | How it moves |
| --- | --- |
| `dev` | Merge to `main` can update image tags automatically |
| `staging` | PR from `dev` values; smoke tests |
| `prod` | Protected environment, manual approval |

Argo CD reconciles, detects drift, and rolls back by reverting Git.

Optional later: Argo Rollouts canary 5% → 20% → 50% → 100% gated on error rate and latency (see `docs/rollouts.md`).

## Verify

```bash
make verify
```

## Bootstrap

After `make kind-up` in cloud-platform-blueprint:

```bash
kubectl apply -f bootstrap/root-application.yaml
```

The Askel `dev` overlay runs Postgres and Redis in-cluster (emptyDir). Live product: [getaskel.com](https://www.getaskel.com/). UI: `kubectl -n askel port-forward svc/askel-web 3000:80`.

## License

The source code for this project is licensed under the MIT License. Personal content, including my resume, photographs, written content, branding, and other identifying materials, is not covered by this license and may not be reused without permission.

See [LICENSE](LICENSE).

