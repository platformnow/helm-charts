# PlatformNOW Helm Charts

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/platformnow/helm-charts/blob/main/LICENSE)
[![Release Charts](https://github.com/platformnow/helm-charts/actions/workflows/release.yaml/badge.svg)](https://github.com/platformnow/helm-charts/actions/workflows/release.yaml)
[![Downloads](https://img.shields.io/github/downloads/platformnow/helm-charts/total.svg)](https://github.com/platformnow/helm-charts/releases)

## Introduction

This repository contains [Helm](https://helm.sh) charts for various projects used by PlatformNOW. The charts are available in the [PlatformNOW Helm Charts Repository](https://platformnow.github.io/helm-charts).

## Available Charts

### Parent Charts (with dependencies)

These charts serve as parent charts that include specific dependencies:

| Chart | Description |
|-------|-------------|
| argo-cd | Declarative GitOps CD for Kubernetes |
| aws-ebs-csi-driver | AWS EBS CSI driver |
| aws-load-balancer-controller | AWS Load Balancer Controller |
| cert-manager | Certificate management controller |
| cluster-autoscaler | Kubernetes cluster autoscaler |
| crossplane | Cloud native control plane framework |
| external-dns | External DNS controller |
| external-secrets | External Secrets operator |
| istio-base | Istio base components |
| istio-ingress | Istio ingress gateway |
| istiod | Istio control plane |
| localstack | LocalStack - A fully functional local AWS cloud stack |
| metrics-server | Kubernetes metrics server |
| opentelemetry-operator | OpenTelemetry Operator |

### Standalone Charts

These are individual service charts:

| Chart | Description |
|-------|-------------|
| adservice | Advertisement Service |
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

### Using OCI Registry

Our charts are also available as OCI artifacts. You can pull them directly from our GitHub Container Registry:

```bash
# Pull a specific chart version
helm pull oci://ghcr.io/platformnow/charts/<chart-name> --version <version>

# Example
helm pull oci://ghcr.io/platformnow/charts/aws-ebs-csi-driver --version 2.41.0-0
```

You can also install directly from the OCI registry:

```bash
helm install my-release oci://ghcr.io/platformnow/charts/<chart-name> --version <version>
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

Please **DO NOT** file a public issue, instead send your report privately to [security@platformnow.io](security@platformnow.io).

## Support

If you have any questions about this repository or its contents, please:

1. Check the documentation
2. Open a [GitHub Issue](https://github.com/platformnow/helm-charts/issues)

## License

<!-- Keep full URL links to repo files because this README syncs from main to gh-pages.  -->
[Apache 2.0 License](https://github.com/platformnow/helm-charts/blob/main/LICENSE).
