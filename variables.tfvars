deployment_azure_region = "France Central"

rg_name_ntwk     = "cpw-p-ntwk-rg"
rg_name_data     = "cpw-p-data-rg"
rg_name_frontend = "cpw-p-frnt-rg"

nsg_name_asp = "cpw-p-ntwk-nsg-asp"
nsg_name_app  = "cpw-p-ntwk-nsg-app"
nsg_name_mys  = "cpw-p-ntwk-nsg-mys"
nsg_name_blob = "cpw-p-ntwk-nsg-blob"

wordpress_db_name = "wordpress"

# App Service Plan and WordPress App Service
app_service_plan_name = "cpw-p-frnt-asp"
app_service_name = "cpw-p-frnt-app"
app_service_plan_image = "mcr.microsoft.com/appsvc/wordpress-debian-php:8.3"

# MySQL Flexible Server
mysql_flexible_administrator_login    = "psqladmin"
mysql_flexible_administrator_password = "moNjBCEDA8ctwfI"

# Wordpress 
wordpress_administrator_login    = "wp-admin"
wordpress_administrator_password = "y0JjuHV4BmzEMk2"