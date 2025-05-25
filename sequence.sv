//class declaration
class mux_16x1_seq extends uvm_sequence #(mux_16x1_seq_item);
  //factory registration
  `uvm_object_utils(mux_16x1_seq);

  mux_16x1_seq_item seq_item;
  
  //constructor
  function new(string name = "mux_16x1_seq");
    super.new(name);
    `uvm_info("mux_16x1_seq","constructor",UVM_NONE)
  endfunction
  
  //task body
  task body();
    repeat(20) begin
      seq_item = mux_16x1_seq_item::type_id::create("seq_item");
      start_item(seq_item);
      seq_item.rst=0;
      for(int x=0;x<16;x++) begin
        seq_item.i[x] = $random;
      end
        seq_item.s = $random;
      finish_item(seq_item);
    end
  endtask
endclass
