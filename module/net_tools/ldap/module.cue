package ldap

hetzner_failover_ip :: {

	// Timeout to use when routing or unrouting the failover IP.
	// Note that the API call returns when the failover IP has been successfully routed to the new address, respectively successfully unrouted.

	timeout?: int

	// The new value for the failover IP address.
	// Required when setting I(state) to C(routed).

	value?: string

	// The failover IP address.

	failover_ip: string

	// Defines whether the IP will be routed or not.
	// If set to C(routed), I(value) must be specified.

	state?: string
}

ldap_entry :: {

	// If I(state=present), attributes necessary to create an entry. Existing entries are never modified. To assert specific attribute values on an existing entry, use M(ldap_attr) module instead.

	attributes?: string

	// If I(state=present), value or list of values to use when creating the entry. It can either be a string or an actual list of strings.

	objectClass?: string

	// List of options which allows to overwrite any of the task or the I(attributes) options. To remove an option, set the value of the option to C(null).

	params?: string

	// The target state of the entry.

	state?: string
}

nsupdate :: {

	// Use this TCP port when connecting to C(server).

	port?: string

	// Sets the DNS record to modify. When zone is omitted this has to be absolute (ending with a dot).

	record: string

	// Sets the record TTL.

	ttl?: string

	// Sets the record value.

	value?: string

	// Specify key algorithm used by C(key_secret).

	key_algorithm?: string

	// Use TSIG key secret, associated with C(key_name), to authenticate against C(server)

	key_secret?: string

	// Apply DNS modification on this server.

	server: string

	// Manage DNS record.

	state?: string

	// Sets the record type.

	type?: string

	// DNS record will be modified on this C(zone).
	// When omitted DNS will be queried to attempt finding the correct zone.
	// Starting with Ansible 2.7 this parameter is optional.

	zone?: string

	// Use TSIG key name to authenticate against DNS C(server)

	key_name?: string

	// Sets the transport protocol (TCP or UDP). TCP is the recommended and a more robust option.

	protocol?: string
}

omapi_host :: {

	// Sets the host lease hostname (mandatory if state=present).

	hostname?: string

	// Create or remove OMAPI host.

	state: string

	// Enable dynamic DNS updates for this host.

	ddns?: bool

	// Sets OMAPI server host to interact with.

	host?: string

	// Sets the lease host IP address.

	ip?: string

	// Sets the TSIG key content for authenticating against OMAPI server.

	key: string

	// Sets the TSIG key name for authenticating against OMAPI server.

	key_name: string

	// Sets the lease host MAC address.

	macaddr: string

	// Sets the OMAPI server port to interact with.

	port?: int

	// Attach a list of OMAPI DHCP statements with host lease (without ending semicolon).

	statements?: [..._]
}

cloudflare_dns :: {

	// Hash type number.
	// Required for C(type=DS), C(type=SSHFP) and C(type=TLSA) when C(state=present).

	hash_type?: int

	// Selector number.
	// Required for C(type=TLSA) when C(state=present).

	selector?: int

	// Whether the record should be the only one for that record type and record name.
	// Only use with C(state=present).
	// This will delete all other records with the same record name and type.

	solo?: bool

	// Algorithm number.
	// Required for C(type=DS) and C(type=SSHFP) when C(state=present).

	algorithm?: int

	// Certificate usage number.
	// Required for C(type=TLSA) when C(state=present).

	cert_usage?: int

	// Service port.
	// Required for C(type=SRV) and C(type=TLSA).

	port?: int

	// Record to add.
	// Required if C(state=present).
	// Default is C(@) (e.g. the zone name).

	record?: string

	// Record service.
	// Required for C(type=SRV)

	service?: string

	// Timeout for Cloudflare API calls.

	timeout?: int

	// The type of DNS record to create. Required if C(state=present).
	// C(type=DS), C(type=SSHFP) and C(type=TLSA) added in Ansible 2.7.

	type?: string

	// Service weight.
	// Required for C(type=SRV).

	weight?: int

	// Account API key.
	// Required for api keys authentication.
	// You can obtain your API key from the bottom of the Cloudflare 'My Account' page, found here: U(https://dash.cloudflare.com/)

	account_api_key?: string

	// Account email. Required for api keys authentication.

	account_email?: string

	// DNSSEC key tag.
	// Needed for C(type=DS) when C(state=present).

	key_tag?: int

	// Service protocol. Required for C(type=SRV) and C(type=TLSA).
	// Common values are TCP and UDP.
	// Before Ansible 2.6 only TCP and UDP were available.

	proto?: string

	// Proxy through Cloudflare network or just use DNS.

	proxied?: bool

	// The name of the Zone to work with (e.g. "example.com").
	// The Zone must already exist.

	zone: string

	// API token.
	// Required for api token authentication.
	// You can obtain your API token from the bottom of the Cloudflare 'My Account' page, found here: U(https://dash.cloudflare.com/)

	api_token?: string

	// Record priority.
	// Required for C(type=MX) and C(type=SRV)

	priority?: string

	// Whether the record(s) should exist or not.

	state?: string

	// The TTL to give the new record.
	// Must be between 120 and 2,147,483,647 seconds, or 1 for automatic.

	ttl?: int

	// The record value.
	// Required for C(state=present).

	value?: string
}

dnsimple :: {

	// Domain to work with. Can be the domain name (e.g. "mydomain.com") or the numeric ID of the domain in DNSimple.
	// If omitted, a list of domains will be returned.
	// If domain is present but the domain doesn't exist, it will be created.

	domain?: string

	// Record to add, if blank a record for the domain will be created, supports the wildcard (*).

	record?: string

	// List of records to ensure they either exist or do not exist.

	record_ids?: [..._]

	// Whether the record should be the only one for that record type and record name.
	// Only use with C(state) is set to C(present) on a record.

	solo?: bool

	// The TTL to give the new record in seconds.

	ttl?: int

	// The type of DNS record to create.

	type?: string

	// Account API token. See I(account_email) for more information.

	account_api_token?: string

	// Account email. If omitted, the environment variables C(DNSIMPLE_EMAIL) and C(DNSIMPLE_API_TOKEN) will be looked for.
	// If those aren't found, a C(.dnsimple) file will be looked for, see: U(https://github.com/mikemaccana/dnsimple-python#getting-started).

	account_email?: string

	// Record priority.

	priority?: int

	// whether the record should exist or not.

	state?: string

	// Record value.
	// Must be specified when trying to ensure a record exists.

	value?: string
}

ip_netns :: {

	// Name of the namespace

	name?: string

	// Whether the namespace should exist

	state?: string
}

ipify_facts :: {

	// URL of the ipify.org API service.
	// C(?format=json) will be appended per default.

	api_url?: string

	// HTTP connection timeout in seconds.

	timeout?: int

	// When set to C(NO), SSL certificates will not be validated.

	validate_certs?: bool
}

netcup_dns :: {

	// Record value

	value: string

	// API key for authentification, must be obtained via the netcup CCP (U(https://ccp.netcup.net))

	api_key: string

	// API password for authentification, must be obtained via the netcup CCP (https://ccp.netcup.net)

	api_password: string

	// Domainname the records should be added / removed

	domain: string

	// Whether the record should be the only one for that record type and record name. Only use with C(state=present)
	// This will delete all other records with the same record name and type.

	solo?: bool

	// Record type

	type: string

	// Netcup customer id

	customer_id: string

	// Record priority. Required for C(type=MX)

	priority?: string

	// Record to add or delete, supports wildcard (*). Default is C(@) (e.g. the zone name)

	record?: string

	// Whether the record should exist or not

	state?: string
}

dnsmadeeasy :: {

	// Quinary IP address for the failover.

	ip5?: string

	// Record name to get/create/delete/update. If record_name is not specified; all records for the domain will be returned in "result" regardless of the state argument.

	record_name?: string

	// Record type.

	record_type?: string

	// Account API Key.

	account_key: string

	// The file at the Fqdn that the monitor queries for HTTP or HTTPS.

	httpFile?: string

	// Secondary IP address for the failover.
	// Required if adding or changing the failover.

	ip2?: string

	// Number of emails sent to the contact list by the monitor.

	maxEmails: string

	// Protocol used by the monitor.

	protocol: string

	// Quaternary IP address for the failover.

	ip4?: string

	// Name or id of the contact list that the monitor will notify.
	// The default C('') means the Account Owner.

	contactList: string

	// Primary IP address for the failover.
	// Required if adding or changing the monitor or failover.

	ip1?: string

	// If C(yes), add or change the monitor.  This is applicable only for A records.

	monitor?: bool

	// If C(no), SSL certificates will not be validated. This should only be used on personally controlled sites using self-signed certificates.

	validate_certs?: bool

	// Domain to work with. Can be the domain name (e.g. "mydomain.com") or the numeric ID of the domain in DNS Made Easy (e.g. "839989") for faster resolution

	domain: string

	// The fully qualified domain name used by the monitor.

	httpFqdn?: string

	// The string in the httpFile that the monitor queries for HTTP or HTTPS.

	httpQueryString?: string

	// Tertiary IP address for the failover.

	ip3?: string

	// Port used by the monitor.

	port: string

	// Account Secret Key.

	account_secret: string

	// Decides if the sandbox API should be used. Otherwise (default) the production API of DNS Made Easy is used.

	sandbox?: bool

	// Number of checks the monitor performs before a failover occurs where Low = 8, Medium = 5,and High = 3.

	sensitivity: string

	// Description used by the monitor.

	systemDescription: string

	// If C(yes), add or change the failover.  This is applicable only for A records.

	failover?: bool

	// Record value. HTTPRED: <redirection URL>, MX: <priority> <target name>, NS: <name server>, PTR: <target name>, SRV: <priority> <weight> <port> <target name>, TXT: <text value>"

	// If record_value is not specified; no changes will be made and the record will be returned in 'result' (in other words, this module can be used to fetch a record's current id, type, and ttl)


	record_value?: string

	// whether the record should exist or not

	state: string

	// record's "Time to live".  Number of seconds the record remains cached in DNS servers.

	record_ttl?: string

	// If true, fallback to the primary IP address is manual after a failover.
	// If false, fallback to the primary IP address is automatic after a failover.

	autoFailover?: bool
}

hetzner_failover_ip_info :: {

	// The failover IP address.

	failover_ip: string
}

ldap_passwd :: {

	// The (plaintext) password to be set for I(dn).

	passwd: string
}

nmcli :: {

	// Whether the connection should start on boot.
	// Whether the connection profile can be automatically activated

	autoconnect?: bool

	// A list of up to 3 dns servers.
	// IPv6 format e.g. to add two IPv6 DNS server addresses, use C(2001:4860:4860::8888 2001:4860:4860::8844).

	dns6?: [..._]

	// The interface to bind the connection to.
	// The connection will only be applicable to this interface name.
	// A special value of C('*') can be used for interface-independent connections.
	// The ifname argument is mandatory for all connection types except bond, team, bridge and vlan.
	// This parameter defaults to C(conn_name) when left unset.

	ifname?: string

	// This is only used with VLAN - VLAN ingress priority mapping.

	ingress?: string

	// This is used with IPIP/SIT - IPIP/SIT local IP address.

	ip_tunnel_local?: string

	// This is only used with bridge - MAC address of the bridge.
	// Note this requires a recent kernel feature, originally introduced in 3.15 upstream kernel.

	mac?: string

	// Master <master (ifname, or connection UUID or conn_name) of bridge, team, bond master connection profile.

	master?: string

	// This is only used with VXLAN - VXLAN ID.

	vxlan_id?: int

	// This is only used with VXLAN - VXLAN destination IP address.

	vxlan_remote?: string

	// This is only used with bridge - [ageing-time <0-1000000>] the Ethernet MAC address aging time, in seconds.

	ageingtime?: int

	// The name used to call the connection. Pattern is <type>[-<ifname>][-<num>].

	conn_name: string

	// DHCP Client Identifier sent to the DHCP server.

	dhcp_client_id?: string

	// This is only used with VLAN - VLAN egress priority mapping.

	egress?: string

	// The IPv4 address to this interface.
	// Use the format C(192.0.2.24/24).

	ip4?: string

	// The connection MTU, e.g. 9000. This can't be applied when creating the interface and is done once the interface has been created.
	// Can be used when modifying Team, VLAN, Ethernet (Future plans to implement wifi, pppoe, infiniband)
	// This parameter defaults to C(1500) when unset.

	mtu?: int

	// This is the type of device or network connection that you wish to create or modify.
	// Type C(generic) is added in Ansible 2.5.

	type?: string

	// This is only used with bond - ARP IP target.

	arp_ip_target?: string

	// This is only used with bridge - [hello-time <1-10>] STP hello time, in seconds.

	hellotime?: int

	// This is only used with 'bridge' - sets STP priority.

	priority?: int

	// This is only used with VLAN - parent device this VLAN is on, can use ifname.

	vlandev?: string

	// A list of DNS search domains.

	dns6_search?: [..._]

	// This is used with IPIP/SIT - IPIP/SIT destination IP address.

	ip_tunnel_remote?: string

	// This is only used with bridge - [max-age <6-42>] STP maximum message age, in seconds.

	maxage?: int

	// This is the type of device or network connection that you wish to create for a bond, team or bridge.

	mode?: string

	// This is only used with 'bridge-slave' - [<0-63>] - STP priority of this slave.

	slavepriority?: int

	// Whether the device should exist or not, taking action if the state is different from what is stated.

	state: string

	// This is only used with VLAN - VLAN ID in range <0-4095>.

	vlanid?: int

	// This is only used with VXLAN - VXLAN local IP address.

	vxlan_local?: string

	// This is only used with bond - downdelay.

	downdelay?: int

	// This is only used with bridge - [forward-delay <2-30>] STP forwarding delay, in seconds.

	forwarddelay?: int

	// This is only used with bond - miimon.
	// This parameter defaults to C(100) when unset.

	miimon?: int

	// This is only used with bond - ARP interval.

	arp_interval?: int

	// A list of DNS search domains.

	dns4_search?: [..._]

	// This is only used with VLAN - flags.

	flags?: string

	// The IPv4 gateway for this interface.
	// Use the format C(192.0.2.1).

	gw4?: string

	// This is only used with 'bridge-slave' - 'hairpin mode' for the slave, which allows frames to be sent back out through the slave the frame was received on.

	hairpin?: bool

	// The IPv6 address to this interface.
	// Use the format C(abbe::cafe).

	ip6?: string

	// This is only used with 'bridge-slave' - [<1-65535>] - STP port cost for destinations via this slave.

	path_cost?: int

	// This is only used with bond and is the primary interface name (for "active-backup" mode), this is the usually the 'ifname'.

	primary?: string

	// This is only used with bond - updelay.

	updelay?: int

	// A list of up to 3 dns servers.
	// IPv4 format e.g. to add two IPv4 DNS server addresses, use C(192.0.2.53 198.51.100.53).

	dns4?: [..._]

	// The IPv6 gateway for this interface.
	// Use the format C(2001:db8::1).

	gw6?: string

	// This is used with IPIP/SIT - parent device this IPIP/SIT tunnel, can use ifname.

	ip_tunnel_dev?: string

	// This is only used with bridge and controls whether Spanning Tree Protocol (STP) is enabled for this bridge.

	stp?: bool
}

haproxy :: {

	// Wait until the server has no active connections or until the timeout determined by wait_interval and wait_retries is reached.
	// Continue only after the status changes to 'MAINT'.
	// This overrides the shutdown_sessions option.

	drain?: bool

	// Fail whenever trying to enable/disable a backend host that does not exist

	fail_on_not_found?: bool

	// Name of the backend host to change.

	host: string

	// Path to the HAProxy socket file.

	socket?: string

	// Desired state of the provided backend host.
	// Note that C(drain) state was added in version 2.4.
	// It is supported only by HAProxy version 1.5 or later,
	// When used on versions < 1.5, it will be ignored.

	state: string

	// Wait until the server reports a status of 'UP' when C(state=enabled), status of 'MAINT' when C(state=disabled) or status of 'DRAIN' when C(state=drain)

	wait?: bool

	// Name of the HAProxy backend pool.
	// If this parameter is unset, it will be auto-detected.

	backend?: string

	// When disabling a server, immediately terminate all the sessions attached to the specified server.
	// This can be used to terminate long-running sessions after a server is put into maintenance mode. Overridden by the drain option.

	shutdown_sessions?: bool

	// Number of seconds to wait between retries.

	wait_interval?: int

	// Number of times to check for status after changing the state.

	wait_retries?: int

	// The value passed in argument.
	// If the value ends with the `%` sign, then the new weight will be relative to the initially configured weight.
	// Relative weights are only permitted between 0 and 100% and absolute weights are permitted between 0 and 256.

	weight?: string
}

ipinfoio_facts :: {

	// Set http user agent

	http_agent?: string

	// HTTP connection timeout in seconds

	timeout?: string
}

ldap_attr :: {

	// The name of the attribute to modify.

	name: string

	// Additional module parameters.

	params?: {...}

	// The state of the attribute values.
	// If C(present), all given values will be added if they're missing.
	// If C(absent), all given values will be removed if present.
	// If C(exact), the set of values will be forced to exactly those provided and no others.
	// If I(state=exact) and I(value) is an empty list, all values for this attribute will be removed.

	state?: string

	// The value(s) to add or remove. This can be a string or a list of strings. The complex argument format is required in order to pass a list of strings (see examples).

	values: _
}

ldap_attrs :: {

	// The attribute(s) and value(s) to add or remove. The complex argument format is required in order to pass a list of strings (see examples).

	attributes: {...}

	// If C(yes), prepend list values with X-ORDERED index numbers in all attributes specified in the current task. This is useful mostly with I(olcAccess) attribute to easily manage LDAP Access Control Lists.

	ordered?: bool

	// The state of the attribute values. If C(present), all given attribute values will be added if they're missing. If C(absent), all given attribute values will be removed if present. If C(exact), the set of attribute values will be forced to exactly those provided and no others. If I(state=exact) and the attribute I(value) is empty, all values for this attribute will be removed.

	state?: string
}

lldp :: {
}

snmp_facts :: {

	// Set to target snmp server (normally C({{ inventory_hostname }})).

	host: string

	// SNMP Version to use, v2/v2c or v3.

	version: string

	// Authentication key.
	// Required if version is v3.

	authkey?: string

	// The SNMP community string, required if version is v2/v2c.

	community?: string

	// Hashing algorithm.
	// Required if version is v3.

	integrity?: string

	// Authentication level.
	// Required if version is v3.

	level?: string

	// Encryption algorithm.
	// Required if level is authPriv.

	privacy?: string

	// Encryption key.
	// Required if version is authPriv.

	privkey?: string

	// Username for SNMPv3.
	// Required if version is v3.

	username?: string
}