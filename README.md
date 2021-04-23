car_management
===============

> 重庆大学本科毕业设计项目-车队管理系统

> 目标做一个基于web，pc作为管理端，移动设备作为用户端，普通用户为车队员工，移动端登录系统后实时通过gps上传车辆定位，管理层可实时监控各个活动车辆信息


## 安装依赖库

~~~
composer install
~~~

## 其他说明

~~~
创建数据库cm(utf8-mb4)，导入数据库cm.sql
Clone或下载本仓库zip包，配置站点和ThinkPHP伪静态
！！重要！！向数据库配置文件my.ini中[mysqld]中添加  sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES  配置，否则可能出现错误
复制.example.env到.env 修改自己的数据库配置
~~~

## 基于thinkphp6.0

请保证php版本7.1+

 **[tp6完全开发手册]** (https://www.kancloud.cn/manual/thinkphp6_0/content)
