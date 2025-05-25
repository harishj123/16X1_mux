//class declaration
class mux_16x1_sequencer extends uvm_sequencer #(mux_16x1_seq_item);
  //factory registration
  `uvm_component_utils(mux_16x1_sequencer)
   //handle
  mux_16x1_seq seq;
  
  //constructor
  function new(string name = "mux_16x1_sequencer", uvm_component parent);
    super.new(name, parent);
    `uvm_info("mux_16x1_sequencer","constructor",UVM_NONE)
  endfunction:new
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seq = mux_16x1_seq::type_id::create("mux_16x1_seq");
  endfunction
endclass

