module fsm( 
	input start,
	input rstFSM,
	input done,
	input clk,
	output logic enableFFin, //input registers
	output logic load,		  //load upper register
	output logic enableFijo, //load lower register
	output logic shift,
	output logic rst);
	
	
	logic [1:0] state;
	
	parameter IDLE = 2'b00;
	parameter INIT = 2'b01;
	parameter ADD = 2'b10;
	parameter SHIFT = 2'b11;
	
	
	always_comb begin // FSM states in/outs
		case(state)
			IDLE: begin
				load=0;
				enableFijo=1;
				shift=0;
				rst=1;
				enableFFin=1;
			end
			INIT: begin
				load=0;
				enableFijo=1;
				shift=0;
				rst=0;
				enableFFin=0;
			end
			ADD: begin
				load=1;
				enableFijo=0;
				shift=0;
				rst=0;
				enableFFin=0;
			end
			SHIFT: begin
				load=0;	
				enableFijo=0;
				shift=1;
				rst=0;
				enableFFin=0;
			end
		endcase
		
	end
	
	always_ff @(posedge clk) begin //FSM States directions
		if (rstFSM)
			state = IDLE;
		else begin 
			if(state == IDLE) begin
				if (start)
						state = INIT;
					else 
						state = IDLE;
			end
			else if(state == INIT)
				state = ADD;
			else if (state == ADD)
				state = SHIFT;
			else if (state == SHIFT)
				if (done)
					state = IDLE;
				else 
					state = ADD;
		end
	end 
		
	endmodule
	