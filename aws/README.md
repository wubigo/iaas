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