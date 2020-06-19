# Create second_db database if it doesn't exist
CREATE DATABASE IF NOT EXISTS powerdns_admin;

# Grant all privilidges on second_db to org_user
GRANT ALL PRIVILEGES ON powerdns_admin.* TO 'pdns_admin_user' identified by 'pdns_admin_user';
