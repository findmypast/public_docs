plan = require('flightplan')
path = require('path')
client = require('scp2')
fs = require('fs')
args = require('yargs')
    .default('environment', 'development')
    .default('key_path', '/root/.ssh/team_city')
    .argv

# For the moment only supporting one environment per deployment server
#environment = args.environment
#workDir = "/var/releases/x_search_api/#{environment}"
#appDir = "/var/www/x_search_api/#{environment}"
#appName = "x_search_api_#{environment}"

workDir = "/var/releases/public_docs"
appDir = "/var/www/public_docs"
appName = "public_docs"

transferScp = (plan,remote,source,destination) ->
    return (done) ->
        dest = {
            host: remote.runtime.host,
            username: remote.runtime.username,
            privateKey: fs.readFileSync(args.key_path),
            path: destination
        }
        client.scp source, dest, (err) ->
            if (err)
                plan.abort('Severe turbulences over the atlantic ocean!' + err + remote.runtime.host)
            done('sent with scp2')

plan.target('integration',
    {
        host: 'fh1-xsapi01'
        username: 'root'
        privateKey: args.key_path
        pty: true
        agent: process.env.SSH_AUTH_SOCK
    }
)

plan.target('production', [
  {
        host: 'fh1-xsapi02'
        username: 'root'
        privateKey: args.key_path
        pty: true
        agent: process.env.SSH_AUTH_SOCK
  },
  {
        host: 'fh1-xsapi03'
        username: 'root'
        privateKey: args.key_path
        pty: true
        agent: process.env.SSH_AUTH_SOCK
  }
]);

plan.local ['default'], (local) ->
    local.with("cd ../public_docs/", () ->
        local.exec("mix do deps.get, compile") 
        local.exec("MIX_ENV=#{plan.runtime.target} mix phoenix.digest")
        local.exec("MIX_ENV=#{plan.runtime.target} mix release")
    )

plan.remote ['default','dev-remote'], (remote) ->
    # stop service if running
    remote.exec("if (status #{appName} | grep start); then stop #{appName}; fi;")
    remote.exec("mkdir -p #{workDir}")

    remote.waitFor(transferScp(plan, remote,'../public_docs/rel/public_docs/releases/0.0.1/*.tar.gz',"#{workDir}")) 
    remote.exec("mkdir -p #{appDir}")
    remote.exec("tar -xvf #{workDir}/*.tar.gz -C #{appDir}")
    remote.exec("start #{appName}")
