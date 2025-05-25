//class declaration
class mux_16x1_env extends uvm_env;
  //factory registration
  `uvm_component_utils(mux_16x1_env)

  mux_16x1_agent agent;
  mux_16x1_scoreboard sc;

  //constructor
  function new(string name = "mux_16x1_env", uvm_component parent);
    super.new(name, parent);
    `uvm_info("mux_16x1_env","constructor",UVM_NONE)
  endfunction: new

  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = mux_16x1_agent::type_id::create("agent", this);
    sc = mux_16x1_scoreboard::type_id::create("sc", this);
  endfunction: build_phase

  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agent.monitor.monitor_analysis_port.connect(sc.item_collected_export);
  endfunction: connect_phase
endclass
