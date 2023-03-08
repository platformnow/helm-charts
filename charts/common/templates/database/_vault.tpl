{{/* vim: set filetype=mustache: */}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "common.vault.fullname" -}}
{{- if .Values.vault.fullnameOverride -}}
{{- .Values.vault.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.vault.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{/*
Add environment variables to configure database values
*/}}
{{- define "common.vault.host" -}}
{{- ternary (include "common.vault.fullname" .) .Values.externalVault.host .Values.vault.enabled -}}
{{- end -}}


{{/*
Add environment variables to configure database values
*/}}
{{- define "common.vault.port" -}}
{{- ternary "8200" .Values.externalVault.port .Values.vault.enabled -}}
{{- end -}}


{{/*
Add environment variables to configure database values
*/}}
{{- define "common.vault.address" -}}
{{- printf "http://%s:%s" (include "common.vault.host" . ) (include "common.vault.port" . ) -}}
{{- end -}}


{{/*
Add environment variables to configure database values
*/}}
{{- define "common.vault.configure" -}}
- name: APPLICATION_VAULT_ADDRESS
  value: {{ include "common.vault.address" . | quote }}
{{- end -}}