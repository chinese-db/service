package core

import (
	"encoding/json"
	"github.com/chinese-db/common-package/mysql"
	"github.com/chinese-db/common-package/nacos"
	"github.com/chinese-db/common-package/redis"
	"go.uber.org/zap"

	"github.com/chinese/service/basic/config"
)

func init() {
	ZapInit()
	NaCosInit()
	MySQLInit()
	RedisInit()
}

func ZapInit() {
	configs := zap.NewDevelopmentConfig()
	configs.OutputPaths = []string{
		"zap.log",
		"stdout",
	}
	build, _ := configs.Build()
	zap.ReplaceGlobals(build)
}

func NaCosInit() {
	initNaCos, err := nacos.InitNacos("../applicatiion.yaml")
	if err != nil {
		zap.S().Error("nacos出现错误", err.Error())
		return
	}
	err = json.Unmarshal([]byte(initNaCos), &config.OrderConfig)
	if err != nil {
		zap.S().Error("解析失败", err.Error())
		return
	}
}
func MySQLInit() {
	appConfig := config.OrderConfig.MySQLConfig
	newMysql := mysql.NewMysql(appConfig.User, appConfig.Password, appConfig.Host, appConfig.Port, appConfig.Database)
	config.DB = newMysql.MysqlINit()
}

func RedisInit() {
	redisConfig := redis.PublicRedisConfig{
		PublicRedisCli: redis.PublicRedisCli{
			Addr:     config.OrderConfig.RedisConfig.Host,
			Password: config.OrderConfig.RedisConfig.Password,
			DB:       config.OrderConfig.RedisConfig.DB,
		},
		PublicRedisClu: redis.PublicRedisClu{},
	}
	client := redis.NewRedisClient()
	manager, s := client.CreateRedisManager(redisConfig)
	config.Rdb = manager.Cli
	if s != "" {
		zap.S().Errorf("redis链接失败%s", s)
	}
}
