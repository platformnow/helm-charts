# Common Library Chart

A [Helm Library Chart](https://helm.sh/docs/topics/library_charts/#helm) for grouping common logic between charts.

```yaml
dependencies:
-   name: common
    version: 0.x.x
    repository: https://platformnow.github.io/helm-charts
```

```bash
helm dependency update
```

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
    name: {{ include "common.names.fullname" . }}
data:
    myvalue: "Hello World"
```

## Introduction

This chart provides a common template helpers which can be used to develop new charts using [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 2.12+ or Helm 3.0-beta3+

## Parameters

The following table lists the helpers available in the library which are scoped in different sections.

### Affinities

| Helper identifier                                | Description                                                                                                                                                            | Expected Input                                                                                                                                                                                                                           |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `common.affinities.node.soft`                    | Return a soft nodeAffinity definition                                                                                                                                  | `dict "key" "FOO" "values" (list "BAR" "BAZ")`                                                                                                                                                                                           |
| `common.affinities.node.hard`                    | Return a hard nodeAffinity definition                                                                                                                                  | `dict "key" "FOO" "values" (list "BAR" "BAZ")`                                                                                                                                                                                           |
| `common.affinities.pod.soft`                     | Return a soft podAffinity/podAntiAffinity definition                                                                                                                   | `dict "component" "FOO" "context" $`                                                                                                                                                                                                     |
| `common.affinities.pod.hard`                     | Return a hard podAffinity/podAntiAffinity definition                                                                                                                   | `dict "component" "FOO" "context" $`                                                                                                                                                                                                     |

### Capabilities

| Helper identifier                                | Description                                                                                                                                                            | Expected Input                                                                                                                                                                                                                           |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `common.capabilities.deployment.apiVersion`      | Return the appropriate apiVersion for deployment.                                                                                                                      | `.` Chart context                                                                                                                                                                                                                        |
| `common.capabilities.statefulset.apiVersion`     | Return the appropriate apiVersion for statefulset.                                                                                                                     | `.` Chart context                                                                                                                                                                                                                        |
| `common.capabilities.ingress.apiVersion`         | Return the appropriate apiVersion for ingress.                                                                                                                         | `.` Chart context                                                                                                                                                                                                                        |

### Images

| Helper identifier                                | Description                                                                                                                                                            | Expected Input                                                                                                                                                                                                                           |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `common.images.image`                            | Return the proper and full image name                                                                                                                                  | `dict "imageRoot" .Values.path.to.the.image "global" $`, see [ImageRoot](#imageroot) for the structure.                                                                                                                                  |
| `common.images.pullSecrets`                      | Return the proper Docker Image Registry Secret Names                                                                                                                   | `dict "images" (list .Values.path.to.the.image1, .Values.path.to.the.image2) "global" .Values.global`                                                                                                                                    |

### Istio

| Helper identifier                                | Description                                                                                                                                                            | Expected Input                                                                                                                                                                                                                           |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `common.istio.vs.http`                           | Return http endpoints for istio virtual service                                                                                                                        | TODO                                                                                                                         |

### Labels

| Helper identifier                                | Description                                                                                                                                                            | Expected Input                                                                                                                                                                                                                           |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `common.labels.standard`                         | Return Kubernetes standard labels                                                                                                                                      | `.` Chart context                                                                                                                                                                                                                        |
| `common.labels.matchLabels`                      | Return the proper Docker Image Registry Secret Names                                                                                                                   | `.` Chart context                                                                                                                                                                                                                        |

### Names

| Helper identifier                                | Description                                                                                                                                                            | Expected Inpput                                                                                                                                                                                                                          |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `common.names.name`                              | Expand the name of the chart or use `.Values.nameOverride`                                                                                                             | `.` Chart context                                                                                                                                                                                                                        |
| `common.names.fullname`                          | Create a default fully qualified app name.                                                                                                                             | `.` Chart context                                                                                                                                                                                                                        |
| `common.names.chart`                             | Chart name plus version                                                                                                                                                | `.` Chart context                                                                                                                                                                                                                        |

### Secrets

| Helper identifier                                | Description                                                                                                                                                            | Expected Input                                                                                                                                                                                                                           |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `common.secrets.name`                            | Generate the name of the secret.                                                                                                                                       | `dict "existingSecret" .Values.path.to.the.existingSecret "defaultNameSuffix" "mySuffix" "context" $` see [ExistingSecret](#existingsecret) for the structure.                                                                           |
| `common.secrets.key`                             | Generate secret key.                                                                                                                                                   | `dict "existingSecret" .Values.path.to.the.existingSecret "key" "keyName"` see [ExistingSecret](#existingsecret) for the structure.                                                                                                      |

### Storage

| Helper identifier                                | Description                                                                                                                                                            | Expected Input                                                                                                                                                                                                                           |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `common.affinities.node.soft`                    | Return a soft nodeAffinity definition                                                                                                                                  | `dict "persistence" .Values.path.to.the.persistence "global" $`, see [Persistence](#persistence) for the structure.                                                                                                                      |

### TplValues

| Helper identifier                                | Description                                                                                                                                                            | Expected Input                                                                                                                                                                                                                           |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `common.tplvalues.render`                        | Renders a value that contains template                                                                                                                                 | `dict "value" .Values.path.to.the.Value "context" $`, value is the value should rendered as template, context frecuently is the chart context `$` or `.`                                                                                 |

### Utils

| Helper identifier                                | Description                                                                                                                                                            | Expected Input                                                                                                                                                                                                                           |
|--------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `common.utils.fieldToEnvVar`                     | Build environment variable name given a field.                                                                                                                         | `dict "field" "my-password"`                                                                                                                                                                                                             |
| `common.utils.secret.getvalue`                   | Print instructions to get a secret value.                                                                                                                              | `dict "secret" "secret-name" "field" "secret-value-field" "context" $`                                                                                                                                                                   |
| `common.utils.getValueFromKey`                   | Gets a value from `.Values` object given its key path                                                                                                                  | `dict "key" "path.to.key" "context" $`                                                                                                                                                                                                   |

### ImageRoot

```yaml
registry:
    type: string
    description: Docker registry where the image is located
    example: docker.io

repository:
    type: string
    description: Repository and image name
    example: bitnami/nginx

tag:
    type: string
    description: image tag
    example: 1.16.1-debian-10-r63

pullPolicy:
    type: string
    description: Specify a imagePullPolicy. Defaults to 'Always' if image tag is 'latest', else set to 'IfNotPresent'

pullSecrets:
    type: array
    items:
        type: string
    description: Optionally specify an array of imagePullSecrets.

debug:
    type: boolean
    description: Set to true if you would like to see extra information on logs
    example: false

## An instance would be:
# registry: docker.io
# repository: bitnami/nginx
# tag: 1.16.1-debian-10-r63
# pullPolicy: IfNotPresent
# debug: false
```

### Persistence

```yaml
enabled:
    type: boolean
    description: Whether enable persistence.
    example: true

storageClass:
    type: string
    description: Ghost data Persistent Volume Storage Class, If set to "-", storageClassName: "" which disables dynamic provisioning.
    example: "-"

accessMode:
    type: string
    description: Access mode for the Persistent Volume Storage.
    example: ReadWriteOnce

size:
    type: string
    description: Size the Persistent Volume Storage.
    example: 8Gi

path:
    type: string
    description: Path to be persisted.
    example: /bitnami

## An instance would be:
# enabled: true
# storageClass: "-"
# accessMode: ReadWriteOnce
# size: 8Gi
# path: /bitnami
```

### ExistingSecret

```yaml
name:
    type: string
    description: Name of the existing secret.
    example: mySecret
keyMapping:
    description: Mapping between the expected key name and the name of the key in the existing secret.
    type: object

## An instance would be:
# name: mySecret
# keyMapping:
#   password: myPasswordKey
```

#### Example of use

When we store sensitive data for a deployment in a secret, some times we want to give to users the possiblity of using theirs existing secrets.

```yaml
# templates/secret.yaml
---
apiVersion: v1
kind: Secret
metadata:
    name: {{ include "common.names.fullname" . }}
    labels:
        app: {{ include "common.names.fullname" . }}
type: Opaque
data:
    password: {{ .Values.password | b64enc | quote }}

# templates/dpl.yaml
---
...
env:
-   name: PASSWORD
    valueFrom:
        secretKeyRef:
            name: {{ include "common.secrets.name" (dict "existingSecret" .Values.existingSecret "context" $) }}
            key: {{ include "common.secrets.key" (dict "existingSecret" .Values.existingSecret "key" "password") }}
...

# values.yaml
---
name: mySecret
keyMapping:
    password: myPasswordKey
```
