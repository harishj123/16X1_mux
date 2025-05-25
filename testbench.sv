`include "uvm_macros.svh"
import uvm_pkg::*;
//including uvm packages

`include "interface.sv"
`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module mux_16X1_tb_top();
  logic clk;
   // interface
  mux_16x1_interface vif(clk);
  
  //instantiation
  mux_16x1 dut (
    .clk(vif.clk),
    .rst(vif.rst),
    .i(vif.i),
    .s(vif.s),
    .y(vif.y)
  );
  
  //config_db
  initial begin
    uvm_config_db#(virtual mux_16x1_interface)::set(null, "uvm_test_top.env.agent.driver", "vif", vif);
    uvm_config_db#(virtual mux_16x1_interface)::set(null, "uvm_test_top.env.agent.monitor", "vif", vif);
  end
  
  //clock generation
  initial begin
    clk = 0;
    vif.i=64'b0;
    vif.s=4'b0000; 
    forever #5 clk = ~clk;
  end

  //reset generation
  initial begin
    vif.rst = 0; 
    #10 vif.rst = 1;
    #100 vif.rst = 0;
  end

  //monitor statements
  /*initial begin
    $monitor($time, " rst = %0b, clk = %0b, i = %0b, s = %0b,y=%0b", vif.rst, clk, vif.i, vif.s,vif.y);
  end*/

  //run test
  initial begin 
    run_test("mux_16x1_test");
  end
  
  //dump waveform 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,dut);
  end

endmodule
