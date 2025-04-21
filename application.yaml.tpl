# nacos配置
#Nacos:
#  Namespace: 57df4bc5-f69b-4d39-acbb-df774e43acbc
#  Addr: 117.27.231.122
#  Port: 8848
#  Dataid: orderServer
#  Group: order

SyStem:
  Host: 127.0.0.1
  Port: {{.Port}}
  Name: {{.ServiceName}}

MySQLConfig:
  Host: #你的服务器ip
  Port: 3306 #一般为3306
  User: root #一般为root
  Password: #你的密码
  Database: #你的数据库

RedisConfig:
  Host: #你的服务器ip+通常为6379
  Password: #你的密码
  DB: 0
