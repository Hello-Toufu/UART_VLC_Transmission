                        
module MAC_SPEED_CRTL_TOP(
    
	//MCI interface
	output 				o_mci_val	,
	output 	[31:0]		o_mci_wdata	,
	output 	[3:0]		o_mci_be	,
	output 	[13:0]		o_mci_addr	,
	output				o_mci_rdwn	,
	input 				i_mci_ack	,
	input 	[31:0]		i_mci_rdata	,
	output				o_gclk_sel,

	input				i_clk,
	input				i_rst_n 

);

    wire	[13:0]		c_mac_addr			;
    wire	[31:0]      c_mac_wr_data		;
	wire	[31:0]      c_mac_rd_data		;
	wire				c_mac_rdwn			;
	wire				c_mac_done			;
	wire				c_mac_request		;
	
	wire				c_mux				;
	
    wire	[13:0]      c_phy_mac_addr			;
    wire	[31:0]      c_phy_mac_wr_data		;
	wire	[31:0]      c_phy_mac_rd_data		;
	wire				c_phy_mac_rdwn			;
	wire				c_phy_mac_done			;
	wire				c_phy_mac_request		;
		
	wire	[13:0]      c_poll_mac_addr			;
    wire	[31:0]      c_poll_mac_wr_data		;
	wire	[31:0]      c_poll_mac_rd_data		;
	wire				c_poll_mac_rdwn			;
	wire				c_poll_mac_done			;
	wire				c_poll_mac_request		;
	
    wire	[4:0]		c_phy_addr				;
	wire	[31:0]		c_phy_wr_data			;
	wire	[31:0]		c_phy_rd_data			;
	wire	 			c_phy_rdwn				;
	wire				c_phy_done				;
	wire				c_phy_request			;
	


    MAC_REG_ACCESS m_mac_reg_access(
        .o_mci_val              (o_mci_val			)
        ,.o_mci_wdata           (o_mci_wdata   		)
        ,.o_mci_be             	(o_mci_be			)
        ,.o_mci_addr            (o_mci_addr  		)
        ,.o_mci_rdwn            (o_mci_rdwn  		)
        ,.i_mci_ack             (i_mci_ack   		)
        ,.i_mci_rdata           (i_mci_rdata        )
        
		,.i_mac_addr            (c_mac_addr			)
        ,.i_mac_wr_data		    (c_mac_wr_data		)
        ,.o_mac_rd_data   		(c_mac_rd_data		)
        ,.i_mac_rdwn            (c_mac_rdwn			)
        ,.o_mac_done            (c_mac_done			)
        ,.i_mac_request     	(c_mac_request		)
        ,.i_clk     			(i_clk				)
        ,.i_rst_n             	(i_rst_n			)
    );

    PHY_REG_ACCESS m_phy_reg_access(
		.o_mac_wr_data    (c_phy_mac_wr_data	),
		.o_mac_addr       (c_phy_mac_addr		),
		.o_mac_rdwn       (c_phy_mac_rdwn		),
		.i_mac_done       (c_phy_mac_done		),
		.i_mac_rd_data    (c_phy_mac_rd_data	),
		.o_mac_request	  (c_phy_mac_request	),
		
		.i_phy_addr       (c_phy_addr			),
		.i_phy_wr_data    (c_phy_wr_data		),
		.o_phy_rd_data    (c_phy_rd_data		),
		.i_phy_rdwn       (c_phy_rdwn			),
		.o_phy_done       (c_phy_done			),
		.i_phy_request    (c_phy_request		),
		
		.i_clk            (i_clk    			),
        .i_rst_n          (i_rst_n     			)	
	
	);
	
	POLL_SPEED m_poll_speed (				

		.o_mac_wr_data    (c_poll_mac_wr_data	),
		.o_mac_addr       (c_poll_mac_addr		),
		.o_mac_rdwn       (c_poll_mac_rdwn		),
		.i_mac_done       (c_poll_mac_done		),
		.i_mac_rd_data    (c_poll_mac_rd_data	),
		.o_mac_request	  (c_poll_mac_request	),
		
		.o_mux			  (c_mux				),
		.o_speed_status	  (o_gclk_sel		),
		
		.o_phy_addr       (c_phy_addr			),
		.o_phy_wr_data    (c_phy_wr_data		),
		.i_phy_rd_data    (c_phy_rd_data		),
		.o_phy_rdwn       (c_phy_rdwn			),
		.i_phy_done       (c_phy_done			),
		.o_phy_request    (c_phy_request		),
		
		.i_clk            (i_clk    			),
        .i_rst_n          (i_rst_n     			)

    );
	
	assign c_mac_addr		= (c_mux) ? c_poll_mac_addr		:c_phy_mac_addr		;
	assign c_mac_wr_data	= (c_mux) ? c_poll_mac_wr_data	:c_phy_mac_wr_data	;
	assign c_mac_rdwn		= (c_mux) ? c_poll_mac_rdwn		:c_phy_mac_rdwn		;
	assign c_mac_request	= (c_mux) ? c_poll_mac_request	:c_phy_mac_request	;
	

	assign c_poll_mac_done		= (c_mux) ? c_mac_done 		:0	;
	assign c_poll_mac_rd_data	= (c_mux) ? c_mac_rd_data 	:0	;
	
	assign c_phy_mac_done		= (c_mux) ? 0:c_mac_done		;
	assign c_phy_mac_rd_data	= (c_mux) ? 0:c_mac_rd_data 	;
	
	

endmodule
