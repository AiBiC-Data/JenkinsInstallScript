sudo apt-get update
sudo docker run -d \
    -p 9100:9100 \
    --name grafana \
    prom/node-exporter:latest
sudo docker run -d \
-p 9090:9090 \
-v /tmp/prometheus.yml:/etc/prometheus/prometheus.yml --name prometheus prom/prometheus:latest
sudo docker run -d -p 3000:3000 --name grafana grafana/grafana:latest
