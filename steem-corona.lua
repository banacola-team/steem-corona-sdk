module(..., package.seeall)

function get_config(callback)
  local params = {}
  params.body = ""
  
  network.request(
    "https://api.steemjs.com/get_config",
    "GET",
    callback,
    params)
end

function get_version(callback)
  local params = {}
  params.body = ""
  
  network.request(
    "https://api.steemjs.com/get_version",
    "GET",
    callback,
    params)
end

function get_account_count(callback)
  local params = {}
  params.body = ""
  
  network.request(
    "https://api.steemjs.com/get_account_count",
    "GET",
    callback,
    params)
end


