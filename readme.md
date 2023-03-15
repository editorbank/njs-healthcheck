# Health check for multiple services on Nginx JS based

Organization of verification of several microservices, for example, for a load balancer.

## Requirements

* OS Linux or Windows
* Installed Docker or Podman (selected in `project.properties`)

## Test

Run the file `start.sh` (or `start.cmd` for Windows) and you will see the following output text

```bash
...
++ curl -D- localhost:42019
HTTP/1.1 200 OK
Server: nginx/1.23.3
Date: Wed, 15 Mar 2023 21:41:40 GMT
Content-Type: text/plain; charset=utf-8
Content-Length: 279
Connection: keep-alive

{
  "status": 200,
  "substatuses": [
    {
      "uri": "/s1",
      "status": 200,
      "test_body": false
    },
    {
      "uri": "/s2",
      "status": 202,
      "test_body": true
    },
    {
      "uri": "/s3",
      "status": 200,
      "test_body": false
    }
  ]
}
```

Run the file `clean.sh` (or `clean.cmd`) for free disk space
