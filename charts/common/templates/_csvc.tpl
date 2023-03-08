{{/* vim: set filetype=mustache: */}}

{{/*todo*/}}

{{/*
A parent configuration to add enviropnment variables depending on enabled services
*/}}
{{- define "common.csvc.configure" -}}
{{- if or .Values.postgresql.enabled .Values.externalDatabase.use -}}
{{- printf "%s" (include "common.postgresql.configure.database" .) -}}
{{- end -}}
{{- if or .Values.neo4j.enabled .Values.externalNeo4jDatabase.use -}}
{{- printf "%s" (include "common.neo4j.configure.database" .) -}}
{{- end -}}
{{- if or .Values.vault.enabled .Values.externalVault.use -}}
{{- printf "%s" (include "common.vault.configure" .) -}}
{{- end -}}
{{- end -}}