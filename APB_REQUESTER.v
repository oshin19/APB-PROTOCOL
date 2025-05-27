
module apbmaster#(
parameter addrwidth=16,
parameter datawidth=16

)(
input pclk,
input presetn,
input wire start,
input wire write,
input wire [addrwidth-1:0] addr,
output reg done,
input wire [datawidth-1:0] wdata,
output reg [datawidth-1:0] rdata,

input wire pready,
input wire pslverr,
input wire [datawidth-1:0] prdata,
output reg psel,
output reg penable,
output reg [addrwidth-1:0] paddr,
output reg pwrite,
output reg [datawidth-1:0] pwdata
 );
 
 localparam idle=2'b00, setup=2'b01 , access=2'b10;
 reg [1:0] state,nextstate;
 
 
 always@(*)begin
 case(state)
 idle: nextstate<=start?setup:idle;
 setup: nextstate<=access;
 access: nextstate<=pready? start?setup:idle :access;
 default:nextstate<=idle;
 endcase
 end
 
 always @(posedge pclk)begin
 if(!presetn)
 state<=idle;
 else
 state<=nextstate;
 end
 
 always @(posedge pclk) begin
 if(!presetn)begin
 psel<=0;
 penable<=0;
 pwrite<=0;
 done<=0;
 pwdata<=0;
 rdata<=0;
 paddr<=0;
 
 end
 
 else begin
 case(state)
 idle : begin
 psel<=0;
 penable<=0;
 done<=0;
 end
 
 setup:begin
 psel<=1;
 penable<=0;
 pwrite<=write;
 pwdata<=wdata;
 paddr<=addr;
 done<=0;
 end
 
 access:begin
 penable<=1;
 if(pready)begin
 if(!write)begin
 rdata<=prdata;
 end
 done<=1;
 end
 else
 done<=0;
 end
 endcase
 end
 end
 
endmodule
