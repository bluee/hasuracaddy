# Hasura with Caddy

# Deploy as Azure container
```
az container create 
   --resource-group rg-hasuracaddy 
   --name ci-hasuracaddy 
   --image mastdhi/hasuracaddy:latest 
   --dns-name-label xxxxx 
   --ports 443
   --environment-variables
    SITE_ADDRESS=xxxxx.azurecontainer.io
    HASURA_GRAPHQL_DATABASE_URL=postgres://username:password@xxxxx.postgres.database.azure.com:5432/postgres
    HASURA_GRAPHQL_ADMIN_SECRET=yoursecret
    HASURA_GRAPHQL_ENABLE_CONSOLE=true
```
