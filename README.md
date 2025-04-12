# 📈 Yahoo Finance Data Pipeline with Docker + Kubernetes

This project is a containerized and Kubernetes-ready pipeline that fetches stock data from the Yahoo Finance API, stores the raw data in AWS S3, transforms it, and re-uploads the cleaned output—all using scheduled jobs on Kubernetes.

---

## 🚀 Features

- ✅ Fetches real-time stock data using the Yahoo Finance API
- ✅ Stores raw and transformed datasets in separate S3 prefixes
- ✅ Containerized with Docker
- ✅ Kubernetes-compatible with a CronJob for automated scheduling
- ✅ Environment-configurable via ConfigMaps and Secrets
- ✅ Designed for Minikube, Podman, or full production clusters

---

## 🧱 Folder Structure

```
finance_docker_kubernetes/
├── fetch_data.py
├── transform_data.py
├── Dockerfile
├── requirements.txt
├── pod.yaml                 # For Podman (play kube)
├── k8s/                     # Kubernetes YAMLs
│   ├── deployment.yaml
│   ├── cronjob.yaml
│   ├── configmap.yaml
│   └── secret.yaml.template
└── README.md
```

---

## 🐳 Docker Setup

### 1. Build the Docker image:

```bash
docker build -t yahoo-finance-pipeline .
```

---

## ☸️ Kubernetes Setup

> Works on Minikube, Docker Desktop (K8s enabled), or remote clusters.

### 1. Configure AWS Credentials Securely

Copy and fill in `secret.yaml.template`:

```bash
cp k8s/secret.yaml.template k8s/secret.yaml
# edit with your credentials
```

> ❗️**Never commit actual credentials to GitHub.**

---

### 2. Apply Kubernetes Resources

```bash
kubectl apply -f k8s/secret.yaml
kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/cronjob.yaml   # or deployment.yaml
```

### 3. Verify the CronJob

```bash
kubectl get cronjob
kubectl get pods
kubectl logs <pod-name>
```

---

## 🗂 Environment Variables

These are injected via Kubernetes `ConfigMap` and `Secret`:

```yaml
S3_BUCKET_NAME: your-bucket-name
RAW_PREFIX: raw/
TRANSFORMED_PREFIX: transformed/
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

---

## 🧪 Podman Support

To use this with Podman:

```bash
podman play kube pod.yaml
```

This spins up the pipeline pod and runs your scripts using local container runtime.

---

## ✅ Roadmap & Improvements

- [ ] Add schema validation
- [ ] Schedule via EventBridge (AWS-native)
- [ ] Add test cases and GitHub Actions CI
- [ ] Push results to a database or data warehouse
- [ ] Visualize with Streamlit or Dash

---

## 👨‍💻 Author

**Shiva Prakash Perumal**  
[GitHub](https://github.com/Shiva-prakash-perumal) | [LinkedIn](https://linkedin.com/in/shiva-prakash-perumal)

---

## 🪪 License

This project is licensed under the [MIT License](LICENSE).