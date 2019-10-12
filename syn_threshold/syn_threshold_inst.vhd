	component syn_threshold is
		port (
			source : out std_logic_vector(15 downto 0)   -- source
		);
	end component syn_threshold;

	u0 : component syn_threshold
		port map (
			source => CONNECTED_TO_source  -- sources.source
		);

