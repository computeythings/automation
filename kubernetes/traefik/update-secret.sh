sudo certbot certonly --manual --preferred-challenges dns-01 -d *.us.gonnella.dev
sudo kubectl -n traefik-v2 create secret tls letsencrypt --cert=/etc/letsencrypt/live/us.gonnella.dev-0001/fullchain.pem --key=/etc/letsencrypt/live/us.gonnella.dev-0001/privkey.pem --dry-run=client -o yaml > ../secrets/letsencrypt.yml
kubectl delete secret -n traefik-v2 letsencrypt
kubectl -f ../secrets/letsencrypt.yml apply
