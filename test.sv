//class declaration
class mux_16x1_test extends uvm_test;
  // Factory registration
  `uvm_component_utils(mux_16x1_test)

  mux_16x1_env env;
  mux_16x1_seq seq;

  // Constructor
  function new(string name = "mux_16x1_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info("mux_16x1_base_test", "constructor", UVM_NONE)
  endfunction : new

  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = mux_16x1_env::type_id::create("env", this);
    seq = mux_16x1_seq::type_id::create("seq", this);
  endfunction : build_phase

  // Connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction : connect_phase

  // Run phase
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    seq.start(env.agent.sequencer);
    phase.drop_objection(this);
  endtask : run_phase
endclass
