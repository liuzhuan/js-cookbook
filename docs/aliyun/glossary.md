# 术语表

## [RAM](https://help.aliyun.com/document_detail/28627.html?spm=5176.doc28628.6.539.FHnRPW)

RAM (Resource Access Management) 是阿里云为客户提供的用户身份管理与访问控制服务。使用RAM，您可以创建、管理用户账号（比如员工、系统或应用程序），并可以控制这些用户账号对您名下资源具有的操作权限。当您的企业存在多用户协同操作资源时，使用RAM可以让您避免与其他用户共享云账号密钥，按需为用户分配最小权限，从而降低您的企业信息安全风险。

## [云账户（主账户）](https://help.aliyun.com/document_detail/28628.html?spm=5176.doc28627.6.540.rR8M5g)

云账户是阿里云资源归属、资源使用计量计费的基本主体。当用户开始使用阿里云服务时，首先需要注册一个云账户。云账户为其名下所拥有的资源付费，并对其名下所有资源拥有完全权限。默认情况下，资源只能被属主（ResourceOwner）所访问，任何其他用户访问都需要获得属主的显式授权。所以从权限管理的角度来看，云账户就是操作系统的 root 或 Administrator，所以我们有时称它为“根账户”或“主账户”。

## 身份凭证（Credential）

身份凭证是用于证明用户真实身份的凭据，它通常是指登录密码或访问密钥（Access Key）。身份凭证是秘密信息，用户必须保护好身份凭证的安全。

* 登录名/密码（Password）您可以使用登录名和密码登入阿里云控制台，查看订单、账单或购买资源，并通过控制台进行资源操作。
* 访问密钥（AccessKey）您可以使用访问密钥构造一个 API 请求（或者使用云服务 SDK）来操作资源。
* 多因素认证多因素认证（Multi-Factor Authentication, MFA）是一种简单有效的最佳安全实践方法，它能够在用户名和密码之外再额外增加一层安全保护。启用 MFA 后，用户登录阿里云网站时，系统将要求输入用户名和密码（第一安全要素），然后要求输入来自其MFA设备的可变验证码（第二安全要素）。这些多重要素结合起来将为您的账户提供更高的安全保护。

## 资源（Resource）

资源是云服务呈现给用户与之交互的对象实体的一种抽象，如 OSS 存储桶或对象，ECS 实例等。

我们为每个资源定义了一个全局的阿里云资源名称（Aliyun Resource Name, ARN）。格式如下：

```
acs:<service-name>:<region>:<account-id>:<resource-relative-id>
```

格式说明：

* acs: 它是 Alibaba Cloud Service 的首字母缩写，表示阿里云的公有云平台
* service-name: 阿里云提供的 Open Service 的名字，如 ecs, oss, odps 等
* region: 地区信息。如果不支持该项，可以使用通配符“*”号来代替
* account-id: 账号 ID，比如 1234567890123456
* resource-relative-id: 与 service 相关的资源描述部分，其语义由具体 service 指定。

以 OSS 为例，”acs:oss::1234567890123456:sample_bucket\/file1.txt” 表示公有云平台 OSS 资源，OSS 对象名称是 sample_bucket\/file1.txt，对象的 Owner 是 1234567890123456。

## 授权策略（Policy）

授权策略是描述权限集的一种简单语言规范。

RAM 支持两种类型的授权策略：云平台管理的系统访问策略和客户管理的自定义访问策略。对于阿里云管理的系统访问策略，用户只能使用，不能修改，阿里云会自动完成系统访问策略的版本更新。对于客户管理的自定义访问策略，用户可以自主创建和删除，策略版本由客户自己维护。

## ECS 实例

## RDS 实例

## 负载均衡实例

## OSS 存储桶

## OSS 基本概念

阿里云对象存储服务（Object Storage Service，简称 OSS），是阿里云提供的海量、安全、低成本、高可靠的云存储服务。您可以通过调用 API，在任何应用、任何时间、任何地点上传和下载数据，也可以通过 Web 控制台对数据进行简单的管理。OSS 适合存放任意类型的文件，适合各种网站、开发企业及开发者使用。按实际容量付费真正使您专注于核心业务。

* Bucket
* Object
* Region
* Endpoint
* AccessKey: AccessKeyId, AccessKeySecret