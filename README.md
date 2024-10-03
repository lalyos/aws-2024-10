

```
sudo apt-get install nginx -y

echo lunchtime for lalyos | sudo tee /var/www/html/index.html
 ```

 ## install docker

 ```
  curl -sL get.docker.com | sh
  sudo usermod -G docker ubuntu
  ```

  ## user-data

  ```
#!/bin/bash
cat >  /var/www/html/index.html <<EOF
  <body bgcolor='#09293e'>
    <h1>Lunchtime</h1>
   </body>
EOF
```

## ssh-config

add these lines to ~/.ssh/config

```
Host ec2
	Hostname 52.19.249.179
	User ubuntu
	StrictHostKeyChecking no
	UserKnownHostsFile /dev/null
    IdentityFile ~/Downloads/aws-training.pem
```


## aws cli

```
aws configure --profile training
export AWS_DEFAULT_PROFILE=training
aws ec2 describe-key-pairs
```