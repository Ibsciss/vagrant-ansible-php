server {
    listen  80;

    root {{ doc_root }};
    index index.html index.php;

<<<<<<< HEAD
    server_name {{ hostname }};

    location / {
        # try to serve file directly, fallback to app.php
        try_files $uri /app.php$is_args$args;
=======
    server_name {{ ansible_eth1.ipv4.address }};

    location / {
        try_files $uri $uri/ /index.php;
>>>>>>> ef2c217e5732c2ef4edb265136acca37f13bef62
    }

    error_page 404 /404.html;

    error_page 500 502 503 504 /50x.html;
        location = /50x.html {
        root /usr/share/nginx/www;
    }

<<<<<<< HEAD
    location ~ ^/(app|app_dev|config)\.php(/|$) {
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param HTTPS off;
=======
    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
>>>>>>> ef2c217e5732c2ef4edb265136acca37f13bef62
    }
}
