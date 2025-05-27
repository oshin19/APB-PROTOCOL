`timescale 1ns / 1ps


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.05.2025 15:58:51
// Design Name: 
// Module Name: apbtb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module apbtb;
parameter addrwidth=16;
parameter datawidth=16;
reg pclk;
reg presetn;
reg start;
reg write;
reg [addrwidth-1:0] addr;
reg [datawidth-1:0]wdata;
wire [datawidth-1:0]rdata;
wire done;

wire psel;
wire penable;
wire [addrwidth-1:0]paddr;
wire pwrite;
wire [datawidth-1:0] pwdata;
wire [datawidth-1:0] prdata;
wire pready;
wire pslverr;


  apbmaster #(addrwidth, datawidth) master_inst (
    .pclk(pclk),
    .presetn(presetn),
    .start(start),
    .write(write),
    .addr(addr),
    .done(done),
    .wdata(wdata),
    .rdata(rdata),
    .pready(pready),
    .pslverr(pslverr),
    .prdata(prdata),
    .psel(psel),
    .penable(penable),
    .paddr(paddr),
    .pwrite(pwrite),
    .pwdata(pwdata)
  );

 
  apbslave #(addrwidth, datawidth) slave_inst (
    .pclk(pclk),
    .presetn(presetn),
    .psel(psel),
    .penable(penable),
    .paddr(paddr),
    .pwrite(pwrite),
    .pwdata(pwdata),
    .prdata(prdata),
    .pready(pready),
    .pslverr(pslverr)
  );


initial begin
pclk=0;
forever #5 pclk=~pclk;
end

initial begin
pclk=0;
presetn=0;
start=0;
write=0;
addr=0;
wdata=0;

#10;
presetn=1;

#20;

addr=16'd5;
wdata=16'd1;
write=1;
start=1;
#10;start=0;
wait(done);
#20;


write=0;
start=1;
#10; start=0;
wait(done);

#20;
$finish;

end

endmodule





