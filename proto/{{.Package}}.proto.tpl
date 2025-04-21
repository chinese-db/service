syntax = "proto3";

package {{.Package}};
option go_package = "./;{{.Package}}";

service {{.ServiceName}} {
  rpc SayHello (HelloRequest) returns (HelloReply) {}
}

message HelloRequest {
  string name = 1;
}

message HelloReply {
  string message = 1;
}