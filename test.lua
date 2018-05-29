local steem = require("steem-corona-sdk.steem-corona")
local json = require("json")

steem.get_config(
  function(event)
    if event.isError then
      print( "Network error: ", event.response )
    else
      print("response: "..event.response)
    end
  end)

steem.get_version(
  function(event)
    if event.isError then
      print( "Network error: ", event.response )
    else
      print("response: "..event.response)
    end
  end)

steem.get_account_count(function(event)
    if event.isError then
      print( "Network error: ", event.response )
    else
      print("response: "..event.response)
    end
  end)