{{- define "devopclinics-lab.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{- define "devopclinics-lab.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "devopclinics-lab.selectorLabels" -}}
app: {{ .Chart.Name }}
{{- end }}

{{- define "devopclinics-lab.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "devopclinics-lab.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
"default"
{{- end -}}
{{- end }}

