{{/* vim: set filetype=mustache: */}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "common.neo4j.fullname" -}}
{{- if .Values.neo4j.fullnameOverride -}}
{{- .Values.neo4j.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.neo4j.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Get the neo4j credentials secret.
*/}}
{{- define "common.neo4j.secretName" -}}
{{- if and (.Values.neo4j.enabled) (not .Values.neo4j.existingSecret) -}}
    {{- printf "%s" "neo4j-secrets" -}}
{{- else if and (.Values.neo4j.enabled) (.Values.neo4j.existingSecret) -}}
    {{- printf "%s" .Values.neo4j.existingSecret -}}
{{- else }}
    {{- if .Values.externalNeo4jDatabase.existingSecret -}}
        {{- printf "%s" .Values.externalNeo4jDatabase.existingSecret -}}
    {{- else -}}
        {{ printf "%s-%s" .Release.Name "externalNeo4j" }}
    {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Add environment variables to configure database values
*/}}
{{- define "common.neo4j.database.host" -}}
{{- ternary (include "common.neo4j.fullname" .) .Values.externalNeo4jDatabase.host .Values.neo4j.enabled -}}
{{- end -}}


{{/*
Add environment variables to configure database values
*/}}
{{- define "common.neo4j.database.user" -}}
    {{- printf "neo4j" -}}
{{- end -}}

{{/*
Add environment variables to configure database values
*/}}
{{- define "common.neo4j.database.port" -}}
{{- ternary "7687" .Values.externalNeo4jDatabase.port .Values.neo4j.enabled -}}
{{- end -}}

{{/*
Constrcut the URL to NEO4J
*/}}

{{- define "common.neo4j.database.url" -}}
{{- if .Values.neo4j.enabled -}}
    {{- printf "bolt://neo4j:%s" (include "common.neo4j.database.port" . ) -}}
{{- else -}}
    {{- printf "%s://%s:%s" .Values.externalNeo4jDatabase.protocol .Values.externalNeo4jDatabase.host (include "common.neo4j.database.port" . ) -}}
{{- end -}}
{{- end -}}


{{/*
Add environment variables to configure database values
*/}}
{{- define "common.neo4j.database.existingsecret.key" -}}
{{- if and .Values.neo4j.enabled -}}
    {{- printf "%s" "neo4j-password" -}}
{{- else -}}
    {{- if .Values.externalNeo4jDatabase.existingSecret -}}
        {{- if .Values.externalNeo4jDatabase.existingSecretPasswordKey -}}
            {{- printf "%s" .Values.externalNeo4jDatabase.existingSecretPasswordKey -}}
        {{- else -}}
            {{- printf "%s" "neo4j-password" -}}
        {{- end -}}
    {{- else -}}
        {{- printf "%s" "neo4j-password" -}}
    {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Add environment variables to configure database values
*/}}
{{- define "common.neo4j.configure.database" -}}
- name: SPRING_NEO4J_URI
  value: {{ include "common.neo4j.database.url" . }}
- name: SPRING_NEO4J_USERNAME
  value: {{ include "common.neo4j.database.user" . }}
- name: SPRING_NEO4J_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "common.neo4j.secretName" . }}
      key: {{ include "common.neo4j.database.existingsecret.key" . }}
{{- end -}}
