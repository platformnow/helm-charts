# PortalNOW Template
Omega Helm Chart for Kubernetes is a re-usable chart for your apps.

## Introduction

This chart bootstraps a deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.12+
- Helm 3.8.0

## Installing the Chart

To install the chart with the release name `myapp`:

```console
$ helm repo add lenderos https://nexus.lenderos.com/repository/helm-hosted/
$ helm install oms lenderos/oms
```

## Local Builds and Install

If you already have the chart locally in a directory as **oms**

The following command will install a default configuration into the default namespace.

```console
$ helm install oms ./oms
```

## Uninstalling the Chart

To uninstall/delete the `oms` deployment:

```console
$ helm delete oms
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the OMS chart and their default values.

### Global Parameters

| Name                      | Description                                     | Default |
|---------------------------|-------------------------------------------------|---------|
| `global.imageRegistry`    | Global Docker image registry                    | `""`    |
| `global.imagePullSecrets` | Global Docker registry secret names as an array | `[]`    |
| `global.storageClass`     | Global StorageClass for Persistent Volume(s)    | `""`    |

### Common Parameters

| Name                     | Description                                                                                  | Default         |
|--------------------------|----------------------------------------------------------------------------------------------|-----------------|
| `kubeVersion`            | Override Kubernetes version                                                                  | `""`            |
| `nameOverride`           | String to partially override common.names.fullname template (will maintain the release name) | `""`            |
| `fullnameOverride`       | String to fully override common.names.fullname template                                      | `""`            |
| `clusterDomain`          | Kubernetes Cluster Domain                                                                    | `cluster.local` |
| `extraDeploy`            | Extra objects to deploy (evaluated as a template)                                            | `[]`            |
| `commonLabels`           | Add labels to all the deployed resources                                                     | `{}`            |
| `matchLabels`            | Labels to Match Label Selectors                                                              | `{}`            |
| `matchExpressions`       | Expressions to Match Label Selectors                                                         | `[]`            |
| `commonAnnotations`      | Add annotations to all the deployed resources                                                | `{}`            |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden)      | `false`         |
| `diagnosticMode.command` | Command to override all containers in the the deployment(s)/statefulset(s)                   | `["sleep"]`     |
| `diagnosticMode.args`    | Args to override all containers in the the deployment(s)/statefulset(s)                      | `["infinity"]`  |

### Parameters
| Name                                    | Description                                                                                                              | Default           |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------|-------------------|
| `image.registry`                        | Image registry (nex/docker/gitlab)                                                                                       | `""`              |
| `image.repository`                      | Image repository                                                                                                         | `oms`             |
| `image.tag`                             | Image tag (immutable tags are recommended)                                                                               | `latest`          |
| `image.pullPolicy`                      | Image pull policy                                                                                                        | `IfNotPresent`    |
| `image.pullSecrets`                     | Image pull secrets                                                                                                       | `[]`              |
| `enableServiceLinks`                    | Enable if information about services should be injected into pod's environment variables                                 | `true`            |
| `containerSecurityContext.enabled`      | Enabled containers' Security Context                                                                                     | `false`           |
| `containerSecurityContext.runAsUser`    | Set containers' Security Context runAsUser                                                                               | `1001`            |
| `containerSecurityContext.runAsNonRoot` | Set containers' Security Context runAsNonRoot                                                                            | `true`            |
| `lifecycleHooks`                        | Automate configuration before or after startup                                                                           | `{}`              |
| `command`                               | Override default container command (useful when using custom images)                                                     | `[]`              |
| `args`                                  | Override default container args (useful when using custom images)                                                        | `[]`              |
| `envFrom`                               | Load all environment variables from a configmap (useful when using configmap with alot of env var)                       | `[]`              |
| `podDisruptionBudget.enabled`           | Enable PodDisruptionBudget for pod                                                                                       | `false`           |
| `podDisruptionBudget.minAvailable`      | Maximum number/percentage of unavailable replicas                                                                        | `1`               |
| `podDisruptionBudget.maxUnavailable`    | Maximum number/percentage of unavailable replicas                                                                        | `3`               |
| `hostAliases`                           | Pods host aliases                                                                                                        | `[]`              |
| `terminationGracePeriodSeconds`         | Restart policy for all containers within the pod                                                                         | `""`              |
| `restartPolicy`                         | Seconds pod needs to terminate gracefully                                                                                | `""`              |
| `activeDeadlineSeconds`                 | Optional duration in seconds the pod may be active on the node relative to StartTime                                     | `"150"`           |
| `priorityClassName`                     | Priority Class Name                                                                                                      | `""`              |
| `schedulerName`                         | Use an alternate scheduler, e.g. "stork".                                                                                | `""`              |
| `podSecurityContext.enabled`            | Enabled pods' Security Context                                                                                           | `false`           |
| `podSecurityContext.fsGroup`            | Set pod's Security Context fsGroup                                                                                       | `1001`            |
| `nodeAffinityPreset.key`                | Node label key to match.                                                                                                 | `""`              |
| `nodeAffinityPreset.type`               | Node affinity preset type. Allowed values: `soft` or `hard`                                                              | `""`              |
| `nodeAffinityPreset.values`             | Node label values to match.                                                                                              | `[]`              |
| `affinity`                              | Affinity for Airflow worker pods assignment (evaluated as a template)                                                    | `{}`              |
| `podAffinityPreset`                     | Pod affinity preset. Allowed values: `soft` or `hard`.                                                                   | `""`              |
| `podAntiAffinityPreset`                 | Pod anti-affinity preset. Allowed values: `soft` or `hard`.                                                              | `""`              |
| `nodeSelector`                          | Node labels for Pods assignment                                                                                          | `{}`              |
| `tolerations`                           | Toleration's for Pods assignment                                                                                         | `[]`              |
| `topologySpreadConstraints`             | Topology Spread Constraints for pod assignment spread across your cluster among failure-domains. Evaluated as a template | `{}`              |
| `podLabels`                             | Add extra labels to the Pod                                                                                              | `{}`              |
| `podAnnotations`                        | Add extra annotations to the Pod                                                                                         | `"5720,5721"`     |
| `configuration`                         | Specify content for a config file                                                                                        | `""`              |
| `existingConfigmap`                     | Name of an existing ConfigMap to be attached to Containers                                                               | ``                |
| `extraConfigMaps`                       | A Map of ConfigMaps to be attached to Containers                                                                         | `{}`              |
| `updateStrategy.type`                   | Deployment strategy type                                                                                                 | `"RollingUpdate"` |
| `updateStrategy.rollingUpdate`          | Deployment rolling update configuration parameters                                                                       | `1`               |
| `replicaCount`                          | Number of replicas                                                                                                       | `1`               |
| `minReadySeconds`                       | Minimum number of seconds for which a newly created pod should be ready                                                  | `""`              |
| `revisionHistoryLimit`                  | The number of old ReplicaSets to retain to allow rollback.                                                               | `""`              |
| `progressDeadlineSeconds`               | The maximum time in seconds for a deployment to make progress before it is considered to be failed.                      | `""`              |
| `paused`                                | Indicates that the deployment is paused                                                                                  | `""`              |
| `initContainers`                        | Add additional init containers to the Pod                                                                                | ``                |
| `extraVolumeMounts`                     | Optionally specify extra list of additional volumeMounts for the Pod. Set persistence.enabled to false to not use default mounts | `{}`              |
| `extraVolumes`                          | Optionally specify extra list of additional volumes for the Pod                                                          | `[]`              |
| `extraEnvVars`                          | Array with extra environment variables to add to the Pod                                                                 | `[]`              |
| `containerPort`                         | HTTP container port                                                                                                      | `8080`            |
| `extraContainerPorts`                   | Extra container ports  (i.e for Embedded Hazelcast)                                                                      | `[]`              |
| `startupProbe.enabled`                  | Enable startupProbe on the container                                                                                     | `false`           |
| `startupProbe.initialDelaySeconds`      | Initial delay seconds for startupProbe                                                                                   | `60`              |
| `startupProbe.periodSeconds`            | Period seconds for startupProbe                                                                                          | `10`              |
| `startupProbe.timeoutSeconds`           | Timeout seconds for startupProbe                                                                                         | `1`               |
| `startupProbe.failureThreshold`         | Failure threshold for startupProbe                                                                                       | `15`              |
| `startupProbe.successThreshold`         | Success threshold for startupProbe                                                                                       | `1`               |
| `livenessProbe.initialDelaySeconds`     | Initial delay seconds for livenessProbe                                                                                  | `120`             |
| `livenessProbe.periodSeconds`           | Period seconds for livenessProbe                                                                                         | `10`              |
| `livenessProbe.timeoutSeconds`          | Timeout seconds for livenessProbe                                                                                        | `10`              |
| `livenessProbe.failureThreshold`        | Failure threshold for livenessProbe                                                                                      | `10`              |
| `livenessProbe.successThreshold`        | Success threshold for livenessProbe                                                                                      | `1`               |
| `livenessProbe.enabled`                 | Enable Liveness Probe on the applications container                                                                      | `true`            |
| `livenessProbe.path`                    | Endpoint Path for the Liveness Probe                                                                                     | `"/"`             |
| `readinessProbe.initialDelaySeconds`    | Initial delay seconds for readinessProbe                                                                                 | `5`               |
| `readinessProbe.periodSeconds`          | Period seconds for readinessProbe                                                                                        | `30`              |
| `readinessProbe.timeoutSeconds`         | Timeout seconds for readinessProbe                                                                                       | `5`               |
| `readinessProbe.failureThreshold`       | Failure threshold for readinessProbe                                                                                     | `6`               |
| `readinessProbe.successThreshold`       | Success threshold for readinessProbe                                                                                     | `1`               |
| `readinessProbe.enabled`                | Enable readinessProbe on the applications container                                                                      | `true`            |
| `readinessProbe.path`                   | Endpoint Path for the Readiness Probe                                                                                    | `"/"`             |
| `customStartupProbe`                    | Custom startupProbe that overrides the default one                                                                       | `{}`              |
| `customLivenessProbe`                   | Custom livenessProbe that overrides the default one                                                                      | `{}`              |
| `customReadinessProbe`                  | Custom readinessProbe that overrides the default one                                                                     | `{}`              |
| `sidecars`                              | Add additional sidecar containers to the Pod                                                                             | `[]`              |
| `resources.limits`                      | The resources limits for the container                                                                                   | `{}`              |
| `resources.requests`                    | The requested resources for the container                                                                                | `{}`              |                                         

### Auto Scalers Parameters

| Name                                         | Description                                                                      | Default  |
|----------------------------------------------|----------------------------------------------------------------------------------|----------|
| `autoscaling.enabled`                        | Whether to enable the horizontal pod autoscaler                                  | `false`  |
| `autoscaling.replicas.min`                   | Configure a minimum amount of pods                                               | `1`      |
| `autoscaling.replicas.max`                   | Configure a maximum amount of pods                                               | `3`      |
| `autoscaling.targets.cpu`                    | Define the CPU target to trigger the scaling actions (utilization percentage)    | `80`     |
| `autoscaling.targets.memory`                 | Define the memory target to trigger the scaling actions (utilization percentage) | `80`     |
| `verticalAutoscaling.enabled`                | Whether to enable the vertical pod autoscaler                                    | `false`  |
| `verticalAutoscaling.updateMode`             | The for the VPA, possible values are "Off", "Initial", "Recreate", and "Auto".   | `"Off"`  |

### Traffic Exposure Parameters

| Name                                           | Description                                                                                                                      | Default                                                                                    |
|------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| `ingress.enabled`                              | Enable ingress record generation                                                                                                 | `false`                                                                                    |
| `ingress.apiVersion`                           | Force Ingress API version (automatically detected if not set)                                                                    | `""`                                                                                       |
| `ingress.pathType`                             | Ingress path type                                                                                                                | `"ImplementationSpecific"`                                                                 |
| `ingress.certManager`                          | Enable Ingress with CertManager                                                                                                  | `false`                                                                                    |
| `ingress.annotations`                          | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. | `{}`                                                                                       |
| `ingress.hosts`                                | An array with hostname(s) to be covered with the ingress record                                                                  | `[{"name": "local", "path": "/", "tls": false, "tlsHosts": [], "tlsSecret": "local-tls"}]` |
| `ingress.secrets`                              | Custom TLS certificates as secrets                                                                                               | `[]`                                                                                       |
| `service.type`                                 | Service type                                                                                                                     | `"ClusterIP"`                                                                              |
| `service.port`                                 | Service HTTP port                                                                                                                | `80`                                                                                       |
| `service.sessionAffinity`                      | Control where client requests go, to the same pod or round-robin                                                                 | `"None"`                                                                                   |
| `service.clusterIP`                            | Service Cluster IP                                                                                                               | `""`                                                                                       |
| `service.nodePort`                             | Node port for HTTP                                                                                                               | `""`                                                                                       |
| `service.loadBalancerIP`                       | Service Load Balancer IP                                                                                                         | `""`                                                                                       |
| `service.loadBalancerSourceRanges`             | Service Load Balancer sources                                                                                                    | `[]`                                                                                       |
| `service.externalTrafficPolicy`                | Service external traffic policy                                                                                                  | `"Cluster"`                                                                                |
| `service.annotations`                          | Additional custom annotations for the applications service                                                                       | `{}`                                                                                       |
| `service.extraPorts`                           | Extra ports to expose on the applications service                                                                                | `[{"name": "https", "port": 443, "targetPort": "https"}]`                                  |

### RBAC Parameters

| Name                                  | Description                                                | Default  |
|---------------------------------------|------------------------------------------------------------|----------|
| `serviceAccount.create`               | Enable creation of ServiceAccount for the Pod              | `true`   |
| `serviceAccount.name`                 | The name of the ServiceAccount to use.                     | `""`     |
| `serviceAccount.annotations`          | Additional custom annotations for the ServiceAccount       | `{}`     |
| `rbac.create`                         | Create Role and RoleBinding                                | `false`  |
| `rbac.rules`                          | Custom RBAC rules to set                                   | `[]`     |

### Persistence Parameters

| Name                                          | Description                              | Default             |
|-----------------------------------------------|------------------------------------------|---------------------|
| `persistence.enabled`                         | Enable Persistence Storage for the Pod   | `false`             |
| `persistence.mountPath`                       | The Path to Mount the volume to          | `"/data"`           |
| `persistence.subPath`                         | The SubPath to Mount the volume to       | `""`                |
| `persistence.storageClass`                    | StorageClass for the Persistent Volume   | `"-"`               |
| `persistence.accessModes`                     | The Access Mode for the Volume           | `["ReadWriteOnce"]` |
| `persistence.size`                            | The Size of the Persistent Volume        | `"8Gi"`             |
| `persistence.annotations`                     | Additional Annotations to add the the PV | `{}`                |


### Metrics parameters

| Name                                   | Description                                          | Default                    |
|----------------------------------------|------------------------------------------------------|----------------------------|
| `metrics.serviceMonitor.enabled`       | Enable a Prometheus Service Monitor                  | `false`                    |
| `metrics.serviceMonitor.namespace`     | Namespace for the Service Monitor                    | `""`                       |
| `metrics.serviceMonitor.interval`      | Interval for the Service Monitor                     | `"10s"`                    |
| `metrics.serviceMonitor.scrapeTimeout` | Scrape Timeout for the Service Monitor               | `"10s"`                    |
| `metrics.serviceMonitor.labels`        | Prometheus Operator Labels                           | `"prometheus: monitoring"` |
| `metrics.serviceMonitor.path`          | Path where Prometheus Metrics are exposed on the Pod | `"/"`                      |
| `metrics.serviceMonitor.port`          | Port on the Pod where Prometheus Metrics are exposed | `"http"`                   |
| `metrics.serviceMonitor.honorLabels`   | Whether to Honour Labels                             | `true`                     |
| `metrics.extraServiceMonitors `        | A Map of extra Service Monitors to Expose            | `{}`                       |

### Istio parameters

| Name                            | Description                                          | Default                   |
|---------------------------------|------------------------------------------------------|---------------------------|
| `istio.enabled`                 | Whether Istio is Enabled                             | `true`                    |
| `istio.gateway.enabled`         | Whether to Add an Istio Gateway                      | `true`                    |
| `istio.gateway.externalGayeway` | Name of a Gateway Not created by this chart          | `""`                      |
| `istio.gateway.labels.istio`    | Labels to add the Gateway                            | `"istio: ingressgateway"` |
| `istio.virtualService`          | Map of routes to add the applications VirtualService | `{}`                      |
| `istio.extraVirtualServices`    | Map of extra Virtual Service to Create               | `{}`                      |
| `istio.destinationRule`         | Map of Destination rules to create                   | `{}`                      |
| `istio.serviceEntrys`           | Map of Service Entries to create                     | `{}`                      |


_Documentation generated by [Frigate](https://frigate.readthedocs.io)._
