{{/* vim: set filetype=mustache: */}}

{{/*
Add environment variables to configure spring datasource values
*/}}
{{- define "common.spring.configure.datasource" -}}
- name: SPRING_DATASOURCE_USERNAME
  value: {{ include "common.postgresql.database.user" . }}
- name: SPRING_DATASOURCE_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "common.postgresql.secretName" . }}
      key: {{ include "common.postgresql.database.existingsecret.key" . }}
- name: SPRING_DATASOURCE_URL
  value: jdbc:postgresql://{{ include "common.postgresql.database.host" . }}:{{ include "common.postgresql.database.port" . }}/{{ include "common.postgresql.database.name" . }}?sslmode=disable
{{- end -}}
