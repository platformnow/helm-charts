{{/* vim: set filetype=mustache: */}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "common.postgresql.fullname" -}}
{{- if .Values.postgresql.fullnameOverride -}}
{{- .Values.postgresql.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.postgresql.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Get the Postgresql credentials secret.
*/}}
{{- define "common.postgresql.secretName" -}}
{{- if and (.Values.postgresql.enabled) (not .Values.postgresql.existingSecret) -}}
    {{- printf "%s" (include "common.postgresql.fullname" .) -}}
{{- else if and (.Values.postgresql.enabled) (.Values.postgresql.existingSecret) -}}
    {{- printf "%s" .Values.postgresql.existingSecret -}}
{{- else }}
    {{- if .Values.externalDatabase.existingSecret -}}
        {{- printf "%s" .Values.externalDatabase.existingSecret -}}
    {{- else -}}
        {{ printf "%s-%s" .Release.Name "externaldb" }}
    {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Add environment variables to configure database values
*/}}
{{- define "common.postgresql.database.host" -}}
{{- ternary (include "common.postgresql.fullname" .) .Values.externalDatabase.host .Values.postgresql.enabled -}}
{{- end -}}

{{/*
Add environment variables to configure database values
*/}}
{{- define "common.postgresql.database.user" -}}
{{- ternary .Values.postgresql.postgresqlUsername .Values.externalDatabase.user .Values.postgresql.enabled | quote -}}
{{- end -}}

{{/*
Add environment variables to configure database values
*/}}
{{- define "common.postgresql.database.name" -}}
{{- ternary .Values.postgresql.postgresqlDatabase .Values.externalDatabase.database .Values.postgresql.enabled -}}
{{- end -}}

{{/*
Add environment variables to configure database values
*/}}
{{- define "common.postgresql.database.name.unquote" -}}
{{- ternary .Values.postgresql.postgresqlDatabase .Values.externalDatabase.database .Values.postgresql.enabled -}}
{{- end -}}

{{/*
Add environment variables to configure database values
*/}}
{{- define "common.postgresql.database.existingsecret.key" -}}
{{- if and .Values.postgresql.enabled -}}
    {{- printf "%s" "postgresql-password" -}}
{{- else -}}
    {{- if .Values.externalDatabase.existingSecret -}}
        {{- if .Values.externalDatabase.existingSecretPasswordKey -}}
            {{- printf "%s" .Values.externalDatabase.existingSecretPasswordKey -}}
        {{- else -}}
            {{- printf "%s" "postgresql-password" -}}
        {{- end -}}
    {{- else -}}
        {{- printf "%s" "postgresql-password" -}}
    {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Add environment variables to configure database values
*/}}
{{- define "common.postgresql.database.port" -}}
{{- ternary "5432" .Values.externalDatabase.port .Values.postgresql.enabled -}}
{{- end -}}

{{/*
Add environment variables to configure database values
*/}}
{{- define "common.postgresql.configure.database" -}}
- name: DATABASE_NAME
  value: {{ include "common.postgresql.database.name" . | quote }}
- name: DATABASE_USERNAME
  value: {{ include "common.postgresql.database.user" . }}
- name: DATABASE_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "common.postgresql.secretName" . }}
      key: {{ include "common.postgresql.database.existingsecret.key" . }}
- name: DATABASE_HOST
  value: {{ include "common.postgresql.database.host" . }}
- name: DATABASE_PORT_NUMBER
  value: {{ include "common.postgresql.database.port" . | quote }}
{{- end -}}
