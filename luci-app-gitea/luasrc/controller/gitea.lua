module("luci.controller.gitea", package.seeall)
--local fs=require"nixio.fs"
local http = require "luci.http"
local api = require "luci.model.cbi.gitea.api"
--local uci=require"luci.model.uci".cursor()

function index()
	if not nixio.fs.access("/etc/config/gitea") then
		return
	end
	entry({"admin", "services"}, firstchild(), _("gitea") , 44).dependent = false
	entry({"admin", "services, "gitea"}, cbi("gitea/settings"), _("Gitea"), 2).dependent = true
	entry({"admin", "services", "gitea", "check"}, call("action_check")).leaf = true
	entry({"admin", "services", "gitea", "download"}, call("action_download")).leaf = true
	entry({"admin", "services", "gitea", "status"}, call("act_status")).leaf = true
	entry({"admin", "services", "gitea", "get_log"}, call("get_log")).leaf = true
	entry({"admin", "services", "gitea", "clear_log"}, call("clear_log")).leaf = true
	--local page
	--page = entry({"admin", "CloudSer", "gitea"}, cbi("gitea"), _("Gitea"), 100).dependent = true
	--entry({"admin","CloudSer","gitea","status"},call("act_status")).leaf=true
end

local function http_write_json(content)
	http.prepare_content("application/json")
	http.write_json(content or {code = 1})
end

function act_status()
	local e={}
	--e.running=luci.sys.call("pgrep gitea >/dev/null")==0
	-- e.port=luci.sys.exec("uci get gitea.config.port")
	--luci.http.prepare_content("application/json")
	e.status = luci.sys.call("ps -w | grep -v grep | grep 'gitea -a' >/dev/null") == 0
	luci.http.write_json(e)
end

function action_check()
	local json = api.to_check()
	http_write_json(json)
end

function action_download()
    local json = nil
    local task = http.formvalue("task")
    if task == "extract" then
        json = api.to_extract(http.formvalue("file"))
    elseif task == "move" then
        json = api.to_move(http.formvalue("file"))
    else
        json = api.to_download(http.formvalue("url"))
    end
    http_write_json(json)
end

function get_log()
    luci.http.write(luci.sys.exec("[ -f '/var/log/gitea.log' ] && cat /var/log/gitea.log"))
end

function clear_log()
	luci.sys.call("echo '' > /var/log/gitea.log") 
end
	
