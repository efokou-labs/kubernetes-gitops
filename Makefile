.PHONY: verify
verify:
	kubectl kustomize apps/root >/tmp/portfolio-gitops-root.yaml
	kubectl kustomize apps/career-workspace/overlays/dev >/dev/null
	kubectl kustomize apps/distributed-job-processor/overlays/dev >/dev/null
	kubectl kustomize apps/agentic-ai-platform/overlays/dev >/dev/null
	kubectl kustomize apps/observability-lab/overlays/dev >/dev/null
	@echo kubernetes-gitops verify passed
