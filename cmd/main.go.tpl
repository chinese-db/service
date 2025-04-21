package main

import (
	"flag"
	"fmt"
	_ "github.com/chinese-db/service/basic/core"
	"go.uber.org/zap"
	"google.golang.org/grpc"
	"net"
)

var port = flag.Int("port", {{.Port}}, "The server port")

func main() {
	flag.Parse()
	lis, err := net.Listen("tcp", fmt.Sprintf(":%v", *port))
	if err != nil {
		zap.S().Error("{{.ServiceName}} - 端口监听创建失败")
	}
	s := grpc.NewServer()

	// 注册服务（根据实际生成）
	// {{.Package}}pb.Register{{.ServiceName}}Server(s, &server{})

	zap.S().Infof("{{.ServiceName}} 服务正在监听 %v", lis.Addr())
	if err = s.Serve(lis); err != nil {
		zap.S().Errorf("{{.ServiceName}} 服务启动失败: %v", err)
	}
}