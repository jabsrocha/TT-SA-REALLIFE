gMysqlHost_Log = "localhost"
gMysqlUser_Log = "reallife"
gMysqlPass_Log = "-rl-2009-co1992we-"
gMysqlDatabase_Log = "geramy_reallife_logs"

function logs_MySQL_Startup()
	logs_handler = mysql_connect(gMysqlHost_Log, gMysqlUser_Log, gMysqlPass_Log, gMysqlDatabase_Log)
	if( not logs_handler) then
		outputDebugString("Couldn't run query: Unable to connect to the Log MySQL server!")
		outputDebugString("Please shutdown the server and start the Log MySQL server!")
	else
		mysql_query(logs_handler,"SET NAMES 'utf8'");
	end
end

function logs_MySQL_End()
	mysql_close(logs_handler)
end


function logs_MySQL_Check_Connection()
	if(logs_handler)then
	 if (mysql_ping(logs_handler) == false) then 
		 logs_MySQL_End()
		logs_MySQL_Startup()
	end
	else
	 logs_MySQL_End()
		logs_MySQL_Startup()
	end

end



addEventHandler ( "onResourceStart", getResourceRootElement(getThisResource()),logs_MySQL_Startup )
--addEventHandler ( "onResourceStop", getResourceRootElement(getThisResource()),MySQL_End)








