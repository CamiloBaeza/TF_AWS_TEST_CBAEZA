#al loco que me robo el nombre del tarro, lo odio :C
# resource "aws_s3_bucket" "s3_almacen" {
#  bucket = local.s3_bucket_almacen
# }

# resource "aws_s3_object" "s3_object_procesados_SD" {
#   for_each = fileset("./Studio-develop/","**")
#   bucket = aws_s3_bucket.s3_almacen.id
#   key = "Studio-develop/${each.value}"
#   source = "./Studio-develop/${each.value}"
#   etag = filemd5("./Studio-develop/${each.value}")
# }

# resource "aws_s3_object" "s3_object_procesados_SQ" {
#   for_each = fileset("./Studio-qa/","**")
#   bucket = aws_s3_bucket.s3_almacen.id
#   key = "Studio-qa/${each.value}"
#   source = "./Studio-qa/${each.value}"
#   etag = filemd5("./Studio-qa/${each.value}")
# }

# resource "aws_s3_object" "s3_object_fodler1_fore" {
#   for_each = fileset("./Folder1/","**")
#   bucket = aws_s3_bucket.s3_almacen.id
#   key = "Folder1/${each.value}"
#   source = "./Folder1/${each.value}"
#   etag = filemd5("./Folder1/${each.value}")
# }

# resource "aws_s3_object" "folder2"{
#   bucket = aws_s3_bucket.s3_almacen.id
#   key = "Folder2/"
#   source = "/dev/null"
# }

# resource "aws_s3_object" "s3_object_folder3_upload" {
#   for_each = fileset("./Folder3/","**")
#   bucket = aws_s3_bucket.s3_almacen.id
#   key = "Folder3/${each.value}"
#   source = "./Folder3/${each.value}"
#   etag = filemd5("./Folder3/${each.value}")
# }

# resource "aws_s3_object" "folder3"{
#   bucket = aws_s3_bucket.s3_almacen.id
#   key = "Folder3/"
#   source = "/dev/null"
# }

# resource "aws_s3_object" "folder4"{
#   bucket = aws_s3_bucket.s3_almacen.id
#   key = "Folder4/"
#   source = "/dev/null"
# }

# resource "aws_s3_object" "s3_object_folder4_upload" {
#   for_each = fileset("./Folder4/","**")
#   bucket = aws_s3_bucket.s3_almacen.id
#   key = "Folder4/${each.value}"
#   source = "./Folder4/${each.value}"
#   etag = filemd5("./Folder4/${each.value}")
# }

# resource "aws_s3_object" "folder5"{
#   bucket = aws_s3_bucket.s3_almacen.id
#   key = "Folder5/"
#   source = "/dev/null"
# }

# resource "aws_s3_object" "s3_object_folder5_upload" {
#   for_each = fileset("./Folder5/","**")
#   bucket = aws_s3_bucket.s3_almacen.id
#   key = "Folder5/${each.value}"
#   source = "./Folder5/${each.value}"
#   etag = filemd5("./Folder5/${each.value}")
# }

# resource "aws_s3_object" "folder6"{
#   bucket = aws_s3_bucket.s3_almacen.id
#   key = "Folder6/"
#   source = "/dev/null"
# }

# resource "aws_s3_object" "folder7"{
#   bucket = aws_s3_bucket.s3_almacen.id
#   key = "Folder7/"
#   source = "/dev/null"
# }

# resource "aws_s3_object" "s3_object_folder6_upload" {
#   for_each = fileset("./Folder6/","**")
#   bucket = aws_s3_bucket.s3_almacen.id
#   key = "./Folder6/${each.value}"
#   source = "./Folder6/${each.value}"
#   etag = filemd5("./Folder6/${each.value}")
# }