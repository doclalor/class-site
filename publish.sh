#!/bin/bash
export PATH="/opt/homebrew/bin:$PATH"
cd ~/quartz
npx quartz build
cat > public/.htaccess << 'HTACCESS'
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME}.html -f
RewriteRule ^(.+)$ $1.html [L]
HTACCESS
rsync -avz public/ thereiti@thereitis.org:public_html/class.thereitis.org/
echo "Published to class.thereitis.org"
