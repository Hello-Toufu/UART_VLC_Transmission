	component manual_rst is
		port (
			source : out std_logic_vector(3 downto 0)   -- source
		);
	end component manual_rst;

	u0 : component manual_rst
		port map (
			source => CONNECTED_TO_source  -- sources.source
		);

