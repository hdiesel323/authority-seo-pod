set shell := ["zsh", "-cu"]

# Run pod locally with SQLite WAL engine
dev:
    npx tsx src/main.ts

# Run pod test suite
test:
    npm test

# Type check TypeScript
check:
    npx tsc --noEmit

# Scaffold a new Pod instance
scaffold name role lob:
    node bin/scaffold.js --name {{quote(name)}} --role {{quote(role)}} --lob {{quote(lob)}}

# Apply D1 schema remotely to Cloudflare
cf-schema db_name:
    source ~/.config/infisical/machine-auth.zsh && \
    export CLOUDFLARE_API_TOKEN=$(infisical secrets get CLOUDFLARE_API_TOKEN --projectId=760c17af-efc4-4d82-b9b1-8e68ec778116 --env=dev --plain) && \
    export CLOUDFLARE_ACCOUNT_ID=$(infisical secrets get CLOUDFLARE_ACCOUNT_ID --projectId=760c17af-efc4-4d82-b9b1-8e68ec778116 --env=dev --plain) && \
    wrangler d1 execute {{db_name}} --remote --file=schema.sql -y

# Deploy Pod to Cloudflare Workers Edge
cf-deploy:
    source ~/.config/infisical/machine-auth.zsh && \
    export CLOUDFLARE_API_TOKEN=$(infisical secrets get CLOUDFLARE_API_TOKEN --projectId=760c17af-efc4-4d82-b9b1-8e68ec778116 --env=dev --plain) && \
    export CLOUDFLARE_ACCOUNT_ID=$(infisical secrets get CLOUDFLARE_ACCOUNT_ID --projectId=760c17af-efc4-4d82-b9b1-8e68ec778116 --env=dev --plain) && \
    wrangler deploy
