# acapy

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: py36-1.16-1_0.7.1](https://img.shields.io/badge/AppVersion-py36--1.16--1_0.7.1-informational?style=flat-square)

A Helm chart for Hyperledger Aries Cloud Agent Python (ACA-Py)

**Homepage:** <https://github.com/hyperledger/aries-cloudagent-python>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Niclas Mietz | niclas.mietz@spherity.com | https://spherity.com |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| agent.db.useExistingSecret | string | `""` |  |
| agent.useExistingSecret | string | `""` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| config.adminURLApiKey | string | `""` |  |
| config.agentSeed | string | `""` |  |
| config.browserURL | string | `""` |  |
| config.jwtSecret | string | `""` |  |
| config.multitenant.admin.enabled | bool | `false` |  |
| config.multitenant.enabled | bool | `false` |  |
| config.postgres.account | string | `"postgres"` |  |
| config.postgres.admin.account | string | `"postgres"` |  |
| config.postgres.admin.password | string | `"secureAdminPassword"` |  |
| config.postgres.dbName | string | `"databaseName"` |  |
| config.postgres.enabled | bool | `true` |  |
| config.postgres.maxConnections | int | `5` |  |
| config.postgres.password | string | `"securePassword"` |  |
| config.postgres.url | string | `"databasehost"` |  |
| config.staticArgs.autoAcceptInvites | bool | `true` |  |
| config.staticArgs.autoAcceptRequests | bool | `true` |  |
| config.staticArgs.autoPingConnection | bool | `true` |  |
| config.staticArgs.autoProvision | bool | `true` |  |
| config.staticArgs.autoRespondCredentialOffer | bool | `true` |  |
| config.staticArgs.autoRespondCredentialProposal | bool | `true` |  |
| config.staticArgs.autoRespondCredentialRequest | bool | `true` |  |
| config.staticArgs.autoRespondMessages | bool | `true` |  |
| config.staticArgs.autoRespondPresentationProposal | bool | `true` |  |
| config.staticArgs.autoRespondPresentationRequest | bool | `true` |  |
| config.staticArgs.autoStoreCredential | bool | `true` |  |
| config.staticArgs.autoVerifyPresentation | bool | `true` |  |
| config.staticArgs.logLevel | string | `"info"` |  |
| config.staticArgs.monitorPing | bool | `true` |  |
| config.staticArgs.publicInvites | bool | `true` |  |
| config.tails.baseUrlOverride | string | `""` | Override the otherwise ledger-specifically generated base URL of the external tails server |
| config.tails.enabled | bool | `false` | Set to true to enable revocation (external tails server required) |
| config.tails.uploadUrlOverride | string | `""` | Override the otherwise ledger-specifically generated upload URL of the external tails server |
| config.walletKey | string | `""` |  |
| config.walletScheme | string | `"DatabasePerWallet"` |  |
| deploymentStrategy.rollingUpdate.maxSurge | string | `"50%"` |  |
| deploymentStrategy.rollingUpdate.maxUnavailable | int | `0` |  |
| deploymentStrategy.type | string | `"RollingUpdate"` |  |
| existingSecret | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"bcgovimages/aries-cloudagent"` |  |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.admin.annotations | object | `{}` |  |
| ingress.admin.className | string | `"nginx"` |  |
| ingress.admin.enabled | bool | `true` |  |
| ingress.admin.hosts[0].host | string | `"test-904f-api.acapy.spherity.com"` |  |
| ingress.admin.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.admin.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.admin.tls[0].hosts[0] | string | `"test-904f-api.acapy.spherity.com"` |  |
| ingress.admin.tls[0].secretName | string | `"acapy-tls-secret"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `"nginx"` |  |
| ingress.enabled | bool | `true` |  |
| ingress.hosts[0].host | string | `"test-904f.acapy.spherity.com"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls[0].hosts[0] | string | `"test-904f.acapy.spherity.com"` |  |
| ingress.tls[0].secretName | string | `"acapy-tls-secret"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources.limits.memory | string | `"512Mi"` |  |
| resources.requests.cpu | string | `"300m"` |  |
| resources.requests.memory | string | `"256Mi"` |  |
| securityContext | object | `{}` |  |
| service.admin.port | int | `8031` |  |
| service.port | int | `8030` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
