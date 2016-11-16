# async.lua
Асинхронные запросы в lua с использованием библиотеки lanes

#async.parallel
```lua
async:parallel(
    {
        function()
            Pause(1000)
            Send ('one')
        end,
        function()    
            Pause(2000)
            Send ('two')
        end
    }, 
    function(result)
        MsgBox(render(result)) -- => {[1]="one", [2]="two"}
    end
)
```