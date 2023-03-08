{{/*
Return PostgreSQL port
*/}}
{{- define "common.service.port" -}}
{{- if .Values.global.servicePort }}
    {{- .Values.global.servicePort -}}
{{- else -}}
    {{- .Values.service.port -}}
{{- end -}}
{{- end -}}