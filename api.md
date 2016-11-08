# ruifile 接口


## 账号管理

### 账号登录
请求

    POST /v1/auth/

参数

    username
    
    password

响应

    {"token": "24fd3c026886e3121b2ca630805ed425c272cb96"}



### 账号创建

请求

    POST /v1/accounts/

参数

    username

    password

    email

状态码 201

响应

    {
        "id": 2,
        "username": "user",
        "email": "user@mail.com",
        "is_active": true,
        "usage": 0,
        "total": 107374182400,
        "ctime": 1356061187741686,
    }


### 账号列表

请求

    GET /v1/accounts/

查询参数

    start， limit

状态码 200

响应

    [ {
        "id": 2,
        "username": "user",
        "email": "user@mail.com",
        "is_active": true,
        "usage": 0,
        "total": 107374182400,
        "ctime": 1356061187741686,
    }]


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
        "ctime": 1356061187741686,
    }



### 账号修改

请求

    PUT /v1/accounts/{id}/

可选参数

    password, email

状态码 200

响应

    {
        "id": 2,
        "username": "user",
        "email": "user@mail.com",
        "is_active": true,
        "usage": 651463187,
        "total": 107374182400,
        "ctime": 1356061187741686,
    }


### 账号删除

请求

    DELETE /v1/accounts/{id}/

状态码 204



## 群组管理

### 群组创建

请求

    POST /v1/groups/

参数

    group_name

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
            ]
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
targets |string |required | | 用户名列表

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
        "email": "foo@foo.com"
    }


### 群组管理员授权

请求

    PUT /v1/groups/{group_id}/members/{user_id}/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required | manager | member | 操作某个群成员成为管理员，或某个群管理员成为群成员

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
    }


### 创建库

请求

    POST /v1/repos/

参数

    name, desc, password


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
    }


### 删除库

请求

    DELETE /v1/repos/{repo_id}/

状态码 204


### 修改库

请求

    PUT /v1/repos/{repo_id}/


参数

    name, desc

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
    }


### 转让库

请求

    POST /v1/repos/{repo_id}/action

参数

    action=transfer
    
    owner

### 解密库

请求

    POST /v1/repos/{repo_id}/action


参数

    action = setpassword
    
    password

状态码 200


### 创建公共库

请求

    POST /v1/repos/public/

参数

    name, permission(r, rw), password

状态码 200

响应

    {
        "id": "f158d1dd-cc19-412c-b143-2ac83f352290",
        "name": "foo",
        "desc": "new library",
        "permission": "rw",
        "encrypted": false,
        "mtime": 1400054900,
        "owner": "user@mail.com",
        "size": 0,
    }



### 删除公共库

请求

    DELETE /v1/repos/{repo_id}/

状态码 204


### 获取库下载信息

请求

    GET /v1/repos/{repo_id}/download/

状态码 200

响应

    {
        "relay_id": "c82139f0e8ea546cc612d0467a60d1ccf8c4c3f6",
        "relay_addr": "www.ruifile.com",
        "relay_port": "10001",
        "token": "6df2406b035952c39bd27118d3e29101f4cd11d2",
        "email": "joker",
        "repo_id": "3fbf186b-5343-41ac-962a-39839af938ab",
        "repo_name": "joker_repos",
        "repo_desc": "",
        "repo_size": "0",
        "repo_size_formatted": "0 bytes",
        "repo_version": 1,
        "head_commit_id": "3fe4054f1060c3c3efd2eece36de69fcadf656f5",
        "random_key": "",
        "magic": "",
        "mtime": null,
        "encrypted": "",
        "enc_version": 0
    }


### 搜索库

请求

    GET /v1/search/

参数

    q, per_page

状态码 200

响应

    {
        "has_more": false,
        "total": 1,
        "results": [{
                "repo_id": "691b3e24-d05e-43cd-a9f2-6f32bd6b800e",
                "name": "api.md",
                "oid": "8ea78453bb474359cd9d8e2c4c4d8d9cbdcef0a2",
                "last_modified": 1398045167,
                "fullpath": "/api.md",
                "size": 18939
            }]
     }




## 目录管理

### 目录列表

请求

    GET /v1/repos/{repo-id}/dirs/

查询参数

    p, t(=f|d), recursive

状态码 200

响应

	[{
	    "id": "0000000000000000000000000000000000000000",
	    "type": "file",
	    "name": "test1.c",
	    "size": 0
	},
	{
	    "id": "e4fe14c8cda2206bb9606907cf4fca6b30221cf9",
	    "type": "dir",
	    "name": "test_dir"
	}]

### 创建目录

请求

    POST /v1/repos/{repo-id}/dirs/?p=/

查询参数：

    reloaddir

状态码 200


### 重命名目录

请求

    POST  /v1/repos/{repo-id}/dirs/action?p=/foo

参数

    action=rename
   
    newname

状态码 200


### 复制目录

请求

    POST  /v1/repos/{repo-id}/dirs/action?p=/foo

参数

    action=copy
    dst_repo_id
    dst_dir_path        /parentDir/foo || new_foo

状态码 200


### 移动目录

请求

    POST  /v1/repos/{repo-id}/dirs/action?p=/foo

参数

    action=move
    dst_repo_id
    dst_dir_path        /parentDir/foo || new_foo

状态码 200


### 删除目录

请求

    DELETE /v1/repos/{repo-id}/dirs/?p=/foo

查询参数

    reloaddir

状态码 204


### 下载目录

请求

    GET /v1/repos/{repo-id}/dirs/download/?p=/foo

状态码 200

响应

    "https://xxx.com:8082/files/766415dc-8f30-4d37-8f60-992fb3d88f05/foo"


### 目录共享链接

请求

    POST /v1/repos/{repo-id}/dirs/shared-link/?p=/foo

状态码 201

响应

    {
        "location": "/d/9ead811f68/"
    }


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

    "0000000000000000000000000000000000000000"      file_id


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

    action=rename
    newname

状态码 200


### 锁定文件

请求

    POST /v1/repos/{repo-id}/files/action?p=foo.c

参数

    action=lock

状态码 200


### 解锁文件

请求

    POST /v1/repos/{repo-id}/files/action?p=foo.c

参数

    action=lock

状态码 200


### 移动文件

请求

    POST /v1/repos/{repo-id}/files/action/?p=/foo.c

参数

    action=move
    dst_repo_id
    dst_file_path       /parentDir/foo.c || new_foo.c

状态码 200


### 复制文件

请求

    POST /v1/repos/{repo-id}/files/action/?p=/foo.c

参数

    action=copy
    dst_repo_id
    dst_file_path       /parentDir/foo.c || new_foo.c

状态码 200



### 恢复文件

请求

    POST  /v1/repos/{repo-id}/files/action/?p=/foo.c

参数

    action=revert
    
    commit_id

状态码 200


### 文件版本历史

请求

    POST  /v1/repos/{repo_id}/files/action/?p=/foo.c

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
action |string |required |"history" |

状态码 200

响应

    {
        "commits":[
            {
                "id": "e9116702c0a801b4b802e03ffa18dd691a43a153",
                "parent_id": "97a657b64f67b42a46e6ef77f83aa547261e4312",
                "second_parent_id": null,
                "repo_id": "f468fa9b-a0e4-4ad7-bd15-dd2edd90f6fe",
                "root_id": "1997c5b61f684cdf0a59a918e5007c9d73b6cace",
                "creator": "0000000000000000000000000000000000000000",
                "creator_name": "joker",
                "rev_file_id": "0000000000000000000000000000000000000000",
                "rev_file_size": 0,
                "rev_renamed_old_path": null,
                "ctime": 1476698143,
                "device_name": null,
                "new_merge": false,
                "version": 1,
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

    "/files/2fd9fa56-f01a-4e12-a6d3-36f3fa7cc5fa/foo.c"



### 删除文件

请求

    DELETE /v1/repos/{repo-id}/files/?p=/foo.c

状态码 204


### 文件共享链接

请求

    POST /v1/repos/{repo-id}/files/shared-link/?p=/foo.c

状态码 201

响应

    {
        "location": "/f/939ac61687/"
    }


## 通知管理

### 获取通知列表

请求

    GET /v1/notifications/

参数

argument |type |need |value |description
:----- |:----- |:----- |:----- |:----
msg_type |string |option |"share_repo", "share_dir" |消息类型


状态码 200

响应

    [
        {
            "to_user": "admin",
            "msg_type": "dir_share",
            "msg_from": "joker",
            "content": "joker share a dir to you.",
            "timestamp": "2016-10-14T06:59:15.324865Z"
        },
        {
            "to_user": "admin",
            "msg_type": "repo_share",
            "msg_from": "joker",
            "content": "joker share a repo to you.",
            "timestamp": "2016-10-14T07:00:23.377720Z"
        }
    ]


### 删除所有通知

请求

    DELETE /v1/notifications/

状态码 204


## 共享操作
### 共享库
#### 共享库列表

请求

    GET /v1/shared-repos/

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

状态码 204


#### 共享库

请求

    POST /v1/shared-repos/

参数

    repo_id, share_type, user, group_id, permission

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

** or **

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

#### 删除共享链接

请求

    DELETE /v1/shared-links/?t=939ac61687

状态码 204
