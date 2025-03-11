# PlatformNOW Helm Charts

<p align="center">
    <a href="https://github.com/platformnow/helm-charts/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" alt="License"></a>
    <a href="https://github.com/platformnow/helm-charts/actions/workflows/release.yml"><img src="https://github.com/platformnow/helm-charts/workflows/Release%20Charts/badge.svg?branch=main" alt="Release Charts"></a>
    <a href="https://github.com/platformnow/helm-charts/releases"><img src="https://img.shields.io/github/downloads/platformnow/helm-charts/total.svg" alt="Downloads"></a>
    <a href="https://github.com/platformnow/helm-charts/actions"><img src="https://github.com/platformnow/helm-charts/workflows/Release%20Charts/badge.svg?branch=main" alt="Build Status"></a>
</p>

## Introduction

This repository contains [Helm](https://helm.sh) charts for various projects used by PlatformNOW. The charts are available in the [PlatformNOW Helm Charts Repository](https://platformnow.github.io/helm-charts).

## Available Charts

### Parent Charts (with dependencies)

These charts serve as parent charts that include specific dependencies:

| Chart | Description | Dependencies |
|-------|-------------|--------------|
| aws-ebs-csi-driver | AWS EBS CSI driver | aws-ebs-csi-driver v2.34.0 |
| aws-load-balancer-controller | AWS Load Balancer Controller | aws-load-balancer-controller v1.6.2 |
| cert-manager | Certificate management controller | cert-manager v1.17.1 |
| cluster-autoscaler | Kubernetes cluster autoscaler | cluster-autoscaler v9.46.2 |
| crossplane | Cloud native control plane framework | crossplane v1.19.0 |
| external-dns | External DNS controller | external-dns v1.15.2 |
| external-secrets | External Secrets operator | external-secrets v0.14.3 |
| istio-base | Istio base components | base v1.25.0 |
| istio-ingress | Istio ingress gateway | gateway v1.25.0 |
| istiod | Istio control plane | istiod v1.25.0 |
| localstack | LocalStack - A fully functional local AWS cloud stack | localstack v0.6.22 |
| metrics-server | Kubernetes metrics server | metrics-server v3.12.2 |
| opentelemetry-operator | OpenTelemetry Operator | opentelemetry-operator v0.71.3 |

### Standalone Charts

These are individual service charts:

| Chart | Description |
|-------|-------------|
| adservice | Advertisement Service |
| argo-cd | Declarative GitOps CD for Kubernetes |
| cartservice | Shopping Cart Service |
| checkoutservice | Checkout Service |
| common | Common chart templates and helpers |
| currencyservice | Currency Service |
| emailservice | Email Service |
| frontendservice | Frontend Service |
| landscape-backend | Landscape Backend Service |
| landscape-frontend | Landscape Frontend Service |
| loadgeneratorservice | Load Generator Service |
| opentelemetrycollectorservice | OpenTelemetry Collector Service |
| paymentservice | Payment Service |
| portalnow-template | PortalNOW Template Chart |
| productcatalogservice | Product Catalog Service |
| recommendationservice | Recommendation Service |
| redisservice | Redis Service |
| shippingservice | Shipping Service |

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repository as follows:

```bash
helm repo add platformnow https://platformnow.github.io/helm-charts
```

You can then run `helm search repo platformnow` to see the charts.

### Installing a Chart

To install a chart, use the following command:

```bash
helm install my-release platformnow/<chart-name>
```

For example:

```bash
helm install my-argo-cd platformnow/argo-cd
```

### Configuration

Each chart has its own values.yaml file with detailed configuration options. Please refer to the individual chart's README for specific configuration options.

## Contributing

The source code of all [PlatformNOW](https://platformnow.io) [Helm](https://helm.sh) charts can be found on Github: <https://github.com/platformnow/helm-charts/>

<!-- Keep full URL links to repo files because this README syncs from main to gh-pages.  -->
We'd love to have you contribute! Please refer to our [contribution guidelines](https://github.com/platformnow/helm-charts/blob/masyer/CONTRIBUTING.md) for details.

### Development

To develop on this repository:

1. Fork this repository
2. Make your changes
3. Run tests if available
4. Submit a pull request

## Versioning

The charts in this repository follow [Semantic Versioning](https://semver.org/). The version numbers are automatically updated by Renovate bot.

## Security

### Reporting Security Issues

If you discover a security issue, please bring it to our attention right away!

Please **DO NOT** file a public issue, instead send your report privately to security@platformnow.io.

## Support

If you have any questions about this repository or its contents, please:

1. Check the documentation
2. Open a [GitHub Issue](https://github.com/platformnow/helm-charts/issues)

## License

<!-- Keep full URL links to repo files because this README syncs from main to gh-pages.  -->
[Apache 2.0 License](https://github.com/platformnow/helm-charts/blob/main/LICENSE).
