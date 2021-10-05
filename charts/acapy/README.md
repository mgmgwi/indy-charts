# acapy

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: py36-1.16-1_0.7.1](https://img.shields.io/badge/AppVersion-py36--1.16--1_0.7.1-informational?style=flat-square)

A Helm chart for Hyperledger Aries Cloud Agent Python (ACA-Py)

**Homepage:** <https://spherity.com>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Niclas Mietz | niclas.mietz@spherity.com | https://spherity.com |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| agent.db.useExistingSecret | string | `""` | provides an external kubernetes secret with the database connection information |
| agent.useExistingSecret | string | `""` | provides an external kubernetes secret with the agent secrets |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| config.adminURLApiKey | string | `""` | Set an API Key for the Admin API Authentication |
| config.agentSeed | string | `""` | Initial Seed DID for Agent should be an Endorser |
| config.browserURL | string | `""` | For fetching the genesis file for connecting to the nodes |
| config.jwtSecret | string | `""` | seed for the JWT Authentication in Mutltitenant Mode |
| config.multitenant.admin.enabled | bool | `false` | enables in Admin API for Acapy Multitenant mode |
| config.multitenant.enabled | bool | `false` | enables in Acapy Multitenant mode |
| config.postgres.account | string | `"postgres"` | External Postgres User Account for using the Wallet |
| config.postgres.admin.account | string | `"postgres"` | External Postgres User Password for creating the Wallet |
| config.postgres.admin.password | string | `"secureAdminPassword"` | External Postgres User Password for creating the Wallet |
| config.postgres.dbName | string | `"databaseName"` | External Postgres Database Name |
| config.postgres.enabled | bool | `false` | Enables External Postgres Storage instead of sqlite in the agent |
| config.postgres.maxConnections | int | `5` | External Postgres max Conections |
| config.postgres.password | string | `"securePassword"` | External Postgres User Password for using the Wallet |
| config.postgres.url | string | `"databasehost.com:5432"` | External Postgres Host |
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
| config.tails.baseUrl | string | `""` | Override the otherwise ledger-specifically generated base URL of the external tails server |
| config.tails.enabled | bool | `false` | Set to true to enable revocation (external tails server required) |
| config.tails.uploadUrl | string | `""` | Override the otherwise ledger-specifically generated upload URL of the external tails server |
| config.walletKey | string | `""` | Key for Encrpting all Database Credentials for the targeted Wallet |
| config.walletScheme | string | `"DatabasePerWallet"` | seed for the JWT Authentication in Mutltitenant Mode DatabasePerWallet -- each wallet has its own database MultiWalletSingleTable -- all wallets are stored in single table in single database. Each wallet has its own connection pool. MultiWalletSingleTableSharedPool -- all wallets are stored in single table in single database. The plugin will create only 1 connection pool reused by all wallets. This can be useful if intend to open many different wallets. Postgres has by default limitation of ~100 simultaneous connections and using this strategy you can limit number of DB connections significantly. |
| deploymentStrategy.rollingUpdate.maxSurge | string | `"50%"` |  |
| deploymentStrategy.rollingUpdate.maxUnavailable | int | `0` |  |
| deploymentStrategy.type | string | `"RollingUpdate"` |  |
| existingSecret | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| global.ingressSuffix | string | `""` |  |
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
