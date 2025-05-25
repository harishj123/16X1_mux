// Code your design here
module mux_16x1 (
  input logic clk,rst,
  input  logic [15:0] [31:0] i ,
  input  logic [3:0] s,
  output logic [31:0] y
);

  always @(posedge clk or negedge clk)
  begin
    if(rst)begin
    y<=4'b0000;
  end
  else begin
    if (s == 4'b0000) begin
      y = i[0];
    end
    else if (s == 4'b0001) begin
      y = i[1];
    end
    else if (s == 4'b0010) begin
     y = i[2];
    end
    else if (s == 4'b0011) begin
      y = i[3];
    end
    else if (s == 4'b0100) begin
     y = i[4];
    end
    else if (s == 4'b0101) begin
     y = i[5];
    end
    else if (s == 4'b0110) begin
      y = i[6];
    end
    else if (s == 4'b0111) begin
      y = i[7];
    end
    else if (s == 4'b1000) begin
      y = i[8];
    end
    else if (s == 4'b1001) begin
      y = i[9];
    end
    else if (s == 4'b1010) begin
     y = i[10];
    end
    else if (s == 4'b1011) begin
     y = i[11];
    end
    else if (s == 4'b1100) begin
     y = i[12];
    end
    else if (s == 4'b1101) begin
     y = i[13];
    end
    else if (s == 4'b1110) begin
     y = i[14];
    end
    else  begin
      y = i[15];
    end
  end
  end  
endmodule

