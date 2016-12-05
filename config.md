
配置文件说明
===

settings.py
---

ADMIN_TOKEN_EXPIRE_TIME = 0            #管理员token过期时间

USER_TOKEN_EXPIRE_TIME = 0             # 普通用户token过期时间，0表示永不过期

USER_QUOTA = 1024*1024*1024*2          # 用户默认配额

RH_SERVER_HOST = 'localhost'           # Ruihub服务域名

RH_SERVER_PORT = '8080'                # Ruihub服务端口

RF_SERVER_HOST = 'localhost'           # 文件服务器地址

RF_SERVER_PORT = 8020                  # 文件服务器端口

RF_ROOT_PATH = '/opt/ruifile/'         # 文件服务器配置文件路径

EMAIL_*                                # 邮件发送相关配置

ccnet.conf
---


[General]

USER_NAME = ruifile                    # 文件服务器名称

NAME = ruifile                         # 文件服务器名称

SERVICE_URL = www.ruifile.com          # 文件服务器域名

[Network]

PORT = 10001

[Client]

PORT = 13418


ruifile.conf
---

[network]

port = 12001

[fileserver]

host = "0.0.0.0"              # listening ip address

port = 8082                   # port for file upload/download

max_upload_size = -1          # -1 means no limit, unit is mb

max_download_dir_size = 100   # unit is mb

[block_backend]

name = s3/fs                  # use s3 or fs use as storage

bucket =                      # bucket name when s3 or empty

key_id =                      # access_key when s3 or empty

key =                         # secret_key when s3 or empty

host =                        # ceph host when s3 or empty


[commit_object_backend]

name= s3/fs                   # use s3 or fs use as storage

bucket =                      # bucket name when s3 or empty

key_id =                      # access_key when s3 or empty

key =                         # secret_key when s3 or empty

host = localhost              # ceph host when s3 or empty

memcached_options =           # option for memcached server, such as "--SERVER=localhost"

[fs_object_backend]

name= s3/fs                   # use s3 or fs use as storage

bucket =                      # bucket name when s3 or empty

key_id =                      # access_key when s3 or empty

key =                         # secret_key when s3 or empty

host = localhost              # ceph host when s3 or empty

memcached_options =           # option for memcached server, such as "--SERVER=localhost"
