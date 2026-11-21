{{- define "wedding-invitation.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "wedding-invitation.fullname" -}}
{{- printf "%s" (include "wedding-invitation.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "wedding-invitation.labels" -}}
app.kubernetes.io/name: {{ include "wedding-invitation.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "wedding-invitation.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wedding-invitation.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}