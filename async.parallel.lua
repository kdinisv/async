require('lanes');
local M = {};
function M:parallel(fns, cb)
	local group = lanes.group()
	while 1 do
		fn = table.remove(fns, 1)
		if not fn then break end
		lanes.prepare {group = group}(fn)()
	end
	
	local results = {}
	for lane, val in group:Receive() do
		table.insert(results, val)
	end
	cb(results)
end

function M:wait()
	return self.lane:Results();
end
return M;