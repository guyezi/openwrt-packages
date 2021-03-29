--[[

Copyright (C) 2021 guyezi <admin@guyezi.com>
Copyright (C) 2020 [CTCGFW] Project OpenWRT

THIS IS FREE SOFTWARE, LICENSED UNDER GPLv3

]]--

m = Map("gitea"
m.title	= translate("Gitea)
m.description = translate("Gitea is a painless self-hosted Git service. It is similar to GitHub, Bitbucket, and GitLab.Gitea is a fork of <a href="http://gogs.io">Gogs</a>. See the <a href="https://blog.gitea.io/2016/12/welcome-to-gitea/">Gitea Announcement</a>
blog post to read about the justification for a fork."))

m:section(SimpleSection).template  = "gitea/gitea_status"

s = m:section(TypedSection, "gitea")
s.addremove = false
s.anonymous = true

enable = s:option(Flag, "enabled", translate("Enable"))
enable.rmempty = false

o = s:option(ListValue, "addr_type", translate("Listening Address"))
o:value("local", translate("local"))
o:value("lan", translate("Lan"))
o:value("wan", translate("Wan"))
o.default = "lan"
o.rmempty = false

o = s:option(Value, "port", translate("Browser Management Port"))
o.placeholder = 3000
o.default     = 3000
o.datatype    = "port"
o.rmempty     = false

o = s:option(Value, "root_dir", translate("Open Directory"))
o.placeholder = "/home/git/goitea/"
o.default     = "/home/git/goitea/"
o.rmempty     = false
o.description = translate("The default value is the root directory.")

o = s:option(Value, "db_dir", translate("Database Directory"))
o.placeholder = "/home/git/goitea/data"
o.default     = "/home/git/goitea/data"
o.rmempty     = false
o.description = translate("Ordinary users are not allowed to change at will.")

o = s:option(Value, "db_name", translate("Database Name"))
o.placeholder = "gitea.db"
o.default     = "gitea.db"
o.rmempty     = false
o.description = translate("Ordinary users are not allowed to change at will.")

return m
