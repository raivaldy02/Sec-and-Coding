const fs = require("fs")
console.clear()
//const colors = require("colors")

const getstr = ((string, start, end, i = 0) => {
	i++
	try {
		var str = string.split(start)
		var str = str[i].split(end)
		return str[0]
	} catch (err) {
		return ''
	}
})

const DETECT_PAYLOAD = ["GET wss://", "GET ws://", "GET sni://", "GET shi://", "PUT /?", "shi://", "sni://", "wess://", "h2://", "ssl://", "CONNECT / HTTP", "ACL wss://", "BCOPY wss://", "BDELETE wss://", "BMOVE wss://", "BPROPFIND wss://", "BPROPATCH wss://", "CHECKIN wss://", "COPY wss://", "DELETE wss://", "GET wss://", "HEAD wss://", "LABEL wss://", "LOCK wss://", "MERGE wss://", "MKCOL wss://", "MOVE wss://", "NOTIFY wss://", "PATCH wss://", "POLL wss://", "PROPATCH wss://", "PROPFIND wss://", "PUT wss://", "REPORT wss://", "SEARCH wss://", "SUBSCRIBE wss://", "TRACE wss://", "UNCHECKOUT wss://", "UNLOCK wss://", "PUT https", "UNSUBSCRIBE wss://", "UPDATE wss://", "HEAD https://", "GET ssl", "HEAD /", "[crlf][crlf]", "[crlf]Host:", "HTTP/1.1[crlf]", "[crlf] HTTP/1.0", "CONNECT [host_port]", "[random=", "[rotate=", "[rotation=", "] HTTP/1.1", "] HTTP/1.0", "[crlf]Proxy-Connection", "[crlf]Connection", "User-Agent[crlf]", ": keep-alive", "@netData", "[netData]", "[crlf] [crlf]", "[protocol][crlf]"]

const DETECT_CONTASSH = [":90@", ":8880@", ":80@", ":81@", ":442@", ":443@", ":444@", ":666@", ":1194@", ":23@", ":22@", ":21@", ":2222@", ":8799@", ":8080@", ":8088@", ":143@", ":2052@", ":2082@", ".com:", ".xyz:", ".gq:", ".br:", ".mx:", ".ml:", ".net:", ".me:", ".online:", ".gl:", ".py:", ".my.id:", ".ninja:"]

const DETECT_SSH = [":90@", ":8880@", ":80@", ":81@", ":442@", ":443@", ":444@", ":666@", ":1194@", ":23@", ":22@", ":21@", ":2222@", ":8799@", ":8080@", ":8088@", ":143@", ":2052@", ":2082@", ".com:", ".xyz:", ".gq:", ".br:", ".mx:", ".ml:", ".net:", ".me:", ".online:", ".gl:", ".py:", ".my.id:", ".ninja:"]

const DETECT_V2RAY = ["'dns': {", "`inbounds`: [],", "`outbounds`: [", "streamSettings", "wsSettings", "inbounds", "balancerTag", "connIdle"]

const DETECT_DNSDOMAIN = ["200.87.100.10", "123.108.240.165", "200.204.135.200", "200.204.135.202", "208.67.222.222", "203.190.55.210", "189.40.198.92", "187.50.250.115", "1.0.0.0", "189.40.198.83", "200.173.209.218", "112.198.126.44", "112.215.198.254", "168.205.99.142"]

const DETECT_NAMESERVER = ["fr-", "entel", "ns-fr1", "-ns", "ns-", ".dns", "-dns", "dns-"]

const DETECT_PUBKEY = ["57387d", "2e5af253", "d940ef", "c05a1b1997dc", "70240c18", "8a57139133", "9d21c9d8", "b30cb7", "1555b84c1a", "17884dP"]


const DETECT_SNI = /(?:[\w-]+\.)*([\w-]{1,63})(?:\.(?:\w{3}|\w{2}))(?:$|\/)/

const DETECT_OPENVPN = ["</tls-crypt>", "-----BEGIN CERTIFICATE-----", "auth-user-pass", "BEGIN PRIVATE KEY", "BEGIN OpenVPN Static key", "dhcp-option DNS", "255.255.255.255 net_gateway", "END OpenVPN Static key"]

const DETECT_NOTES = ["<strong> <font color", "</font><font", "<small><small>", "<h1><font", "<span style", "text-align:center", "n' +", "<big><big>", "font><h6", "<br>", "<h1", "font color", "< b r > < d i v >", "f o n t   c o l o r =", "      < p   s t y l e ", "</span>", "<font color", "<small><big><small><", "<b><i>", " | | = = = ", "><b>", " < b > < f o n t   c o l o r  ", "<big><h1>", "< f o n t", "[splitConfig]true[splitConfig]", " <body   style", "< / f o n t >", "<us>"]

const SNI_BLOCK = [...DETECT_PAYLOAD, "!", ";", ":", ";", "@", ".apk", ".jar", "_"]

const CHECK = (data, arr) => {
	for (key of arr) {
		if (data.includes(key)) {
			return true;
		}
	}
	return false
}

function ValidateIPaddress(ip) {
	if (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/.test(ip)) {
		return (true)
	}
	return (false)  
}  

const getTypeEncrypt = (data) => {
	if (data.match(/[splitPsiphon][splitPsiphon]    /gi)) {
		return "hc"
	}
}

const fileDecrypt = fs.readFileSync("decrypt_1.txt", 'utf-8')
const t = getTypeEncrypt(fileDecrypt)
// console.log(fileDecrypt)

let file = fileDecrypt.split("\x00")
const config = {}

for (value of file) {
	if (CHECK(value, DETECT_PAYLOAD)) {
		if (!config.payload) config.payload = value.split("@\x00")[0]
	}
	if (value.split(":").length == 2) {
		let proxy = value.split(':')[0]
		if (ValidateIPaddress(proxy)) {
			if (!config.proxy) config.proxy = value;
		} else if (DETECT_SNI.test(proxy) && !CHECK(proxy, SNI_BLOCK) && !proxy.includes("\x07")) {
			if (!config.proxy) config.proxy = value;
		}
	}

		
	if (CHECK(value, DETECT_SSH)) {
		if (!config.ssh) {
			try {
				config.ssh = value.replace("@\\\x15p", "")
			} catch (err) {
				config.ssh = value
			}
		}
	}
	if (CHECK(value, DETECT_V2RAY)) {
		if (!config.v2ray) config.v2ray = value.split("@\x00")[0]
	}
	    if (CHECK(value, DETECT_DNSDOMAIN)) {
		if (!config.dnsdomain) config.dnsdomain = value.split("@\x00")[0]
	}
	if (CHECK(value, DETECT_CONTASSH)) {
	if (!config.contassh) config.contassh = value.split("@\x00")[0]
		}
		
	    if (CHECK(value, DETECT_NAMESERVER)) {
		if (!config.ns) config.ns = value.split("@\x00")[0]
	}
	    if (CHECK(value, DETECT_PUBKEY)) {
		if (!config.pubkey) config.pubkey = value.split("@\x00")[0]
	}
	if (CHECK(value, DETECT_NOTES)) {
  if (!config.notes) config.notes = value.split("@\x00")[0]
}
if (CHECK(value, DETECT_OPENVPN)) {
		if (!config.openvpn) config.openvpn = value.split("@\x00")[0]
	
}
	if (DETECT_SNI.test(value) && !CHECK(value, SNI_BLOCK) && !value.includes("\x00") && !value.includes("\x07")) {
		if (!config.sni) config.sni = value;
	}
}

const teste = file.slice(0, 300)

if (!config.v2ray) {

	
	const data2 = file.join("")
	
	let arr = ["'inbounds'", "trojan://", "'dns': {", "domainStrategy"]
	
	for (value of arr) {
		let v2ray = getstr(data2, value, "@")
		console.log(v2ray)
		if (v2ray && !config.v2ray) {
			config.v2ray = value + v2ray;
		}
	}
}

if (!config.payload) {
	
	const data2 = file.join("")
	
	let arr = ["GET wss://", "GET ws://", "GET sni://", "GET shi://", "PUT /?", "CONNECT / HTTP", "ACL wss://", "BCOPY wss://", "BDELETE wss://", "BMOVE wss://", "BPROPFIND wss://", "BPROPATCH wss://", "CHECKIN wss://", "COPY wss://", "DELETE wss://", "HEAD h2", "HEAD shi", "GET h2", "GET wss://", "HEAD wss://", "LABEL wss://", "LOCK wss://", "MERGE wss://", "MKCOL wss://", "MOVE wss://", "NOTIFY wss://", "PATCH wss://", "POLL wss://", "PROPATCH wss://", "PROPFIND wss://", "GET wess", "PUT wss://", "REPORT wss://", "SEARCH wss://", "SUBSCRIBE wss://", "TRACE wss://", "UNCHECKOUT wss://", "UNLOCK wss://", "UNSUBSCRIBE wss://", "UPDATE wss://", "HEAD https://", "PUT https", "GET ssl", "HEAD /", "CONNECT [host_port]", "BDELETE"]
	
	for (value of arr) {
		let payload = getstr(data2, value, "@")
		console.log(payload)
		if (payload && !config.payload) {
			config.payload = value + payload;
		}
	}
}

//console.log(JSON.stringify(teste, null, 4))

//console.log(config)


let message = ``

//const ssh = config.ssh.split('@')
//const [user, pass] = ssh[1].split(':')
//const [host, port] = ssh[0].split(':')
//message += `Conta SSH: ${host}:${port}@${user}:${pass}\n\n`
	//message += `SSH Host: ${host}\n`
	//message += `Porta: ${port}\n`
	//message += `Usuário: ${user}\n`
	//message += `Senha: ${pass}\n\n`
	message += `SSH: ${config.contassh}\n\n`
	message += `Payload: ${config.payload}\n\n`
	message += `Proxy: ${config.proxy}\n\n`
	message += `SNI: ${config.sni}\n\n`
	message += `SlowDNS Domain: ${config.dnsdomain}\n`
	message += `SlowDNS Nameserver: ${config.ns}\n`
	message += `SlowDNS Public Key: ${config.pubkey}\n\n`
	message += `OpenVPN: \n\n${config.openvpn}\n\n`
	message += `v2ray: \n\n${config.v2ray}\n\n`
	message += `Notes: \n\n${config.notes}\n\n`

//fs.writeFileSync("/sdcard/VMoutput/hc.txt", JSON.stringify(message))
fs.writeFileSync("hc.txt", message)

console.clear()
//console.log(colors.brightGreen("\nHTTP Custom"))
//console.log(colors.brightCyan("aberto\n"))
console.log(message)