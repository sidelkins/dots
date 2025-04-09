docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" | grep 8088
