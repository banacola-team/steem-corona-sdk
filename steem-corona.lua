module(..., package.seeall)

function get_config(callback)

  local params = {}

  network.request(
    "https://api.steemjs.com/get_config",
    "GET",
    callback,
    params)
end

function get_version(callback)

  local params = {}

  network.request(
    "https://api.steemjs.com/get_version",
    "GET",
    callback,
    params)
end

function get_account_count(callback)
  local params = {}

  network.request(
    "https://api.steemjs.com/get_account_count",
    "GET",
    callback,
    params)
end

function get_accounts(account_array, callback)

  local string_begin = "["
  local string_end = "]"
  local names = string_begin

  for i = 1, #account_array do
    if(i < #account_array) then
      names = names .. "%22" .. account_array[i] .. "%22" .. ","
    else
      names = names .. "%22" .. account_array[i] .. "%22"
    end
  end

  names = names .. string_end

  local params = {}

  network.request(
    "https://api.steemjs.com/get_accounts?names="..names,
    "GET",
    callback,
    params)
end
