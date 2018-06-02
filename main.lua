local steem = require("steem-corona")
local json = require("json")

local account_array = {"steemsdk.test"}

--[[ test case: get_config --]]
---[[
steem.get_config(
  function(event)
    if event.isError then
      print( "Network error: ", event.response )
    else
      print("response: "..event.response)
    end
  end
)
--]]

--[[ test case: get_version --]]
---[[
steem.get_version(
  function(event)
    if event.isError then
      print( "Network error: ", event.response )
    else
      print("response: "..event.response)
    end
  end
)
--]]

--[[ test case: get_account_count --]]
---[[
steem.get_account_count(
  function(event)
    if event.isError then
      print( "Network error: ", event.response )
    else
      print("response: "..event.response)
    end
  end
)
--]]

--[[ test case: get_accounts --]]
---[[
steem.get_accounts(
  account_array,
  function(event)
    if event.isError then
      print( "Network error: ", event.response )
    else
      print("response: "..json.prettify(event.response))
      local decoded_response = json.decode(event.response)
      print("id: "..decoded_response[1]["id"].."\n"..
        "name: "..decoded_response[1]["name"])
    end
  end
)
--]]

--[[ test case: comment --]]
---[[
local timestamp = os.time(os.date('*t'))

steem.comment(
  "", 
  "test", 
  "steemsdk.test", 
  timestamp.."-post", 
  "test title \"helloworld\""..timestamp,
  "test body "..timestamp, 
  ""
)

--]]
