// mspconnect.v

// Generated using ACDS version 15.0 145

`timescale 1 ps / 1 ps
module mspconnect (
		input  wire  clk_clk,                        //                        clk.clk
		input  wire  reset_reset_n,                  //                      reset.reset_n
		input  wire  rs232_0_external_interface_RXD, // rs232_0_external_interface.RXD
		output wire  rs232_0_external_interface_TXD, //                           .TXD
		input  wire  rs232_1_external_interface_RXD, // rs232_1_external_interface.RXD
		output wire  rs232_1_external_interface_TXD  //                           .TXD
	);

	wire  [31:0] master_0_master_readdata;                                // mm_interconnect_0:master_0_master_readdata -> master_0:master_readdata
	wire         master_0_master_waitrequest;                             // mm_interconnect_0:master_0_master_waitrequest -> master_0:master_waitrequest
	wire  [31:0] master_0_master_address;                                 // master_0:master_address -> mm_interconnect_0:master_0_master_address
	wire         master_0_master_read;                                    // master_0:master_read -> mm_interconnect_0:master_0_master_read
	wire   [3:0] master_0_master_byteenable;                              // master_0:master_byteenable -> mm_interconnect_0:master_0_master_byteenable
	wire         master_0_master_readdatavalid;                           // mm_interconnect_0:master_0_master_readdatavalid -> master_0:master_readdatavalid
	wire         master_0_master_write;                                   // master_0:master_write -> mm_interconnect_0:master_0_master_write
	wire  [31:0] master_0_master_writedata;                               // master_0:master_writedata -> mm_interconnect_0:master_0_master_writedata
	wire         mm_interconnect_0_rs232_0_avalon_rs232_slave_chipselect; // mm_interconnect_0:rs232_0_avalon_rs232_slave_chipselect -> rs232_0:chipselect
	wire  [31:0] mm_interconnect_0_rs232_0_avalon_rs232_slave_readdata;   // rs232_0:readdata -> mm_interconnect_0:rs232_0_avalon_rs232_slave_readdata
	wire   [0:0] mm_interconnect_0_rs232_0_avalon_rs232_slave_address;    // mm_interconnect_0:rs232_0_avalon_rs232_slave_address -> rs232_0:address
	wire         mm_interconnect_0_rs232_0_avalon_rs232_slave_read;       // mm_interconnect_0:rs232_0_avalon_rs232_slave_read -> rs232_0:read
	wire   [3:0] mm_interconnect_0_rs232_0_avalon_rs232_slave_byteenable; // mm_interconnect_0:rs232_0_avalon_rs232_slave_byteenable -> rs232_0:byteenable
	wire         mm_interconnect_0_rs232_0_avalon_rs232_slave_write;      // mm_interconnect_0:rs232_0_avalon_rs232_slave_write -> rs232_0:write
	wire  [31:0] mm_interconnect_0_rs232_0_avalon_rs232_slave_writedata;  // mm_interconnect_0:rs232_0_avalon_rs232_slave_writedata -> rs232_0:writedata
	wire         mm_interconnect_0_rs232_1_avalon_rs232_slave_chipselect; // mm_interconnect_0:rs232_1_avalon_rs232_slave_chipselect -> rs232_1:chipselect
	wire  [31:0] mm_interconnect_0_rs232_1_avalon_rs232_slave_readdata;   // rs232_1:readdata -> mm_interconnect_0:rs232_1_avalon_rs232_slave_readdata
	wire   [0:0] mm_interconnect_0_rs232_1_avalon_rs232_slave_address;    // mm_interconnect_0:rs232_1_avalon_rs232_slave_address -> rs232_1:address
	wire         mm_interconnect_0_rs232_1_avalon_rs232_slave_read;       // mm_interconnect_0:rs232_1_avalon_rs232_slave_read -> rs232_1:read
	wire   [3:0] mm_interconnect_0_rs232_1_avalon_rs232_slave_byteenable; // mm_interconnect_0:rs232_1_avalon_rs232_slave_byteenable -> rs232_1:byteenable
	wire         mm_interconnect_0_rs232_1_avalon_rs232_slave_write;      // mm_interconnect_0:rs232_1_avalon_rs232_slave_write -> rs232_1:write
	wire  [31:0] mm_interconnect_0_rs232_1_avalon_rs232_slave_writedata;  // mm_interconnect_0:rs232_1_avalon_rs232_slave_writedata -> rs232_1:writedata
	wire         rst_controller_reset_out_reset;                          // rst_controller:reset_out -> [mm_interconnect_0:master_0_clk_reset_reset_bridge_in_reset_reset, mm_interconnect_0:rs232_0_reset_reset_bridge_in_reset_reset, rs232_0:reset, rs232_1:reset]

	mspconnect_master_0 #(
		.USE_PLI     (0),
		.PLI_PORT    (50000),
		.FIFO_DEPTHS (2)
	) master_0 (
		.clk_clk              (clk_clk),                       //          clk.clk
		.clk_reset_reset      (~reset_reset_n),                //    clk_reset.reset
		.master_address       (master_0_master_address),       //       master.address
		.master_readdata      (master_0_master_readdata),      //             .readdata
		.master_read          (master_0_master_read),          //             .read
		.master_write         (master_0_master_write),         //             .write
		.master_writedata     (master_0_master_writedata),     //             .writedata
		.master_waitrequest   (master_0_master_waitrequest),   //             .waitrequest
		.master_readdatavalid (master_0_master_readdatavalid), //             .readdatavalid
		.master_byteenable    (master_0_master_byteenable),    //             .byteenable
		.master_reset_reset   ()                               // master_reset.reset
	);

	mspconnect_rs232_0 rs232_0 (
		.clk        (clk_clk),                                                 //                clk.clk
		.reset      (rst_controller_reset_out_reset),                          //              reset.reset
		.address    (mm_interconnect_0_rs232_0_avalon_rs232_slave_address),    // avalon_rs232_slave.address
		.chipselect (mm_interconnect_0_rs232_0_avalon_rs232_slave_chipselect), //                   .chipselect
		.byteenable (mm_interconnect_0_rs232_0_avalon_rs232_slave_byteenable), //                   .byteenable
		.read       (mm_interconnect_0_rs232_0_avalon_rs232_slave_read),       //                   .read
		.write      (mm_interconnect_0_rs232_0_avalon_rs232_slave_write),      //                   .write
		.writedata  (mm_interconnect_0_rs232_0_avalon_rs232_slave_writedata),  //                   .writedata
		.readdata   (mm_interconnect_0_rs232_0_avalon_rs232_slave_readdata),   //                   .readdata
		.irq        (),                                                        //          interrupt.irq
		.UART_RXD   (rs232_0_external_interface_RXD),                          // external_interface.export
		.UART_TXD   (rs232_0_external_interface_TXD)                           //                   .export
	);

	mspconnect_rs232_0 rs232_1 (
		.clk        (clk_clk),                                                 //                clk.clk
		.reset      (rst_controller_reset_out_reset),                          //              reset.reset
		.address    (mm_interconnect_0_rs232_1_avalon_rs232_slave_address),    // avalon_rs232_slave.address
		.chipselect (mm_interconnect_0_rs232_1_avalon_rs232_slave_chipselect), //                   .chipselect
		.byteenable (mm_interconnect_0_rs232_1_avalon_rs232_slave_byteenable), //                   .byteenable
		.read       (mm_interconnect_0_rs232_1_avalon_rs232_slave_read),       //                   .read
		.write      (mm_interconnect_0_rs232_1_avalon_rs232_slave_write),      //                   .write
		.writedata  (mm_interconnect_0_rs232_1_avalon_rs232_slave_writedata),  //                   .writedata
		.readdata   (mm_interconnect_0_rs232_1_avalon_rs232_slave_readdata),   //                   .readdata
		.irq        (),                                                        //          interrupt.irq
		.UART_RXD   (rs232_1_external_interface_RXD),                          // external_interface.export
		.UART_TXD   (rs232_1_external_interface_TXD)                           //                   .export
	);

	mspconnect_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                  (clk_clk),                                                 //                                clk_0_clk.clk
		.master_0_clk_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                          // master_0_clk_reset_reset_bridge_in_reset.reset
		.rs232_0_reset_reset_bridge_in_reset_reset      (rst_controller_reset_out_reset),                          //      rs232_0_reset_reset_bridge_in_reset.reset
		.master_0_master_address                        (master_0_master_address),                                 //                          master_0_master.address
		.master_0_master_waitrequest                    (master_0_master_waitrequest),                             //                                         .waitrequest
		.master_0_master_byteenable                     (master_0_master_byteenable),                              //                                         .byteenable
		.master_0_master_read                           (master_0_master_read),                                    //                                         .read
		.master_0_master_readdata                       (master_0_master_readdata),                                //                                         .readdata
		.master_0_master_readdatavalid                  (master_0_master_readdatavalid),                           //                                         .readdatavalid
		.master_0_master_write                          (master_0_master_write),                                   //                                         .write
		.master_0_master_writedata                      (master_0_master_writedata),                               //                                         .writedata
		.rs232_0_avalon_rs232_slave_address             (mm_interconnect_0_rs232_0_avalon_rs232_slave_address),    //               rs232_0_avalon_rs232_slave.address
		.rs232_0_avalon_rs232_slave_write               (mm_interconnect_0_rs232_0_avalon_rs232_slave_write),      //                                         .write
		.rs232_0_avalon_rs232_slave_read                (mm_interconnect_0_rs232_0_avalon_rs232_slave_read),       //                                         .read
		.rs232_0_avalon_rs232_slave_readdata            (mm_interconnect_0_rs232_0_avalon_rs232_slave_readdata),   //                                         .readdata
		.rs232_0_avalon_rs232_slave_writedata           (mm_interconnect_0_rs232_0_avalon_rs232_slave_writedata),  //                                         .writedata
		.rs232_0_avalon_rs232_slave_byteenable          (mm_interconnect_0_rs232_0_avalon_rs232_slave_byteenable), //                                         .byteenable
		.rs232_0_avalon_rs232_slave_chipselect          (mm_interconnect_0_rs232_0_avalon_rs232_slave_chipselect), //                                         .chipselect
		.rs232_1_avalon_rs232_slave_address             (mm_interconnect_0_rs232_1_avalon_rs232_slave_address),    //               rs232_1_avalon_rs232_slave.address
		.rs232_1_avalon_rs232_slave_write               (mm_interconnect_0_rs232_1_avalon_rs232_slave_write),      //                                         .write
		.rs232_1_avalon_rs232_slave_read                (mm_interconnect_0_rs232_1_avalon_rs232_slave_read),       //                                         .read
		.rs232_1_avalon_rs232_slave_readdata            (mm_interconnect_0_rs232_1_avalon_rs232_slave_readdata),   //                                         .readdata
		.rs232_1_avalon_rs232_slave_writedata           (mm_interconnect_0_rs232_1_avalon_rs232_slave_writedata),  //                                         .writedata
		.rs232_1_avalon_rs232_slave_byteenable          (mm_interconnect_0_rs232_1_avalon_rs232_slave_byteenable), //                                         .byteenable
		.rs232_1_avalon_rs232_slave_chipselect          (mm_interconnect_0_rs232_1_avalon_rs232_slave_chipselect)  //                                         .chipselect
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule