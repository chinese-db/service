syntax = "proto3";

package {{.ServiceName}};
option go_package = "./;{{.ServiceName}}";

service {{.ServiceName}} {
  rpc SayHello (HelloRequest) returns (HelloReply) {}
}

message HelloRequest {
  string name = 1;
}

message HelloReply {
  string message = 1;
}