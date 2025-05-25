//class declaration
class mux_16x1_scoreboard extends uvm_scoreboard;
  //factory registration
  `uvm_component_utils(mux_16x1_scoreboard);

  uvm_analysis_imp #(mux_16x1_seq_item, mux_16x1_scoreboard) item_collected_export;

  //constructor
  function new(string name = "mux_16x1_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("score board class","constructor",UVM_NONE)
  endfunction
  
  //build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_collected_export", this);
  endfunction

  //write function
  virtual function void write(mux_16x1_seq_item res);
    if(res.rst) begin
      if(res.y!==0) begin
        $error("%0t Test Failed y=%0d",$time,res.y);
      end
      else begin
        $display("%0t Test Passed y=%0d",$time,res.y);
      end
    end
    else begin
      if(res.y !== res.i[res.s]) begin
        $error("%0t Test Failed i[s]=%0d, y=%0d",$time,res.i[res.s],res.y);
      end
      else begin
        $display("%0t Test Passed i[s]=%0d,y=%0d",$time,res.i[res.s],res.y);
      end
    end
  endfunction
endclass
