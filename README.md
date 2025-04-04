

grafana alert notify script

based on webhook tool
https://github.com/adnanh/webhook

- webhook.sh   //service start cli
- webhook.json //service conf
- grafana_alert.sh //service callback script


## json notice

cat payload.test | jq '.alerts[0].status'

should write as 'alerts.0.status'


## reload

kill  -USR1

pkill -USR1 -ef ./webhook


