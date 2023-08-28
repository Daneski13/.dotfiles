local plugin = require('distant')
plugin:setup(
	{
		network = {
			timeout = {
				max = 1000
			}
		}
	}
)
