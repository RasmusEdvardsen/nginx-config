# nginx-with-config

## Certbot init
Run this on swarm manager machine
```
docker run --rm -p 443:443 -p 80:80 --name letsencrypt
	-v "/etc/letsencrypt:/etc/letsencrypt"
	-v "/var/lib/letsencrypt:/var/lib/letsencrypt"
	certbot/certbot certonly -n
	-m rasmus.edvardsen@hotmail.com
	-d kraeja.com -d www.kraeja.com -d portfolio.kraeja.com -d storage.kraeja.com
	--standalone --agree-tos
```

## Certbot renew
TODO:

https://finnian.io/blog/ssl-with-docker-swarm-lets-encrypt-and-nginx/

```
docker run --rm --name letsencrypt \  
    -v "/etc/letsencrypt:/etc/letsencrypt" \
    -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
    -v "/usr/share/nginx/html:/usr/share/nginx/html" \
    certbot/certbot:latest \
    renew --quiet
```

## Create service
To create the nginx service, run the following:
```
docker service create -d --name <name-of-image> --mode global --network host --mount "type=bind,source=/etc/letsencrypt,destination=/etc/letsencrypt" <name-of-image>
```
* -d runs in detached mode - we can `docker service logs <name-of-service>` to see detailed logs
* --mode global tells docker swarm to start one task, and only one, on each and every host machine
* --network host tells docker swarm to run these services on the host machine's network
* --mount specifies volume where docker initialized the credentials
* * type=bind binds the volume to the machine. Should try to avoid this in the future
