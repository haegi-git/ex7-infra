# provider.tf
# ####################################################################################################
# 1. 테라폼 실행 환경 설정 블록
# ====================================================================================================
# 이 프로젝트에서 사용할 테라폼 자체의 설정과 필요한 플러그인들을 정의합니다.
terraform {
  # 프로젝트에서 사용할 클라우드 제공자(Provider) 목록을 정의합니다.
  required_providers {
    # 'aws'라는 이름으로 사용할 프로바이더 설정을 시작합니다.
    aws = {
      # 프로바이더 다운로드 경로입니다. (공식 HashiCorp 저장소의 AWS 플러그인)
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket         = "bipa17-std11-ex7-state"
    key            = "TerraformState/Ex/ex7-public-state/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "std11-ex7-lock-table"
    encrypt        = true
  }
}

# s3 버킷 생성
provider "aws" {
  region = "eu-central-1"
}
