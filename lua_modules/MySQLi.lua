local mysql = require('mysql')
local MySQLi = {}
function MySQLi:Connect()
	local Settings = eq.GetSettings()
	local db = Settings["server"]["database"]["db"]
	local host = Settings["server"]["database"]["host"]
	local user = Settings["server"]["database"]["username"]
	local pass = Settings["server"]["database"]["password"]
	local port = Settings["server"]["database"]["port"]
	return mysql.connect(host,user,pass,db,'utf8',tonumber(port))
end

return MySQLi;
