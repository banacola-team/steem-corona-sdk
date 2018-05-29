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

function comment(parent_author, parent_permlink, author, permlink, title, body, json_metadata)

  native.showWebPopup(
    0,
    0, 
    display.contentWidth, 
    display.contentHeight,    
    "https://v2.steemconnect.com/sign/comment?"..
    "parent_author="..parent_author..
    "&parent_permlink="..parent_permlink..
    "&author="..author..
    "&permlink="..permlink..
    "&title="..title..
    "&body="..body..
    "&json_metadata="..json_metadata,
    {
      urlRequest = 
      function(event)
        local shouldLoad = true

        local url = event.url

        if url then
          print( "You are visiting: " .. event.url )
        end

        if 1 == string.find( url, "corona:close" ) then
          -- Close the web popup
          shouldLoad = false
        end

        if string.find(url, "success") then
          shouldLoad = false
        end

        if event.errorCode then
          -- Error loading page
          print( "Error: " .. tostring( event.errorMessage ) )
          shouldLoad = false
        end

        return shouldLoad
      end
    }
  )
end

