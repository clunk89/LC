`timescale 1ns / 1ps


module division_algorithm(a, b, out);///fixing data bytes: A TECHNICAL BUG//wire, reg okay
parameter width=32;
input [width-1:0] a;
input [width-1:0] b;
output reg [7:0] out;
integer i;//
reg [width-1:0] a1,b1;
reg [width:0] p;
always @(a or b) begin
a1=a;
b1=b;
p=0;
for(i=0 ;i<width; i=i+1) begin
	p={p[width-2:0], a1[width-1]};
	
	a1[width-1:1] = a1[width-2:0]; 
	if(p>b || p==b)
	begin
		a1[0]=1;
		p=p-b1;
		end
	else
	begin
		a1[0]=0;
		end
						end 
	out =a1[7:0];
	end
	
endmodule///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module division_algorithm_2(a, b, out);///fixing data bytes: A TECHNICAL BUG//wire, reg okay
parameter width=32;
input [width-1:0] a;
input [width-1:0] b;
output reg [12:0] out;
integer i;//
reg [width-1:0] a1,b1;
reg [width:0] p;
always @(a or b) begin
a1=a;
b1=b;
p=0;
for(i=0 ;i<width; i=i+1) begin
	p={p[width-2:0], a1[width-1]};
	
	a1[width-1:1] = a1[width-2:0]; 
	if(p>b || p==b)
	begin
		a1[0]=1;
		p=p-b1;
		end
	else
	begin
		a1[0]=0;
		end
						end 
	out =a1[12:0];
	end
	
endmodule///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module seperator(in, out_2, out_1, out_0);//correct!
	input [31:0]in;
	
	output wire [3:0] out_0, out_1, out_2;
	reg [31:0]out0, out1, out2;
	
	assign out_0=out0[3:0];
	assign out_1=out1[3:0];
	assign out_2=out2[3:0];
	
	always@(in) begin
	
	if(in>200 || in==200) begin
		out2=4'b0010;
		
		 if(in-200>30 || in-200==30)
			begin
			out1=4'b0011;
			out0=in-230;
			end
		else if(in-200>20 || in-200==20)
			begin
			out1=4'b0010;
			out0=in-220;
			end
		else if(in-200>10 || in-200==10)
			begin
			out1=4'b0001;
			out0=in-210;
			end
		else
			begin
			out1=4'b0000;
			out0=in-200;
			end
		end/////////////////////////////////////////////////	
	else if(in>100 || in==100) begin
		out2=4'b0001;
		//
		if(in-100>90 || in-100==90)
			begin
			out1=4'b1001;
			out0=in-190;
			end

		else if(in-100>80 || in-100==80)
			begin
			out1=4'b1000;
			out0=in-180;
			end
		else if(in-100>70 || in-100==70)
			begin
			out1=4'b0111;
			out0=in-170;
			end
		else if(in-100>60 || in-100==60)
			begin
			out1=4'b0110;
			out0=in-160;
			end
		else if(in-100>50 || in-100==50)
			begin
			out1=4'b0101;
			out0=in-150;
			end
		else if(in-100>40 || in-100==40)
			begin
			out1=4'b0100;
			out0=in-140;
			end
		else if(in-100>30 || in-100==30)
			begin
			out1=4'b0011;
			out0=in-130;
			end
		else if(in-100>20 || in-100==20)
			begin
			out1=4'b0010;
			out0=in-120;
			end
		else if(in-100>10 || in-100==10)
			begin
			out1=4'b0001;
			out0=in-110;
			end
		else
			begin
			out1=4'b0000;
			out0=in-100;
			end
		end///////////////////////////////////////////////////////////////////////////////
	
	else begin
		out2=4'b0000;
		//
		if(in>90 || in==90)
			begin
			out1=4'b1001;
			out0=in-90;
			end

		else if(in>80 || in==80)
			begin
			out1=4'b1000;
			out0=in-80;
			end
		else if(in>70 || in==70)
			begin
			out1=4'b0111;
			out0=in-70;
			end
		else if(in>60 || in==60)
			begin
			out1=4'b0110;
			out0=in-60;
			end
		else if(in>50 || in==50)
			begin
			out1=4'b0101;
			out0=in-50;
			end
		else if(in>40 || in==40)
			begin
			out1=4'b0100;
			out0=in-40;
			end
		else if(in>30 || in==30)
			begin
			out1=4'b0011;
			out0=in-30;
			end
		else if(in>20 || in==20)
			begin
			out1=4'b0010;
			out0=in-20;
			end
		else if(in>10 || in==10)
			begin
			out1=4'b0001;
			out0=in-10;
			end
		else
			begin
			out1=4'b0000;
			out0=in;
			end
end/////////////////////////////////////////////////last else statement			
end///always block
			endmodule/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module binary27seg(in, out);////no need for test_bench, no use of clk, there were no need too!, test_bench correct+ initial value : 8'b1;
input [3:0]in;
output reg [7:0]out;
always@(in) begin
     case (in)
        4'b0000 : out = 7'h7E;
        4'b0001 : out = 7'h30;
        4'b0010 : out = 7'h6D;
        4'b0011 : out = 7'h79;
        4'b0100 : out = 7'h33;          
        4'b0101 : out = 7'h5B;
        4'b0110 : out = 7'h5F;
        4'b0111 : out = 7'h70;
        4'b1000 : out = 7'h7F;
        4'b1001 : out = 7'h7B;
        4'b1010 : out = 7'h77;
        4'b1011 : out = 7'h1F;
        4'b1100 : out = 7'h4E;
        4'b1101 : out = 7'h3D;
        4'b1110 : out = 7'h4F;
        4'b1111 : out = 7'h47;
      endcase
	  end
      endmodule//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

module clock_divider(clk, clk2, clk4, reset);//frequency 2.38 hz:clk2, 19.53Khz:clk 3, clk4 : 2.44Khz
input clk, reset;
output reg clk2, clk4;
reg [21:0] counter; 

always@(posedge clk) begin
if(reset) begin
	counter<=22'b0;	
end
else begin
	counter<=counter+22'b0000000000000000000001;
	clk2<=counter[21];				
	//clk3<=counter[8];		
	clk4<=counter[11];
end

					end
endmodule////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


module lc_final_main_block(pulse, forcedclk, reset, BPM_new, external7segpins, externalswitch, stop, control_LED, control_buzzer);
input wire forcedclk, pulse, reset;

output wire [7:0] external7segpins; 

output reg [2:0]externalswitch;
reg [1:0] externaLswitchcontrol;

reg buzzer_double_control;

wire [3:0] out2, out1, out0; 

reg [3:0] tobeconvertedin7seg;

input wire stop;

reg [12:0] inDFF0, inDFF1, inDFF2, inDFF3;
wire [12:0] outDFF0, outDFF1, outDFF2, outDFF3;

wire [31:0] someofinteriorDFFs;// 4 * average of clk pulses
//
reg [12:0] counter;//for max. 4880 pulses 
wire [12:0] counter_average;
//
wire [31:0] counter_transporter;//gets the value of counter_average then add 20'b0 to it 
//
output wire [7:0] BPM_new;
//
wire [31:0] BPM_new_big;//gets BPM then add 24'b0 to it 
//
wire clk2, clk4;
//
output reg control_LED, control_buzzer;
reg [7:0] delay_counter;
//
assign counter_transporter[12:0] = counter_average;
assign counter_transporter[31:13] = 20'b0;
//
assign BPM_new_big[7:0]=BPM_new;
assign BPM_new_big[31:8]=24'b0;
//
assign outDFF0 = inDFF0;//wire
assign outDFF1 = inDFF1;//wire
assign outDFF2 = inDFF2;//wire
assign outDFF3 = inDFF3;//wire
//
assign someofinteriorDFFs = outDFF0 + outDFF1 + outDFF2 + outDFF3;
//
//
clock_divider myclk(.clk(forcedclk), .clk2(clk2), .clk4(clk4), .reset(reset));
//
division_algorithm_2 average_beat(.a(someofinteriorDFFs), .b(4), .out(counter_average));//

division_algorithm beatPM (.a(146400),.b(counter_transporter),.out(BPM_new));//now we have beats per minute.
//
seperator big_boy (.in(BPM_new_big), .out_2(out2), .out_1(out1), .out_0(out0));////out in type of reg 
//
binary27seg B27 (tobeconvertedin7seg ,external7segpins);
//
always@(posedge pulse) begin
inDFF0<=counter;
inDFF1<=outDFF0;
inDFF2<=outDFF1;
inDFF3<=outDFF2;

end

always@(posedge clk4 or posedge pulse or posedge reset) begin
	if(reset) begin
		counter<=13'b0;
	end
	else begin
	if(pulse) begin
		counter<=13'b0;
	end
	else begin
		counter<=counter+13'b0000000000001;
	end
	end
end


always@(posedge clk2 or posedge reset) begin ///////clk2 : 2.38 Hz
	if(reset) begin
	externalswitch<=3'b0;
	tobeconvertedin7seg<=4'b0;
	externaLswitchcontrol<=2'b0;
	end 
	else begin
						
	externaLswitchcontrol<=externaLswitchcontrol+2'b01;
	
		
	case(externaLswitchcontrol)
						2'b00: begin
						externalswitch<=3'b001;
						tobeconvertedin7seg<=out0;
						end
						2'b01: begin
						externalswitch<=3'b010;
						tobeconvertedin7seg<=out1;
						end
						2'b10: begin
						externalswitch<=3'b110;
						tobeconvertedin7seg<=out2;
						end
						2'b11: begin
						externalswitch<=3'b001;
						tobeconvertedin7seg<=out0;
						end
	endcase
		end//for else 
						end//for second always 


always@(posedge stop or posedge reset) begin
	if(reset) begin
		buzzer_double_control<=1'b0;
	end
	else begin
		buzzer_double_control <= ~buzzer_double_control;
	end
	
end//always
						
always@(posedge clk4 or posedge pulse) begin
		if(pulse) begin
			control_LED<=1'b1;
																									if(!buzzer_double_control)
																									control_buzzer<=1'b1;
																									else control_buzzer<=1'b1;
																									
			delay_counter<=8'b0;
		end 
		else begin
			if(delay_counter==244) begin
				control_LED<=1'b0;
				control_buzzer<=1'b0;
				
			end
			else begin
				delay_counter<=delay_counter+8'b0000_0001;
			end 
				end 
		
end//always 
						
endmodule 


//till now: it shows BPM on sevenSEG.
//next: check correction till now+ adding an average counter+ LED + buzzer: all before 12 o'clock tomorrow+ then go and by 
//something:)) 

