package config

import (
	"github.com/go-redis/redis/v8"
	"gorm.io/gorm"
)

var (
	DB          *gorm.DB
	Rdb         *redis.Client
	RdbClu      *redis.ClusterClient
	OrderConfig *OrderSrv
)
