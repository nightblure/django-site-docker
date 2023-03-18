upstream web {
    # container:port
    server web:8000;
}

server {

    listen 80;
    client_max_body_size 16m;

    location / {
        proxy_pass http://web;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $host;
        proxy_redirect off;
    }

    location /static/ {
        alias /app/static/;
    }

    location /media  {
        alias /app/media/;
    }

}
