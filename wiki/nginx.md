# Nginx


## Table of Contents 

1. [Preresequites](#Prerequisites)
2. [Configuration](#Configuration)  
  a) [Static Website](#Static-Website)  
  b) [SSL Encryption](#SSL-Encryption)  
  c) [Pointing To Localhost](#Pointing-To-Localhost)  
4. [Starting Nginx](#Starting-Nginx)  


### Prerequisites

1. Install _nginx_: [Nginx - More Info](https://nginx.com/resources/wiki/start/topics/tutorials/install/)
2. Set-up a domain / subdomain (in this tutorial we will call this *example.com*) on Cloudflare: [Cloudflare - More Info](https://cloudflare.com)
3. Set-up a server: [Linode - More Info](https://linode.com)


### Configuration

#### Static Website
1. Create a directory for website / project (for example create directory */var/www/my_website*)
2. Create new configuration file _/etc/nginx/sites-available/example.com_:
```
  server {
    listen 80;
    server_name example.com;
    
    location /site {
      root /var/www/my_webiste;
      index index.html;
      try_files $uri $uri/ /index.html;
    }
  }
```


Explanation:

* The 'listen' keyword specifies which port the client is connecting to.
* The 'server_name' keyword specifies the domain name.
* The 'location' keyword specifies the url (in this case the full url is: *http://example.com/site*).
* The 'root' keyword specifies the directory of the website / project.
* The 'index' keyword specifies the first page that the user will see.


#### SSL Encryption

1. Acquire *cert.pem* and *key.pem* files from [Cloudflare](https://cloudflare.com)
2. Save above files in a directory (e.g. */var/www/my_website/sslCert*)
3. Your configuration file (*/etc/nginx/sites-available/example.com*) should look like this:
```
  server {
    listen 443 ssl;
    server_name example.com;
    
    ssl_certificate /var/www/my_website/sslCert/cert.pem;
    ssl_certificate_key /var/www/my_website/sslCert/key.pem;
    
    location /site {
      root /var/www/my_webiste;
      index index.html;
      try_files $uri $uri/ /index.html;
    }
  }
```


Explanation:

* We set 'listen' to port 443 because that is the default port for a HTTPS connection.
* The keywords 'ssl_certificate' and 'ssl_certificate_key' point to the paths of the respective files from above.
  
  
#### Pointing To Localhost

If you already have a server up (e.g. hosted on *localhost:3000*), you can point a subdomain to it by adding the following
in your configuration file (*/etc/nginx/sites-available/example.com*):
```
  server {
    listen 80;
    server_name example.com;
    
    location / {
      proxy_pass http://localhost:3000;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
    }
  }
```

**NOTE:** For convenience the example above uses a HTTP connection. To use HTTPS add the code from [SSL Encryption](#SSL-Encryption).


Explanation:

* The 'proxy_pass' keyword points the client to the local port on the server.


### Starting Nginx

1. Enable configuration: `sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/`
2. Test configuration: `sudo nginx -t`
3. Finally, restart Nginx: `sudo systemctl restart nginx`


