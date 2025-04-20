package main

import (
	"flag"
	"fmt"
	_ "github.com/chinese-db/service/basic/core"
	"go.uber.org/zap"
	"google.golang.org/grpc"
	"net"
)

var port = flag.Int("port", 50051, "The server port")

func main() {
	flag.Parse()
	lis, err := net.Listen("tcp", fmt.Sprintf(":%v", *port))
	if err != nil {
		zap.S().Error("端口监听创建失败")
	}
	s := grpc.NewServer()
	zap.S().Infof("server Listening at %v", lis.Addr())
	if err = s.Serve(lis); err != nil {
		zap.S().Errorf("Failed server %v", err.Error())
	}
}
