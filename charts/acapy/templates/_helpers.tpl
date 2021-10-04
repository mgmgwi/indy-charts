{{/*
Expand the name of the chart.
*/}}
{{- define "acapy.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "acapy.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "acapy.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "acapy.labels" -}}
helm.sh/chart: {{ include "acapy.chart" . }}
{{ include "acapy.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "acapy.selectorLabels" -}}
app.kubernetes.io/name: {{ include "acapy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "acapy.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "acapy.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Get the password secret.
*/}}
{{- define "acapy.secretName" -}}
{{- if .Values.acapy.existingSecret -}}
    {{- printf "%s" (tpl .Values.acapy.existingSecret $) -}}
{{- else -}}
    {{- printf "%s" (include "acapy.fullname" .) -}}
{{- end -}}
{{- end -}}


{{/*
Return true if a secret object should be created
*/}}
{{- define "acapy.createSecret" -}}
{{- if not (include "acapy.useExistingSecret" .) -}}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Return seed
*/}}
{{- define "acapy.seed" -}}
{{- if .Values.config.agentSeed -}}
    {{- .Values.config.agentSeed -}}
{{- else -}}
    {{- randAlphaNum 32 -}}
{{- end -}}
{{- end -}}

{{/*
Return acapy initialization call
*/}}
{{- define "acapy.registerLedger" -}}
{{- if or (eq .Values.global.ledger "bosch-test") (eq .Values.global.ledger "bcovrin-test") -}}
curl -d '{\"seed\":\"$(WALLET_SEED)\", \"role\":\"TRUST_ANCHOR\", \"alias\":\"{{ include "bpa.fullname" . }}\"}' -X POST {{ include "bpa.ledgerBrowser" . }}/register;
{{- else if eq .Values.global.ledger "idu" -}}
identifier=`curl --header 'Content-Type: application/json' -d '{\"seed\":\"$(WALLET_SEED)\", \"role\":\"ENDORSER\", \"send\":true}' -X POST node-agent-registrar.md.svc.cluster.local/register | tr { '\n' | tr , '\n' | tr } '\n' | grep \"identifier\" | awk  -F'\"' '{print $4}'`;
{{- end -}}
{{- end -}}

{{/*
generate tails baseUrl
*/}}
{{- define "acapy.tails.baseUrl" -}}
{{- $tailsBaseUrl := dict "bosch-test" "https://tails-dev.vonx.io" "bcovrin-test" "https://tails-test.vonx.io" "idu" (printf "https://tails%s" .Values.global.ingressSuffix) -}}
{{ .Values.acapy.tails.baseUrlOverride| default ( get $tailsBaseUrl .Values.global.ledger ) }}
{{- end }}
{{/*
generate tails uploadUrl
*/}}
{{- define "acapy.tails.uploadUrl" -}}
{{- $tailsUploadUrl:= dict "bosch-test" "https://tails-dev.vonx.io" "bcovrin-test" "https://tails-test.vonx.io" "idu" "http://idu-tails:6543" -}}
{{ .Values.acapy.tails.uploadUrlOverride| default ( get $tailsUploadUrl .Values.global.ledger ) }}
{{- end }}


{{/*
generate hosts if not overriden
*/}}
{{- define "acapy.host" -}}
{{- if .Values.ingress.hosts -}}
{{- (index .Values.ingress.hosts 0).host -}}
{{- else }}
{{- include "acapy.fullname" . }}{{ .Values.global.ingressSuffix -}}
{{- end -}}
{{- end }}

{{/*
Return true if we should use an existingSecret.
*/}}
{{- define "acapy.useExistingSecret" -}}
{{- if .Values.existingSecret -}}
    {{- true -}}
{{- end -}}
{{- end -}}


