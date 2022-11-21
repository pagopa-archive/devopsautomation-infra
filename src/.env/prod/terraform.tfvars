# general
env_short      = "p"
env            = "prod"
prefix         = "dvopau"
location       = "northeurope"
location_short = "neu"

tags = {
  CreatedBy   = "Terraform"
  Environment = "PROD"
  Owner       = "DevOps"
  Source      = "https://github.com/pagopa/devopsautomation-infra"
  CostCenter  = "TS310 - PAGAMENTI & SERVIZI"
}

lock_enable = false

# 🔐 key vault
key_vault_name    = "dvopau-p-neu-kv"
key_vault_rg_name = "dvopau-p-sec-rg"

# ☁️ networking
cidr_vnet              = ["10.1.0.0/16"]
cidr_subnet_appgateway = ["10.1.128.0/24"]
cidr_subnet_postgres   = ["10.1.129.0/24"]
cidr_subnet_azdoa      = ["10.1.130.0/24"]
cidr_subnet_apim       = ["10.1.136.0/24"]
cidr_subnet_app_docker = ["10.1.137.0/24"]
cidr_subnet_bastion    = ["10.1.138.0/24"]
cidr_subnet_k8s        = ["10.1.0.0/17"]

# dns
prod_dns_zone_prefix = "devopsautomation"
external_domain      = "pagopa.it"

# azure devops
enable_azdoa        = true
enable_iac_pipeline = true
