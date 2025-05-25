//class declaration
class mux_16x1_agent extends uvm_agent;
  //factory registration
  `uvm_component_utils(mux_16x1_agent)
   //handle
  mux_16x1_driver driver;
  mux_16x1_monitor monitor;
  mux_16x1_sequencer sequencer;

  //constructor
  function new(string name = "mux_16x1_agent", uvm_component parent);
    super.new(name, parent);
    `uvm_info("mux_16x1_agent","constructor",UVM_NONE)
  endfunction

  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (get_is_active() == UVM_ACTIVE) begin
      driver = mux_16x1_driver::type_id::create("driver", this);
      sequencer = mux_16x1_sequencer::type_id::create("sequencer", this);
    end
    monitor = mux_16x1_monitor::type_id::create("monitor", this);
  endfunction

  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (get_is_active()) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
  endfunction
endclass
