module TOP(/*AUTOARG*/
	   // Outputs
	   SEG7_0, SEG7_1, SEG7_2, SEG7_3, SEG7_4, SEG7_5, SEG7_6, SEG7_7,
	   // Inputs
	   CLK1K, KEY1, KEY2, KEY3, RSTN, SW1, SW2, SW3
	   );
   input 	CLK1K;
   input 	KEY1;
   input 	KEY2;
   input 	KEY3;
   input 	RSTN;
   input 	SW1; 
   input 	SW2;
   input 	SW3;
   output [6:0] SEG7_0;
   output [6:0] SEG7_1; 
   output [6:0] SEG7_2; 
   output [6:0] SEG7_3;
   output [6:0] SEG7_4; 
   output [6:0] SEG7_5; 
   output [6:0] SEG7_6; 
   output [6:0] SEG7_7;

   // GENCLK 100Hz
   wire 	CLK100;

   // DIGITALCLOCK
   wire [5:0] 	MAIN_SEC;
   wire [5:0] 	MAIN_MIN;
   wire [4:0] 	MAIN_HOUR;
   wire [4:0] 	MAIN_DATE;

   // STOPWATCH
   wire [5:0] 	SUB_SEC;
   wire [5:0] 	SUB_MIN;
   wire [4:0] 	SUB_HOUR;
   wire [4:0] 	SUB_DATE;

   //DEBOUNCING
   wire 	KEY1_DB, KEY2_DB, KEY3_DB;

   wire [5:0] 	selected_SEC;
   wire [5:0] 	selected_MIN; 
   wire [4:0] 	selected_HOUR; 
   wire [4:0] 	selected_DATE;
   
   wire [3:0] 	seg_sec0;
   wire [2:0] 	seg_sec1;
   wire [3:0] 	seg_min0;
   wire [2:0] 	seg_min1;
   wire [3:0] 	seg_hour0;
   wire [1:0] 	seg_hour1;
   wire [3:0] 	seg_date0;
   wire [1:0] 	seg_date1;

   reg [2:0] 	SW1_shift;
   reg [2:0] 	SW2_shift;
   reg          SW3_shift;

   reg [6:0] 	global_cnt;

   wire 	SW1_DB = &SW1_shift;
   wire 	SW2_DB = &SW2_shift;
   wire 	SW3_DB = &SW3_shift;

   wire 	prev_SW2 = SW2_shift[2];

   // SW Pipelining
   always @(posedge CLK100 or negedge RSTN) begin
      if (!RSTN) begin
	 SW1_shift <= 3'd0;
	 SW2_shift <= 3'd0;
	 SW3_shift <= 1'b0;
      end
      else begin
	 SW1_shift <= {SW1_shift[1:0], SW1};
	 SW2_shift <= {SW2_shift[1:0], SW2};
	 SW3_shift <= SW3;
      end
   end

   wire tick = (!SW3_DB) ? (global_cnt >= 7'd99) : 1'b1;

   always @(posedge CLK100 or negedge RSTN) begin
      if (!RSTN)         global_cnt <= 7'd0;
      else if (tick)     global_cnt <= 7'd0;
      else               global_cnt <= global_cnt + 7'd1;
   end

   // GENCLK 100Hz
   GENCLK100 gen_clock(
		       .CLK100(CLK100), .CLK1K(CLK1K), .RSTN(RSTN));
   //SW0
   DIGITALCLOCK mainclock(
			  .SW1(SW1_DB),
			  .KEY1(KEY1_DB),
			  .KEY2(KEY2_DB),
			  .KEY3(KEY3_DB),
			  /*AUTOINST*/
			  // Inputs
			  .RSTN			(RSTN),
			  .CLK100		(CLK100),
			  .tick		(tick),
			  .SECOND (MAIN_SEC),
			  .MINUTE (MAIN_MIN),
			  .HOUR (MAIN_HOUR),
			  .DATE (MAIN_DATE));

   //SW2
   STOPWATCH stopwatch(
		       .SW2(SW2_DB),
		       .KEY3(KEY3_DB),
		       .prev_SW2(prev_SW2),
		       /*AUTOINST*/
		       // Inputs
		       .RSTN		(RSTN),
		       .CLK100		(CLK100),
		       .tick	(tick),
		       .SECOND (SUB_SEC),
		       .MINUTE (SUB_MIN),
		       .HOUR (SUB_HOUR),
		       .DATE (SUB_DATE));

   //DEBOUNCING
   DEBOUNCING db_key1 (.KEY(KEY1),.DB(KEY1_DB),
		       /*AUTOINST*/
		       // Inputs
		       .RSTN		(RSTN),
		       .CLK100		(CLK100));
   DEBOUNCING db_key2 (.KEY(KEY2),.DB(KEY2_DB),
		       /*AUTOINST*/
		       // Inputs
		       .RSTN		(RSTN),
		       .CLK100		(CLK100));
   DEBOUNCING db_key3 (.KEY(KEY3),.DB(KEY3_DB),
		       /*AUTOINST*/
		       // Inputs
		       .RSTN		(RSTN),
		       .CLK100		(CLK100));
   
   assign selected_SEC = (!SW2_DB) ? MAIN_SEC : SUB_SEC;
   assign selected_MIN = (!SW2_DB) ? MAIN_MIN : SUB_MIN;
   assign selected_HOUR = (!SW2_DB) ? MAIN_HOUR : SUB_HOUR;
   assign selected_DATE = (!SW2_DB) ? MAIN_DATE : SUB_DATE;

   BIN2BCD_SEC_MIN bcd_sec (.VALUE(selected_SEC), .TENS(seg_sec1), .UNITS(seg_sec0)); 
   BIN2BCD_SEC_MIN bcd_min (.VALUE(selected_MIN), .TENS(seg_min1), .UNITS(seg_min0));
   BIN2BCD_HOUR_DATE bcd_hour (.VALUE(selected_HOUR), .TENS(seg_hour1), .UNITS(seg_hour0));
   BIN2BCD_HOUR_DATE bcd_date (.VALUE(selected_DATE), .TENS(seg_date1), .UNITS(seg_date0));

   //7-Segment
   DECODE7SEG_4IN d0(.IN(seg_sec0),  .OUT(SEG7_0)
		     /*AUTOINST*/);
   DECODE7SEG_3IN d1(.IN(seg_sec1),  .OUT(SEG7_1)
		     /*AUTOINST*/);
   DECODE7SEG_4IN d2(.IN(seg_min0),  .OUT(SEG7_2)
		     /*AUTOINST*/);
   DECODE7SEG_3IN d3(.IN(seg_min1),  .OUT(SEG7_3)
		     /*AUTOINST*/);
   DECODE7SEG_4IN d4(.IN(seg_hour0),   .OUT(SEG7_4)
		     /*AUTOINST*/);
   DECODE7SEG_2IN d5(.IN(seg_hour1),   .OUT(SEG7_5)
		     /*AUTOINST*/);
   DECODE7SEG_4IN d6(.IN(seg_date0), .OUT(SEG7_6)
		     /*AUTOINST*/);
   DECODE7SEG_2IN d7(.IN(seg_date1), .OUT(SEG7_7)
		     /*AUTOINST*/);


endmodule
