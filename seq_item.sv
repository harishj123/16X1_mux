//class declaration
class mux_16x1_seq_item extends uvm_sequence_item;
  //factory registration
  `uvm_object_utils(mux_16x1_seq_item)
  //initializing inputs
  rand logic rst;
  rand logic [15:0] [31:0] i;
  rand logic [3:0] s;
  logic [31:0] y;
  
  //constructor
  function new(string name = "mux_16x1_seq_item");
    super.new(name);
    `uvm_info("mux_16x1_seq_item","constructor",UVM_NONE)
  endfunction
endclass
