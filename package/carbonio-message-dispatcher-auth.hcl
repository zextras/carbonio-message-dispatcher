services {
  checks = [
    {
      id       = "ready",
      http     = "http://127.78.0.10:10000/api/graphql",
      method   = "GET",
      timeout  = "1s",
      interval = "5s"
    }
  ],

  connect {
    sidecar_service {
      proxy {
        local_service_address = "127.78.0.20"
        upstreams             = [
          {
            destination_name   = "carbonio-user-management"
            local_bind_address = "127.78.0.20"
            local_bind_port    = 20000
          }
        ]
      }
    }
  }

  name = "carbonio-message-dispatcher-auth"
  port = 10000
}