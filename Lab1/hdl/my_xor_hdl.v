module my_xor_hdl (
    input [1:0] BUTTON,
    output [0:0] LEDG
    );

assign LEDG[0] = BUTTON[1] ^ BUTTON[0];
endmodule 