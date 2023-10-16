{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "chart" -}}
{{- printf "%s-%s" .context.Chart.Name .context.Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "labels.selector" -}}
app.kubernetes.io/name: {{ include "name" . | quote }}
app.kubernetes.io/instance: {{ .context.Release.Name | quote }}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "common.labels.standard" -}}
application.kubernetes.io/managed-by: {{ .context.Release.Service | quote }}
application.kubernetes.io/version: {{ .context.Chart.AppVersion | quote }}
application.giantswarm.io/team: {{ index .context.Chart.Annotations "application.giantswarm.io/team" | default "atlas" | quote }}
giantswarm.io/managed-by: {{ .context.Release.Name | quote }}
helm.sh/chart: {{ include "chart" . | quote }}
{{- end -}}

