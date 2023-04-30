module "app" {
  source = "./modules/app"
}

module "ci-cd" {
  source = "./modules/ci-cd"
}

module "db" {
  source = "./modules/db"
}

module "linkerd" {
  source = "./modules/linkerd"
}

module "monitoring" {
  source = "./modules/monitoring"
}

module "storage" {
  source = "./modules/storage"
}

module "testkube" {
  source = "./modules/testkube"
  s3_endpoint = module.storage.garage_endpoint
  s3_secret = module.storage.garage_secret
  s3_accessKey = module.storage.garage_accessKey
  depends_on = [module.storage]
}