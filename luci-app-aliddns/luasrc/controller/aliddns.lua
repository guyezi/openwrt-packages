-- Licensed to the public under the Apache License 2.0.
module("luci.controller.aliddns",package.seeall)
--local fs=require"nixio.fs"
--local http = require "luci.http"
--local uci=require"luci.model.uci".cursor()

function index()
	if not nixio.fs.access("/etc/config/aliddns") and nixio.fs.access('/usr/sbin/aliddns') and nixio.fs.access('/var/log/aliddns.log') then
		return
	end
	-- 定义菜单栏的一级菜单名
	local page = entry({"admin", "ddnss"}, firstchild(), "DDNSS")
	page.order = 30
    page.dependent = false
    page.acl_depends = { "luci-app-aliddns" }
	-- 定义菜单栏的二级菜单名
	entry({"admin", "ddnss", "aliddns"}, cbi("aliddns"), _("AliDDNS"), 4)
-- entry({"admin","DDNS","aliddns"},cbi("aliddns"),_("AliDDNS"),58)
end
