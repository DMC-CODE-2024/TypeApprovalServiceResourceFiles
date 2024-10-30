source ~/.bash_profile
commonConfigurationFile=$commonConfigurationFilePath
source $commonConfigurationFile

dbDecryptPassword=$(java -jar  ${APP_HOME}/encryption_utility/PasswordDecryptor-0.1.jar spring.datasource.password)

mysql  -h$dbIp -P$dbPort -u$dbUsername -p${dbDecryptPassword} $appdbName <<EOFMYSQL

insert into sys_param(tag, value) VALUES ('trc_nwl_typeapprove_last_run_time', '2020-01-01') ;

EOFMYSQL
