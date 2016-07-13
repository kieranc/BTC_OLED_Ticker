function init_i2c_display()
     sda = 3 -- NodeMCU D3
     scl = 4 -- NodeMCU D4
     sla = 0x3c
     i2c.setup(0, sda, scl, i2c.SLOW)
     disp = u8g.ssd1306_128x64_i2c(sla)
end

-- Change the display every 25 updates to reduce burn-in
if (counter == 25) then
    offset = -3
elseif (counter == 26) then
    offset = 3
elseif (counter == 27) then
    counter = 0
    offset = 0
end

function xbm_picture()
     disp:setFont(u8g.font_6x10)
     disp:drawStr( 5+offset, 11, "Bitcoin Price Ticker")
     disp:setFont(u8g.font_10x20)
     disp:drawStr( 29+offset, 32, "BTC/EUR")
     disp:drawStr( 29+offset, 50, rate)
     disp:setFont(u8g.font_6x10)
     disp:drawStr( 22+offset, 60, "Updated: "..hours..":"..mins.."")
     if (offset == 0) then
     disp:drawFrame(0, 0, 128, 16)
     disp:drawFrame(0, 16, 128, 48)
     end
end

function bitmap_test(delay)
      disp:firstPage()
      repeat
           xbm_picture()
      until disp:nextPage() == false
      tmr.wdclr()
end

init_i2c_display()
bitmap_test()
