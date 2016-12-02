# ruifile 接口

* 测试服务器访问地址  10.10.10.111:8000
* 文件上传服务  10.10.10.111:8082

### 需要登录认证头部格式

Headers参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
Authorization |string |required | ex.: Token f3e7494700af962d38583016e942a01148eda5a4 |认证


### 请求错误返回格式

错误码 400 401 403 404 500

响应

    {
        "error_msg": "error msg"
    }

## 账号管理

### 账号登录
请求

    POST /v1/auth/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
username |string |required | |用户名
password |string |required | |密码


响应

    {
        "id": 7,
        "username": "one",
        "email": "one@test.com",
        "is_staff": false,
        "is_active": true,
        "token": "28f5756802d1cc24ca017a03390eb37b140726e9",
        "date_joined": 1478162560
    }

状态码

* 200
* 400
* 403


### 账号登出
请求

    DELETE /v1/auth/

状态码

* 204
* 401


### 账号创建

请求

    POST /v1/accounts/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
username |string |required | |用户名
password |string |required | |密码
email |string |required | |邮箱

状态码 201

响应

    {
        "id": 2,
        "username": "user",
        "email": "user@mail.com",
        "is_active": true,
        "usage": 0,
        "total": 107374182400,
        "date_joined": 1356061187,
    }


### 账号列表

请求

    GET /v1/accounts/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
skip |integer |optional | |起始数
limit |integer |optional | |终止数

状态码 200

响应

    [
        {
            "id": 2,
            "username": "user",
            "email": "user@mail.com",
            "is_active": true,
            "usage": 0,
            "total": 107374182400,
            "date_joined": 1356061187,
        }
    ]


### 账号详情
请求

    GET /v1/accounts/{id}/

状态码 200

响应

    {
        "id": 2,
        "username": "user"
        "email": "user@mail.com"
        "is_active": true,
        "usage": 651463187,
        "total": 107374182400,
        "date_joined": 1356061187,
    }



### 账号修改

请求

    PUT /v1/accounts/{id}/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
old_password |string |optional | |旧密码,需要用户登录,当用于登录用户的修改密码,邮箱时候必填;当管理员对某个用户修改时，不必填。
new_password |string |optional | |新密码,需要用户登录,当用于登录用户的修改密码时候必填;
email |string |optional | |邮箱,需要用户登录，当用于登录用户的邮箱时候必填;
is_staff |boolean |optional | |权限,需要管理员登录才可以修改


状态码 200

响应

    {
        "id": 2,
        "username": "user",
        "email": "user@mail.com",
        "is_active": true,
        "usage": 651463187,
        "total": 107374182400,
        "date_joined": 1356061187,
    }


### 邮箱重置密码链接

请求

    GET /v1/accounts/reset-password/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
username-email |string |required | |用户名 或者 邮箱


状态码 200

响应

    {
          "username": "joker",
          "email": "q*********9@163.com"
    }


### 重置密码链接过期检查

请求

    GET /v1/accounts/reset-password/{token}/


状态码 200


### 重置密码

请求

    POST /v1/accounts/reset-password/{token}/

状态码 200


### 账号删除

请求

    DELETE /v1/accounts/{id}/

状态码 204



## 群组管理

### 群组创建

请求

    POST /v1/groups/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
group_name |string |required | |组名

状态码 201

响应

     {
        "id": 89,
        "name": "group1",
        "owner": "test_group",
        "create_at": 1478514540,
        "admins": [
            "test_group"
        ]
    }


### 群组列表

请求

    GET /v1/groups/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
skip |integer |optional |default=0 |起始数
limit |integer |optional |default=10 |终止数
with_repos |integer |optional |1 or 0 |附带这个组拥有的资源库，1表示附带，0表示不附带

状态码 200

响应

    [
        {
            "id": 89,
            "name": "group1",
            "owner": "test_group",
            "create_at": 1478514540,
            "admins": [
                "test_group"
            ],
            "repos": []
        }
    ]


### 群组详情

请求

    GET /v1/groups/{id}/

状态码 200

响应

    {
        "id": 89,
        "name": "group1",
        "owner": "test_group",
        "create_at": 1478514540,
        "admins": [
            "test_group"
        ]
    }


### 重命名群组

请求

    PUT /v1/groups/{id}/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required |rename |操作
new_name |string |required | | 新组名

状态码 200

响应

    {
        "id": 89,
        "name": "new_group1",
        "owner": "test_group",
        "create_at": 1478514540,
        "admins": [
            "test_group"
        ]
    }


### 转让群组

请求

    PUT /v1/groups/{id}/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required |transfer |操作
target |string |required | | 把组转让给的用户名

状态码 200


响应

    {
        "id": 89,
        "name": "new_group1",
        "owner": "joker",
        "create_at": 1478514540,
        "admins": [
            "test_group"
        ]
    }


### 删除群组

请求

    DELETE /v1/groups/{id}/

状态码 204


## 群组成员管理

### 群组成员列表

请求

    GET /v1/groups/{id}/members/


状态码 200

响应

    [
        {
            "id": 1,
            "group_id": 89,
            "username": "test_group",
            "is_staff": 0
        },
        {
            "id": 2,
            "group_id": 89,
            "username": "joker",
            "is_staff": 1
        }
    ]


### 添加群组成员

请求

    POST /v1/groups/{id}/members/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
target |string |required | | 用户名

状态码 200

响应

    {
        "id": 2,
        "name": "foo",
        "group_id": 78
        "is_staff": 0
    }


### 批量添加群组成员

请求

    POST /v1/groups/{id}/members/batch/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
targets |list |required | | 用户名列表

状态码 200

响应

    {
        "failed": [
            {
                "username": "sss",
                "error": "User sss is not exist."
            }
        ],
        "success": [
            {
                "id": 4,
                "username": "joker",
                "group_id": "78",
                "is_staff": 0
            },
            {
                "id": 6,
                "username": "other",
                "group_id": "78",
                "is_staff": 0
            }
        ]
    }


### 群组成员详情

请求

    GET /v1/groups/{id}/members/{id}/


状态码 200

响应

    {
        "id": 2,
        "name": "foo",
        "group_id": 78
        "is_staff": 0
    }


### 群组管理员授权

请求

    PUT /v1/groups/{group_id}/members/{user_id}/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required | "manager", "member" | 操作某个群成员成为管理员，或某个群管理员成为群成员

状态码 200

响应

    {
        "id": 2,
        "name": "foo",
        "group_id": 78
        "is_staff": 1
    }

**or**

    {
        "id": 2,
        "name": "foo",
        "group_id": 78
        "is_staff": 0
    }


### 删除群成员

请求

    DELETE /v1/groups/{id}/members/{id}/

状态码 204


## 库管理
### 库列表

请求

    GET /v1/repos/

状态码 200

响应

    [{
        "id": "f158d1dd-cc19-412c-b143-2ac83f352290",
        "name": "foo",
        "desc": "new library",
        "permission": "rw",
        "encrypted": false,
        "mtime": 1400054900,
        "owner": "user",
        "size": 0,
        "is_virtual": false,
    }]


### 库详情

请求

    GET /v1/repos/{repo-id}/

状态码 200

响应

    {
        "id": "f158d1dd-cc19-412c-b143-2ac83f352290",
        "name": "foo",
        "desc": "new library",
        "permission": "rw",
        "encrypted": false,
        "mtime": 1400054900,
        "owner": "user",
        "size": 0,
        "is_virtual": false,
    }


### 创建库

请求

    POST /v1/repos/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
name |string |required | | 资源库名字
desc |string |optional | |
password |string |optional |  |资源库密码

状态码 200

响应

    {
        "id": "f158d1dd-cc19-412c-b143-2ac83f352290",
        "name": "foo",
        "desc": "new library",
        "permission": "rw",
        "encrypted": false,
        "mtime": 1400054900,
        "owner": "user",
        "size": 0,
        "is_virtual": false,
    }


### 删除库

请求

    DELETE /v1/repos/{repo_id}/

状态码 204


### 修改库

请求

    PUT /v1/repos/{repo_id}/


参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
name |string |required | | 资源库名字
desc |string |optional | |

状态码 200

响应

    {
        "id": "f158d1dd-cc19-412c-b143-2ac83f352290",
        "name": "foo",
        "desc": "new library",
        "permission": "rw",
        "encrypted": false,
        "mtime": 1400054900,
        "owner": "user,
        "size": 0,
        "is_virtual": false,
    }


### 转让库

请求

    POST /v1/repos/{repo_id}/action

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required |transfer | 操作
new_owner |string |required |  |库转让给的人

响应

    {
        "id": "f158d1dd-cc19-412c-b143-2ac83f352290",
        "name": "foo",
        "desc": "new library",
        "permission": "rw",
        "encrypted": false,
        "mtime": 1400054900,
        "owner": "new owner",
        "size": 0,
        "is_virtual": false,
    }


### 库密码认证

描述

如果库有设置密码，需要先使用这个接口解密库

请求

    POST /v1/repos/{repo_id}/action


参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required |setpassword | 操作
password |string |required |  |资源库密码

状态码 200


### 创建公共库

请求

    POST /v1/repos/public/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
name |string |required | |公共资源库名字
password |string |optional |  |公共资源库密码
desc |string |optional |  |公共资源库描述
permission |string |optional | rw, r(default)  |权限


状态码 200

响应

    {
        "id": "f158d1dd-cc19-412c-b143-2ac83f352290",
        "name": "foo",
        "desc": "new library",
        "permission": "rw",
        "encrypted": false,
        "mtime": 1400054900,
        "owner": "joker",
        "size": 0,
        "is_virtual": false,
    }


### 搜索库

请求

    GET /v1/repos/search/?q=123

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
q |string |required | |搜索的keyword

状态码 200

响应

    [
        {
            "path": "/mm/123dir",
            "repo_id": "9c42cedd-5ad2-4741-bbbf-2d65b38b21e5",
            "repo_name": "joker_repo1"
        },
        {
            "path": "/mm/123dir/123.py",
            "repo_id": "9c42cedd-5ad2-4741-bbbf-2d65b38b21e5",
            "repo_name": "joker_repo1"
        }
    ]




## 目录管理

### 目录列表

请求

    GET /v1/repos/{repo-id}/dirs/

查询参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
p |string |optional |default:/ | 路径
t |string |optional |f or d |类型,f表示只列出文件，d表示列出目录,不填列出文件跟目录集合
recursive |string |optional |1 or 0 |递归,1表示递归的列出该路径下所有文件，目录;0表示相反。

状态码 200

响应

	[{
	    "id": "0000000000000000000000000000000000000000",
	    "type": "file",
	    "name": "test1.c",
	    "size": 0,
	    "mtime": 1479205913,
            "permission": "rw"
	},
	{
	    "id": "e4fe14c8cda2206bb9606907cf4fca6b30221cf9",
	    "type": "dir",
	    "name": "test_dir",
	    "mtime": 1479288209,
            "permission": "rw"
	}]

### 创建目录

请求

    POST /v1/repos/{repo-id}/dirs/?p=/

查询参数：

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
reloaddir |string |optional | |表示创建后，需要把同层目录列表返回

状态码 200


### 重命名目录

请求

    POST  /v1/repos/{repo-id}/dirs/action?p=/foo

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required |rename |操作
newname |string |optional | |目录的新名字

状态码 200


### 复制目录

请求

    POST  /v1/repos/{repo-id}/dirs/action?p=/foo

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required |copy |操作
dst_repo_id |string |required | |目的资源库id
dst_dir_path |string |required | |目的目录完整路径,例如:/parentDir/new_foo

状态码 200


### 移动目录

请求

    POST  /v1/repos/{repo-id}/dirs/action?p=/foo

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required |move |操作
dst_repo_id |string |required | |目的资源库id
dst_dir_path |string |required | |目的目录完整路径,例如:/parentDir/new_foo

状态码 200


### 删除目录

请求

    DELETE /v1/repos/{repo-id}/dirs/?p=/foo

查询参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
reloaddir |string |optional | |表示删除后，需要把同层目录列表返回


状态码 204


### 下载目录

请求

    GET /v1/repos/{repo-id}/dirs/download/?p=/foo

状态码 200

响应

    "https://xxx.com:8082/zip/766415dc-8f30-4d37-8f60-992fb3d88f05"


### 目录共享链接

请求

    POST /v1/repos/{repo-id}/dirs/shared-link/?p=/foo

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
password |string |optional | |共享的密码
expire |integer |optional | |过期时间

状态码 201

响应

    "http://xxx.com:8082/v1/shared-links/9ead811f68/"



## 文件管理

### 文件下载链接

请求

    GET /v1/repos/{repo-id}/files/download/?p=/foo.c

状态码 200

响应

    "https://xxx.com:8082/files/5a3f3a63-b13d-4b78-82b2-6547c1e77dd7/foo.c"


### 获取文件上传链接

请求

    GET /v1/repos/{repo-id}/files/upload/?p=/

状态码 200

响应

    "https://xxx.com:8082/upload-api/90e6db94-c2f9-4af5-b49d-3a21dc27e6c6"

### 上传文件

请求

    POST https://xxx.com:8082/upload-api/90e6db94-c2f9-4af5-b49d-3a21dc27e6c6


参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
file |string |required | |文件标识
filename |string |required | | 文件名(带文件后缀)
parent_dir |string |required | | 上传文件到的目录


状态码 200

响应

    "0000000000000000000000000000000000000000"      #file_id


### 获取文件详情

请求

    GET /v1/repos/{repo-id}/files/?p=/foo.c

状态码 200

响应

    {
        "id": "013d3d38fed38b3e8e26b21bb3463eab6831194f",
        "mtime": 1398148877,
        "type": "file",
        "name": "foo.py",
        "size": 22
    }


### 创建文件

请求

    POST /v1/repos/{repo-id}/files/?p=/foo.c

状态码 201


### 重命名文件

请求

    POST /v1/repos/{repo-id}/files/action?p=foo.c

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required |rename |操作
newname |string |required | |文件新名字

状态码 200


### 移动文件

请求

    POST /v1/repos/{repo-id}/files/action/?p=/foo.c

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required |move |操作
dst_repo_id |string |required | |目的资源库id
dst_file_path |string |required | |目的文件完整路径，例如：/parentDir/new_foo.c

状态码 200


### 复制文件

请求

    POST /v1/repos/{repo-id}/files/action/?p=/foo.c

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required |copy |操作
dst_repo_id |string |required | |目的资源库id
dst_file_path |string |required | |目的文件完整路径，例如：/parentDir/new_foo.c

状态码 200



### 恢复文件

请求

    POST  /v1/repos/{repo-id}/files/action/?p=/foo.c

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required |revert |操作
commit_id |string |required | |恢复的版本id

状态码 200


### 文件版本历史

请求

    POST  /v1/repos/{repo_id}/files/action/?p=/foo.c

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required |"history" |操作

状态码 200

响应

    {
        "commits":[
            {
                "id": "e9116702c0a801b4b802e03ffa18dd691a43a153",
                "repo_id": "f468fa9b-a0e4-4ad7-bd15-dd2edd90f6fe",
                "creator_name": "joker",
                "ctime": 1476698143,
                "new_merge": false,
                "conflict": false,
                "desc": "Renamed \"fooo.py\""
            }
        ]
    }


### 文件历史版本下载

请求

    POST  /v1/repos/{repo_id}/files/action/?p=/foo.c

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required |"revision" |
commit_id |strting |required |"" | 版本id

状态码 200

响应

    "http://xxx.com:8082/files/2fd9fa56-f01a-4e12-a6d3-36f3fa7cc5fa/foo.c"



### 删除文件

请求

    DELETE /v1/repos/{repo-id}/files/?p=/foo.c

状态码 204


### 文件共享链接

请求

    POST /v1/repos/{repo-id}/files/shared-link/?p=/foo.c

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
password |string |optional | |共享的密码
expire |integer |optional | |过期时间

状态码 201

响应

    "http://xxx.com:8082/v1/shared-links/939ac61687/"


## 通知管理

### 获取通知列表

请求

    GET /v1/notifications/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
msg_type |string |optional |"share_repo", "share_dir" |消息类型
seen |string |optional |"all", "true", "false"(default) |消息查看状态,all表示所有,true表示已看,false表示未看
skip |integer |optional |0(default) |起始数
limit |integer |optional |20(default) |终止数


状态码 200

响应

    [
        {
            "id": 23,
            "to_user": "admin",
            "msg_type": "dir_share",
            "msg_from": "joker",
            "content": "joker share a dir to you.",
            "seen": false,
            "timestamp": 1476698143
        },
        {
            "id": 24
            "to_user": "admin",
            "msg_type": "repo_share",
            "msg_from": "joker",
            "content": "joker share a repo to you.",
            "seen": false,
            "timestamp": 1476698143
        }
    ]


### 删除所有通知

请求

    DELETE /v1/notifications/

状态码 204


### 标记所有通知为已看

请求

    POST /v1/notifications/

状态码 200


### 标记单个通知为已看

请求

    POST /v1/notifications/{notice_id}/

状态码 200


### 查看单个通知详情

请求

    GET /v1/notifications/{notice_id}/

状态码 200

响应

    {
        "id": 22,
        "to_user": "new",
        "msg_type": "repo_share",
        "msg_from": "joker",
        "content": "joker share a repo to you.",
        "seen": true,
        "timestamp": 1476698143
    }


## 共享操作
### 共享库
#### 共享库列表

请求

    GET /v1/shared-repos/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
repo_id |string |optional | |资源库id

状态码 200

响应

    [{
        "repo_id": "7d42522b-1f6f-465d-b9c9-879f8eed7c6c",
        "share_type": "personal",
        "permission": "rw",
        "encrypted": false,
        "user": "user@example.com",
        "last_modified": 1361072500,
        "repo_desc": "ff",
        "group_id": 0,
        "repo_name": "\u6d4b\u8bd5\u4e2d\u6587pdf"
     },
     {
        "repo_id": "79bb29cd-b683-4844-abaf-433952723ca5",
        "share_type": "group",
        "permission": "rw",
        "encrypted": false,
        "user": "user@example.com",
        "last_modified": 1359182468,
        "repo_desc": "test",
        "group_id": 1,
        "repo_name": "test_enc"
     }]


#### 被共享库列表

请求

    GET /v1/beshared-repos/

状态码 200

响应

    [{
        "user": "user@example.com",
        "repo_id": "989e3952-9d6f-4427-ab16-4bf9b53212eb",
        "share_type": "personal",
        "permission": "rw",
        "encrypted": false,
        "repo_desc": "lib shared to imwhatiam",
        "enc_version": false,
        "last_modified": 1398218747,
        "is_virtual": false,
        "group_id": 0,
        "repo_name": "lib shared to imwhatiam"
    }]


#### 删除共享库

请求

    DELETE /v1/shared-repos/?repo_id=xxx&share_type=personal&user=foo

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
repo_id |string |required | |资源库id
share_type |string |required |personal, group, public | 当public时，是删除一个公有库
user |string |optional |username |被分享用户名,当share_type=personal时,必填
group_id |Integer |optional | |被分享组id,当share_type=group,必填

状态码 204


#### 共享库

请求

    POST /v1/shared-repos/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
repo_id |string |required | |资源库id
share_type |string |required |personal, group, public | 当public时,是将一个已存在的库设置成公有库
users |list |optional |["username"] |被分享用户名列表,当share_type=personal时,必填
group_id |Integer |optional | |被分享组id,当share_type=group,必填
permission |string |required |r, rw |权限

状态码 200


### 共享目录

#### 共享目录列表

请求

    GET /v1/repos/{}/dirs/shared/?p=/dir

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
p |string |option |/dir, /(default) |目录路径
share_type |string |option |user, group, all(default) |

状态码 200

响应:

    {
        "users": [
            {
              "username": "admin",
              "share_type": "user",
              "permission": "r"
            }
        ],
        "groups": [
            {
                "share_type": "group",
                "id": "group_id",
                "name": "group_name",
                "permission": "r",
            }
        ]
    }


#### 共享目录

请求

    POST /v1/repos/{}/dirs/shared/?p=/dir

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
p |string |option |/dir, /(default) |目录路径
share_type |string |require |user, group |
targets |list |require |["username"] or ["group_id"] |被分享的用户或分组
permission |string |option | rw, r(default) |

状态码 200

响应

    {
        "failed": [
            {
                "username": "other",
                "error_msg": "User other not found."
            }
        ],
        "success": [
            {
                "username": "admin",
                "share_type": "user",
                "permission": "r"
            }
        ]
    }

**or**

    {
        "failed": [
            {
                "group_name": "group_name",
                "error_msg": "Group is not found."
            }
        ],
        "success": [
            {
                "share_type": "group",
                "id": "group_id",
                "name": "group_name",
                "permission": "r",
            }
        ]
    }


#### 共享目录权限修改

请求

    PUT /v1/repos/{}/dirs/shared/?p=/dir

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
p |string |option |/dir, /(default) |目录路径
share_type |string |require |user, group |
target |string |option | |被分享的用户,share_type=user时必填
group_id |int |option | |被分享的分组,share_type=group时必填
permission |string |option | rw, r(default) |

状态码 200


#### 共享目录删除

请求

    DELETE /v1/repos/{}/dirs/shared/?p=/dir

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
p |string |option |/dir, /(default) |目录路径
share_type |string |option |user, group, all(default) |
target |string |option | |被分享的用户,share_type=user, all时必填
group_id |int |option | |被分享的分组,share_type=group, all时必填

状态码 204


### 共享链接

#### 获得共享链接列表

请求

    GET /v1/shared-links/

状态码 204

响应

    [
        {
            "s_type": "d",
            "link": "http://localhost:8080/v1/shared-links/4d55b441a8/",
	    "expire": true,
	    "expire_date": 1398218747,
	    "password": true,
	    "view_cnt": 100
        },
        {
            "s_type": "f",
            "link": "http://localhost:8080/v1/shared-links/bf23dd4e83/",
	    "expire": false,
	    "expire_date": 1398218747,
	    "password": false,
	    "view_cnt": 2
        }
    ]


#### 删除共享链接

请求

    DELETE /v1/shared-links/4d55b441a8/

状态码 204


#### 检查共享链接

请求

    GET /v1/shared-links/4d55b441a8/

状态码 200

响应

    {
        "s_type": "d",
        "link": "http://localhost:8080/v1/shared-links/4d55b441a8/",
	"expire": true,
	"expire_date": 1398218747,
	"password": true,
	"view_cnt": 100
    }

#### 根据共享链接获得下载url

    POST /v1/shared-links/4d55b441a8/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
s_type |string |required |f, d |分享的类型,f表示文件,d表示目录
password |string |optional | |分享密码,当创建分享链接时候有设置密码,会检查并要求是否填写

状态码 200

响应

    "https://xxx.com:8082/files/5a3f3a63-b13d-4b78-82b2-6547c1e77dd7/foo.c"
