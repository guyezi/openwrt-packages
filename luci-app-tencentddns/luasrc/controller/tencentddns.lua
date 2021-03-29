-- Licensed to the public under the Apache License 2.0.
module("luci.controller.tencentddns",package.seeall)
--local fs=require"nixio.fs"
--local http = require "luci.http"
--local uci=require"luci.model.uci".cursor()
function index()
	if not nixio.fs.access("/etc/config/tencentddns") and nixio.fs.access('/usr/sbin/tencentddns') then
		return
	end
	-- 定义菜单栏的一级菜单名
	--local page = entry({"admin", "ddnss"}, firstchild(), "腾讯云设置")
	local page = entry({"admin", "ddnss"}, firstchild(), "DDNSS")
    page.order = 30
    page.dependent = false
    page.acl_depends = { "luci-app-tencentddns" }
    entry({"admin", "ddns", "tencentddns"},cbi("tencentddns"),_("TencentDDNS"),2)
end
