#!/bin/bash
curl https://storage.googleapis.com/script_storage/reddit.service -o /etc/systemd/system/reddit.service
systemctl daemon-reload
systemctl enable reddit.service && systemctl start reddit.service
systemctl status reddit.service
