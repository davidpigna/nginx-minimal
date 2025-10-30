{{- define "nginx-helm.labels" -}}
app.kubernetes.io/name: {{ include "nginx-helm.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "nginx-helm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "nginx-helm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nginx-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
