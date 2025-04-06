
grafana alert notify script

this proj based on 
- webhook: recv webhook, run callback cmd  
https://github.com/adnanh/webhook
- disk_notify: send notify (to multi-channel)    
https://github.com/yurenchen000/disk_notify

<br>

files description:
- webhook.sh   //service start cli
- webhook.json //service conf
- grafana_alert.sh //service callback script

## Usage

0. get `push_notify.sh` (and depends) scipts from disk_notify  
   get webhook binary

1. start service via run `./webhook.sh`

2. in grafana, add `contact point`  
http://localhost:7001/hooks/grafana


## Notes

### json notice

```bash
cat payload.test | jq '.alerts[0].status'
```

`.alerts[0].status` should write as `alerts.0.status` 
in webhook.json


https://github.com/adnanh/webhook/issues/726

### json reload 

```bash
kill  -USR1 PID_OF_WEBHOOK
# OR
pkill -USR1 -ef ./webhook
```

