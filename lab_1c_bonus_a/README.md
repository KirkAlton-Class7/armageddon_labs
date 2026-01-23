# Private 3-Tier VPC with NAT Gateway

This template deploys a private 3-tier VPC across three Availability Zones. It deploys only one public subnet, for the NAT Gateway.

### Subnet Layers

- **Public Subnet**: NAT Gateway only (DO NOT DEPLOY RESOURCES HERE)
- **Private-Egress Subnet**: Optional. Simplifies process for updating compute resources that need updates (patches, OS installs, etc.)
- **Private-App Subnet**: application tier (fully isolated)
- **Private-Data Subnet**: databases and internal services (fully isolated)

Supports environment tags and deployment in 6 regions.

## Default Variable Values

- `application` = `sandbox`
- `environment` = `dev`
- `region` = `us-west-2`
