{{/* vim: set filetype=mustache: */}}
{{/*
Return the appropriate apiVersion for deployment.
*/}}
{{- define "common.istio.vs.http" -}}
http:
  - preference:
      matchExpressions:
        key: {{ .key }}
        operator: In
        values:
          {{- range .values }}
          - {{ . }}
          {{- end }}
    weight: 1
{{- end -}}

