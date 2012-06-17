# Mozilla User Preferences

// Start page
user_pref("browser.startup.homepage", "https://perot.me/startup");

// Proxy settings
user_pref("network.proxy.backup.socks", "localhost");
user_pref("network.proxy.backup.socks_port", 9001);
user_pref("network.proxy.backup.ssl", "localhost");
user_pref("network.proxy.backup.ssl_port", 8118);
user_pref("network.proxy.http", "localhost");
user_pref("network.proxy.http_port", 8118);
user_pref("network.proxy.share_proxy_settings", true);
user_pref("network.proxy.socks", "localhost");
user_pref("network.proxy.socks_port", 9001);
user_pref("network.proxy.ssl", "localhost");
user_pref("network.proxy.ssl_port", 8118);
user_pref("network.proxy.type", 1);

// Pipelining
user_pref("network.http.pipelining", true);
user_pref("network.http.pipelining.maxrequests", 128);
user_pref("network.http.pipelining.ssl", true);
user_pref("network.http.proxy.pipelining", true);

// Privacy
user_pref("privacy.donottrackheader.enabled", true);
user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.clearOnShutdown.sessions", false);
user_pref("privacy.cpd.offlineApps", true);
user_pref("privacy.cpd.siteSettings", true);
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("signon.rememberSignons", false);

// Mouse wheel
user_pref("general.autoScroll", true);

// Don't bug me
user_pref("general.warnOnAboutConfig", false);
user_pref("browser.rights.3.shown", true);
user_pref("browser.feeds.showFirstRunUI", false);
