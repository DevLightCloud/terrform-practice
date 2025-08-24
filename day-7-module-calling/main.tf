module "test" {
source = "../day-7-module-resouce"
ami-id = "ami-00ca32bbc84273381"
instance-type = "t2.micro"    
subnet_id = "subnet-0db0d853234399307"
}