* Конфигурация NGINX
<pre>
<code>
server {
    server_name localhost;
    root /var/www/html/app1/dist;

    location / {
        try_files $uri /index.php$is_args$args;
    }

    location ~ ^/index.php(/|$) {
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
        fastcgi_split_path_info ^(.+.php)(/.*)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        fastcgi_param DOCUMENT_ROOT $realpath_root;
    }

    location ~ .php$ {
        return 404;
    }

    error_log /var/log/nginx/error.log;
    access_log /var/log/nginx/access.log;
}

server {
    listen 7777;
    root /var/www/html/app2;

    location /docs {
        try_files $uri /index.html$is_args$args;
    }
}
</code>
</pre>