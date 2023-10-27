resource "aws_eip" "nat" {
count = 1
vpc = true
  tags = {
      name = "idea-tf-main-natg-eip"
      
  }  
}

 
