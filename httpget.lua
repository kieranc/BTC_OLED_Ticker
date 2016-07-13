http.get("http://api.coindesk.com/v1/bpi/currentprice/EUR.json", nil, function(code, data)
    if (code < 0) then
      print("HTTP request failed")
    else
      -- Decode JSON data
      t = cjson.decode(data)
      -- Extract BTC/EUR price from decoded JSON
      rate = string.format("%.3f", t["bpi"]["EUR"]["rate"]);
      -- This is a hack to get the (GMT) time from JSON and display it as CET
      pos = string.find(t["time"]["updateduk"], ':')
      hours = (string.sub(t["time"]["updateduk"], pos-2, pos-1)+1)
      mins = string.sub(t["time"]["updateduk"], pos+1, pos+2)
      counter= counter + 1;
      end
      dofile('update_display.lua')
  end)
