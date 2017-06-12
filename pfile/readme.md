因*.swagger.json文档由grpc-gateway自动生成,任何修改会被覆盖.
所以此文档作为Bug和补充说明文档.

##总体说明

1.如果http请求中path包含了某参数，body中无需再传．


##各资源说明

###Repo

#### 1.DeleteFile

删除文件url: /v1/repos/{repo}/files?path=/tmp