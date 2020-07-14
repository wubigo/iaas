## 前提

- 安装awscli，并且配置完毕

```
(venv) D:\>aws configure list
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                <not set>             None    None
access_key     ****************BVW2 shared-credentials-file
secret_key     ****************G3t5 shared-credentials-file
    region           ap-northeast-1      config-file    ~/.aws/config
```

## 版本

```
C:\code\iaas\aws>terraform version
Terraform v0.12.24
```

## 创建

```
terrafrom init
terraform apply  -auto-approve
```

## 重置


```
terraform destroy
```


## 显示状态

```
terraform output
```

## awscli

```
aws s3api create-bucket --bucket=terraform-serverless-e-1 --region ap-northeast-1 --create-bucket-configuration LocationConstraint=ap-northeast-1
```