{{/*Helpers*/}}
{{/* vim: set filetype=mustache: */}}
{{/*
Return the proper image name
*/}}
{{- define "image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Return port
*/}}
{{- define "port" -}}
{{- if .Values.global.servicePort }}
    {{- .Values.global.servicePort -}}
{{- else -}}
    {{- .Values.service.port -}}
{{- end -}}
{{- end -}}

{{/*
Gets the host to be used for this application.
If not using ClusterIP, or if a host or LoadBalancerIP is not defined, the value will be empty.
*/}}
{{- define "baseUrl" -}}
{{- $app := include "common.names.name" . -}}
{{- $host := include "serviceIP" . -}}

{{- $port := "" -}}
{{- $servicePortString := printf "%v" .Values.service.port -}}
{{- if and (not (eq $servicePortString "80")) (not (eq $servicePortString "443")) -}}
  {{- $port = printf ":%s" $servicePortString -}}
{{- end -}}

{{- $defaultUrl := "" -}}
{{- if $host -}}
  {{- $defaultUrl = printf "%s-%s.%s.nip.io" $app .Release.Namespace $host -}}
{{- end -}}

{{- $url := "" -}}
{{- if .Values.baseUrl -}}
  {{- $url = printf "%s-%s.%s" $app ( regexReplaceAll ".*-" .Release.Namespace "" ) .Values.baseUrl -}}
{{- end -}}

{{- default $defaultUrl $url -}}
{{- end -}}

{{/*
Get the user defined LoadBalancerIP for this release.
Note, returns 127.0.0.1 if using ClusterIP.
*/}}
{{- define "serviceIP" -}}
{{- if eq .Values.service.type "ClusterIP" -}}
127.0.0.1
{{- else -}}
{{- .Values.service.loadBalancerIP | default "" -}}
{{- end -}}
{{- end -}}

{{/*
Get the configmap name
*/}}
{{- define "configMapName" -}}
{{- if .Values.existingConfigmap -}}
  {{- printf "%s" (tpl .Values.existingConfigmap $) -}}
{{- else -}}
  {{- printf "%s-configuration" (include "common.names.fullname" .) -}}
{{- end -}}
{{- end -}}



