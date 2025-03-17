# argo-cd

![Version: 7.8.11-0](https://img.shields.io/badge/Version-7.8.11--0-informational?style=flat-square) ![AppVersion: v2.14.5](https://img.shields.io/badge/AppVersion-v2.14.5-informational?style=flat-square)

A Helm chart for Argo CD, a declarative, GitOps continuous delivery tool for Kubernetes.

**Homepage:** <https://github.com/argoproj/argo-helm>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| argoproj |  | <https://argoproj.github.io/> |
| mohammadsrahman | <mohammadsrahman@me.com> |  |

## Source Code

* <https://github.com/argoproj/argo-helm/tree/main/charts/argo-cd>
* <https://github.com/argoproj/argo-cd>

## Requirements

Kubernetes: `>=1.25.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://argoproj.github.io/argo-helm | argo-cd | 7.8.11 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| argo-cd.applicationSet.allowAnyNamespace | bool | `true` |  |
| argo-cd.configs.cm."accounts.api-access" | string | `"apiKey"` |  |
| argo-cd.configs.cm."admin.enabled" | bool | `true` |  |
| argo-cd.configs.cm."kustomize.buildOptions" | string | `"--enable-helm"` |  |
| argo-cd.configs.params."application.namespaces" | string | `"*"` |  |
| argo-cd.configs.params."applicationsetcontroller.allowed.scm.providers" | string | `"https://github.com/"` |  |
| argo-cd.configs.params."applicationsetcontroller.namespaces" | string | `"*"` |  |
| argo-cd.configs.params."server.insecure" | bool | `true` |  |
| secretProviderClass | object | `{"annotations":{},"enabled":false,"labels":{},"name":"secret-provider-class","namespace":"argo-cd","parameters":{},"provider":"aws","secretObjects":[]}` | Secret Provider Class |
| secretProviderClass.annotations | object | {} | Annotations for the Secret Provider Class |
| secretProviderClass.enabled | bool | false | Enable the Secret Provider Class |
| secretProviderClass.labels | object | {} | Labels for the Secret Provider Class |
| secretProviderClass.name | string | secret-provider-class | The name of the Secret Provider Class |
| secretProviderClass.namespace | string | argo-cd | The namespace of the Secret Provider Class |
| secretProviderClass.parameters | object | {}   | Parameters for the Secret Provider Class |
| secretProviderClass.provider | string | aws | The provider of the Secret Provider Class |
| secretProviderClass.secretObjects | list | []   | Secret Objects for the Secret Provider Class |

