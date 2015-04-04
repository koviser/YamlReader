class KeyAbsentError<StandardError	
		attr_reader :marsh, :key
		def initialize(marsh, key)
			super()
			@marsh = marsh
			@key = key
		end

		def message
			"No method: #{self.key} for: #{self.marsh}"
		end
	end