{{/* vim: set filetype=mustache: */}}
{{- define "common.customer" -}}
{{- $defaultCustomerParams := .Values.defaultCustomer }}
{{- $customerParams := .Values.customer }}
{{- $customersParams := get .Values.customers $customerParams.name }}
{{- $customer := deepCopy $customerParams | mergeOverwrite $defaultCustomerParams $customersParams }}
{{- $customer | toYaml }}
{{- end -}}