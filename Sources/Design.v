
Module ALU 
  (input [3:0] A, B,
   input [2:0] Op,
   output reg [3:0] Result,
   output reg CarryOut);

  always @(*) begin
    case (Op)
      3'b000: {CarryOut, Result} = A + B; // Addition
      3'b001: {CarryOut, Result} = A - B; // Subtraction
      3'b010: Result = A & B;              // AND
      3'b011: Result = A | B;              // OR
      3'b100: Result = A ^ B;              // XOR
      3'b101: Result = ~A;                 // NOT
      3'b110: Result = A << 1;            // Shift Left
      3'b111: Result = A >> 1;            // Shift Right
      default: {CarryOut, Result} = 5'b00000; // Default case
    endcase
  endmodule


Module Memory 
    (input [3:0] Address,
     input [3:0] DataIn,
     input WriteEnable,
     output reg [3:0] DataOut);

     reg [3:0] Mem [0:15]; // 16 x 4-bit memory

      always@(*) begin 
        if (WriteEnable) begin 
            Mem[Address] <= DataIn;
        end else begin 
            DataOut <= Mem[Address];
        end
      end
      
endmodule  


