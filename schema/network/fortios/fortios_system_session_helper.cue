package ansible

module: fortios_system_session_helper: {
	module:            "fortios_system_session_helper"
	short_description: "Configure session helper in Fortinet's FortiOS and FortiGate."
	description: [
		"This module is able to configure a FortiGate or FortiOS (FOS) device by allowing the user to set and modify system feature and session_helper category. Examples include all parameters and values need to be adjusted to datasources before usage. Tested with FOS v6.0.5",
	]

	version_added: "2.9"
	author: [
		"Miguel Angel Munoz (@mamunozgonzalez)",
		"Nicolas Thomas (@thomnico)",
	]
	notes: [
		"Requires fortiosapi library developed by Fortinet",
		"Run as a local_action in your playbook",
	]
	requirements: [
		"fortiosapi>=0.9.8",
	]
	options: {
		host: {
			description: [
				"FortiOS or FortiGate IP address.",
			]
			type:     "str"
			required: false
		}
		username: {
			description: [
				"FortiOS or FortiGate username.",
			]
			type:     "str"
			required: false
		}
		password: {
			description: [
				"FortiOS or FortiGate password.",
			]
			type:    "str"
			default: ""
		}
		vdom: {
			description: [
				"Virtual domain, among those defined previously. A vdom is a virtual instance of the FortiGate that can be configured and used as a different unit.",
			]

			type:    "str"
			default: "root"
		}
		https: {
			description: [
				"Indicates if the requests towards FortiGate must use HTTPS protocol.",
			]
			type:    "bool"
			default: true
		}
		ssl_verify: {
			description: [
				"Ensures FortiGate certificate must be verified by a proper CA.",
			]
			type:    "bool"
			default: true
		}
		state: {
			description: [
				"Indicates whether to create or remove the object.",
			]
			type:     "str"
			required: true
			choices: [
				"present",
				"absent",
			]
		}
		system_session_helper: {
			description: [
				"Configure session helper.",
			]
			default: null
			type:    "dict"
			suboptions: {
				id: {
					description: [
						"Session helper ID.",
					]
					required: true
					type:     "int"
				}
				name: {
					description: [
						"Helper name.",
					]
					type: "str"
					choices: [
						"ftp",
						"tftp",
						"ras",
						"h323",
						"tns",
						"mms",
						"sip",
						"pptp",
						"rtsp",
						"dns-udp",
						"dns-tcp",
						"pmap",
						"rsh",
						"dcerpc",
						"mgcp",
						"gtp-c",
						"gtp-u",
						"gtp-b",
					]
				}
				port: {
					description: [
						"Protocol port.",
					]
					type: "int"
				}
				protocol: {
					description: [
						"Protocol number.",
					]
					type: "int"
				}
			}
		}
	}
}