module.exports = {
  apps: [{
    name: 'digitalpylot-maintenance',
    script: 'node_modules/next/dist/bin/next',
    args: 'start',
    env: {
      PORT: 3000,
      NODE_ENV: 'production'
    }
  }]
}