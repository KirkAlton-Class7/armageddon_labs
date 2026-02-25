module "compute" {
  source = "./modules/compute"

  # You likely already pass other vars here...

  secret_arn = module.database.secret_arn
}