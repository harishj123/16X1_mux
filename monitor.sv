//class declaration
class mux_16x1_monitor extends uvm_monitor;
  //factory registration
  `uvm_component_utils(mux_16x1_monitor)

  //virtualize interface
  virtual mux_16x1_interface vif;
  uvm_analysis_port #(mux_16x1_seq_item) monitor_analysis_port;
  mux_16x1_seq_item seq_item;
  
  //constructor
  function new(string name = "mux_16x1_monitor", uvm_component parent);
    super.new(name, parent);
    `uvm_info("mux_16x1_monitor","constructor",UVM_NONE)
  endfunction:new

  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    monitor_analysis_port = new("monitor_analysis_port", this);
    if (!uvm_config_db #(virtual mux_16x1_interface)::get(this, "", "vif", vif)) begin
      `uvm_fatal("NO_VIF", "Virtual interface not found")
    end
  endfunction:build_phase

  //run phase
  task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.clk);
      seq_item = mux_16x1_seq_item::type_id::create("seq_item");
      seq_item.rst = vif.rst;
      seq_item.i = vif.i;
      seq_item.s = vif.s;
      seq_item.y = vif.y;
      monitor_analysis_port.write(seq_item);
    end
  endtask:run_phase
endclass
