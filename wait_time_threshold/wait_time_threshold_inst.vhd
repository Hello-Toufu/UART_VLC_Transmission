	component wait_time_threshold is
		port (
			source : out std_logic_vector(7 downto 0)   -- source
		);
	end component wait_time_threshold;

	u0 : component wait_time_threshold
		port map (
			source => CONNECTED_TO_source  -- sources.source
		);

