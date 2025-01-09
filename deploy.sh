#!/bin/bash

# Configuration
DEPLOY_PATH="/home/admin/web/digitalpylot.io/public_html"
LOG_FILE="/var/log/deployments.log"

# Logging function
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

log "Starting deployment process..."

# Create necessary directories
mkdir -p "$DEPLOY_PATH"

# Install dependencies and build
log "Installing dependencies..."
npm ci

log "Building application..."
npm run build

# Copy build files
log "Copying build files..."
cp -r out/* "$DEPLOY_PATH/"

# Set correct permissions
log "Setting permissions..."
chown -R admin:admin "$DEPLOY_PATH"
chmod -R 755 "$DEPLOY_PATH"

log "Deployment completed!"