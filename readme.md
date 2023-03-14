# Health check for multiple services on Nginx JS based

Organization of verification of several microservices, for example, for a load balancer.

## Requirements

Installed Docker.

## Test

Run the file `start.sh ` and you will see the following output text

```bash
...
++ curl -D- localhost:37067
HTTP/1.1 200 OK
Server: nginx/1.23.3
Date: Tue, 14 Mar 2023 19:31:47 GMT
Content-Type: text/plain; charset=utf-8
Content-Length: 202
Connection: keep-alive

{
  "status": 200,
  "substatuses": [
    {
      "uri": "/s1",
      "status": 200
    },
    {
      "uri": "/s2",
      "status": 202
    },
    {
      "uri": "/s3",
      "status": 200
    }
  ]
}
```
