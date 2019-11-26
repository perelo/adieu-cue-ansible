package lxca

lxca_cmms :: {

	// uuid of chassis, this is string with length greater than 16.

	chassis?: string

	// options to filter nodes information

	command_options?: string

	// uuid of device, this is string with length greater than 16.

	uuid?: string
}

lxca_nodes :: {

	// uuid of chassis, this is string with length greater than 16.

	chassis?: string

	// options to filter nodes information

	command_options?: string

	// uuid of device, this is string with length greater than 16.

	uuid?: string
}

wakeonlan :: {

	// Network broadcast address to use for broadcasting magic Wake-on-LAN packet.

	broadcast?: string

	// MAC address to send Wake-on-LAN broadcast packet for.

	mac: string

	// UDP port to use for magic Wake-on-LAN packet.

	port?: string
}