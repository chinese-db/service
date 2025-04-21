syntax = "proto3";

package {{.ServiceName}};
option go_package = "./";

message HelloRequest {
  string name = 1;
}

message HelloResponse {
  string message = 1;
}

service {{.ServiceName}} {
  rpc SayHello (HelloRequest) returns (HelloResponse) {}
}
