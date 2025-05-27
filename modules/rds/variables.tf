variable "db_sg_id" {}
variable "private_subnet5_id" {}
variable "private_subnet6_id" {}
variable "db_username" {}
variable "db_password" {}
variable "db_sub_name" {
    default = "book-shop-db-subnet-a-b"
}
variable "db_name" {
    default = "testdb"
}