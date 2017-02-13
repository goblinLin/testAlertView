-----------------------------------------------------------------------------------------
--
-- main.lua
-- 本範例示範如何使用AlertView
-- 1.解說AlertView的外觀
-- 2.說明showAlert函式的參數
-- 3.說明按鈕呼叫機制
--
-- Author: Zack Lin
-- Time: 2015/4/16
-----------------------------------------------------------------------------------------

--=======================================================================================
--引入各種函式庫
--=======================================================================================
display.setStatusBar( display.HiddenStatusBar )

--=======================================================================================
--宣告各種變數
--=======================================================================================
_SCREEN = {
	WIDTH = display.viewableContentWidth,
	HEIGHT = display.viewableContentHeight
}
_SCREEN.CENTER = {
	X = display.contentCenterX,
	Y = display.contentCenterY
}
local alertView

local showAlert
local onComplete
local dismissAlertView
--=======================================================================================
--宣告與定義main()函式
--=======================================================================================
local main = function (  )
    showAlert()
end

--=======================================================================================
--定義其他函式
--=======================================================================================
showAlert = function (  )
    --開啟一個AlertView
	alertView = native.showAlert( "這是標題", "這是訊息", { "OK", "Learn More" }, onComplete )
	timer.performWithDelay( 10000, dismissAlertView )
end

onComplete = function ( event )
   if event.action == "clicked" then
        local i = event.index --index表示為第幾個按鈕
        if i == 1 then
            -- 不做任何事情，但仍會關閉AlertView
        elseif i == 2 then
            -- 用系統內建Application開啟網頁
            system.openURL( "http://www.gamer.com.tw" )
        end
    elseif event.action == "canceled" then
        --當cancelAlert被呼叫，將會進入此區塊
    end
end

dismissAlertView = function (  )
    --關閉某一個alertView
	native.cancelAlert( alertView )
end
--=======================================================================================
--呼叫主函式
--=======================================================================================
main()