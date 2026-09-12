hl.config({
    general = {
				gaps_in = 5,
				gaps_out = 10,
        col = {
            active_border   = "rgba(44464f77)",
            inactive_border = "rgba(1a1b2033)",
        },
    },
		decoration = {
		    rounding = 20,
		    rounding_power = 2,

		    shadow = {
			    enabled = true,
			    range = 4,
			    render_power = 3,
			    color = 0xee1a1a1a,
		    },

		    blur = {
			    enabled = true,
			    size = 3,
			    passes = 2,
			    vibrancy = 0.1696,
		    },
    },
    misc = {
        background_color = "rgba(121318FF)",
    },
})

hl.window_rule({ -- not sure how to syntax "pin 1"
    match        = { pin = 1 },
    border_color = "rgba(afc6ffAA) rgba(afc6ff77)",
})
