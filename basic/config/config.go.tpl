package config

//这里使用了Nacos,当然你也可以不使用

type Config struct {
	Nacos struct {
		Namespace string `mapstructure:"namespace"`
		Addr      string `mapstructure:"addr"`
		Port      uint64 `mapstructure:"port"`
		Dataid    string `mapstructure:"dataid"`
		Group     string `mapstructure:"group"`
	} `mapstructure:"nacos"`
}

type {{.ServiceName}} struct {
	System struct {
		Host string `json:"Host"`
		Port int    `json:"Port"`
		Name string `json:"Name"`
	} `json:"System"`
	MySQLConfig struct {
		User     string `json:"User"`
		Host     string `json:"Host"`
		Port     int    `json:"Port"`
		Password string `json:"Password"`
		Database string `json:"Database"`
	} `json:"MySQLConfig"`
	RedisConfig struct {
		Host     string `json:"Host"`
		Password string `json:"Password"`
		DB       int    `json:"DB"`
	} `json:"RedisConfig"`
}
