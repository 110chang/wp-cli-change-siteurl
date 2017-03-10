# install.sh
mkdir wp && cd wp
wp core download --locale=ja
wp core config --dbname=$DBNAME --dbuser=$DBUSER --dbpass=$DBPASS --dbhost=$DBHOST --dbprefix=$DBPREFIX
wp core install --url=$WPURL/wp --title=WP_CLI_CHANGE_SITEURL --admin_user=wordpress --admin_password=password --admin_email=$WPEMAIL
wp option update home $WPURL
cp index.php ../index.php && cd ..
sed -i "" "s|/wp-blog-header|/wp/wp-blog-header|" ./index.php
