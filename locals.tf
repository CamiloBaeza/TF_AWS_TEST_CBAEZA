locals {
    s3_bucket_almacen = "tarrito-${var.project}-cb-almacen-${terraform.workspace}"
    s3_bucket_tf = "tarrito-${var.project}-cb-tf-${terraform.workspace}"
}