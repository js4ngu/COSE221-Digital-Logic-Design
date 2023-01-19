    case (SW)
        4'h0 :begin
            assign HEX0_D[0] = 1;
            assign HEX0_D[1] = 1;
            assign HEX0_D[2] = 1;
            assign HEX0_D[3] = 1;
            assign HEX0_D[4] = 1;
            assign HEX0_D[5] = 1;
            assign HEX0_D[6] = 1;
            assign HEX0_DP   = 0;
        end
        4'h1 : begin
            assign HEX0_D[0] = 0;
            assign HEX0_D[1] = 1;
            assign HEX0_D[2] = 1;
            assign HEX0_D[3] = 0;
            assign HEX0_D[4] = 0;
            assign HEX0_D[5] = 0;
            assign HEX0_D[6] = 0;
            assign HEX0_DP   = 0;
        end
        4'h2 : begin
            assign HEX0_D[0] = 1;
            assign HEX0_D[1] = 1;
            assign HEX0_D[2] = 0;
            assign HEX0_D[3] = 1;
            assign HEX0_D[4] = 1;
            assign HEX0_D[5] = 0;
            assign HEX0_D[6] = 1;
            assign HEX0_DP   = 0;
        end
        4'h3 : begin
            assign HEX0_D[0] = 1;
            assign HEX0_D[1] = 1;
            assign HEX0_D[2] = 1;
            assign HEX0_D[3] = 1;
            assign HEX0_D[4] = 0;
            assign HEX0_D[5] = 0;
            assign HEX0_D[6] = 1;
            assign HEX0_DP   = 0;
        end
        4'h4 : begin
            assign HEX0_D[0] = 0;
            assign HEX0_D[1] = 1;
            assign HEX0_D[2] = 1;
            assign HEX0_D[3] = 0;
            assign HEX0_D[4] = 0;
            assign HEX0_D[5] = 1;
            assign HEX0_D[6] = 1;
            assign HEX0_DP   = 0;
        end
        4'h5 : begin
            assign HEX0_D[0] = 1;
            assign HEX0_D[1] = 0;
            assign HEX0_D[2] = 1;
            assign HEX0_D[3] = 1;
            assign HEX0_D[4] = 0;
            assign HEX0_D[5] = 1;
            assign HEX0_D[6] = 1;
            assign HEX0_DP   = 0;
        end
        4'h6 : begin
            assign HEX0_D[0] = 1;
            assign HEX0_D[1] = 0;
            assign HEX0_D[2] = 1;
            assign HEX0_D[3] = 1;
            assign HEX0_D[4] = 1;
            assign HEX0_D[5] = 1;
            assign HEX0_D[6] = 1;
            assign HEX0_DP   = 0;
        end
        4'h7 : begin
            assign HEX0_D[0] = 1;
            assign HEX0_D[1] = 1;
            assign HEX0_D[2] = 1;
            assign HEX0_D[3] = 0;
            assign HEX0_D[4] = 0;
            assign HEX0_D[5] = 0;
            assign HEX0_D[6] = 0;
            assign HEX0_DP   = 0;
        end
        4'h8 : begin
            assign HEX0_D[0] = 1;
            assign HEX0_D[1] = 1;
            assign HEX0_D[2] = 1;
            assign HEX0_D[3] = 1;
            assign HEX0_D[4] = 1;
            assign HEX0_D[5] = 1;
            assign HEX0_D[6] = 1;
            assign HEX0_DP   = 0;
        end
        4'h9 : begin
            assign HEX0_D[0] = 1;
            assign HEX0_D[1] = 1;
            assign HEX0_D[2] = 1;
            assign HEX0_D[3] = 1;
            assign HEX0_D[4] = 0;
            assign HEX0_D[5] = 1;
            assign HEX0_D[6] = 1;
            assign HEX0_DP   = 0;
        end
        4'hA : begin
            assign HEX0_D[0] = 1;
            assign HEX0_D[1] = 1;
            assign HEX0_D[2] = 1;
            assign HEX0_D[3] = 0;
            assign HEX0_D[4] = 1;
            assign HEX0_D[5] = 1;
            assign HEX0_D[6] = 1;
            assign HEX0_DP   = 0;
        end
        4'hB : begin
            assign HEX0_D[0] = 0;
            assign HEX0_D[1] = 0;
            assign HEX0_D[2] = 1;
            assign HEX0_D[3] = 1;
            assign HEX0_D[4] = 1;
            assign HEX0_D[5] = 1;
            assign HEX0_D[6] = 1;
            assign HEX0_DP   = 0;
        end
        4'hC : begin
            assign HEX0_D[0] = 1;
            assign HEX0_D[1] = 0;
            assign HEX0_D[2] = 0;
            assign HEX0_D[3] = 1;
            assign HEX0_D[4] = 1;
            assign HEX0_D[5] = 1;
            assign HEX0_D[6] = 1;
            assign HEX0_DP   = 0;
        end
        4'hD : begin
            assign HEX0_D[0] = 0;
            assign HEX0_D[1] = 1;
            assign HEX0_D[2] = 1;
            assign HEX0_D[3] = 1;
            assign HEX0_D[4] = 1;
            assign HEX0_D[5] = 0;
            assign HEX0_D[6] = 1;
            assign HEX0_DP   = 0;
        end
        4'hE : begin
            assign HEX0_D[0] = 1;
            assign HEX0_D[1] = 0;
            assign HEX0_D[2] = 0;
            assign HEX0_D[3] = 1;
            assign HEX0_D[4] = 1;
            assign HEX0_D[5] = 1;
            assign HEX0_D[6] = 1;
            assign HEX0_DP   = 0;
        end
        4'hF : begin
            assign HEX0_D[0] = 1;
            assign HEX0_D[1] = 0;
            assign HEX0_D[2] = 0;
            assign HEX0_D[3] = 0;
            assign HEX0_D[4] = 1;
            assign HEX0_D[5] = 1;
            assign HEX0_D[6] = 1;
            assign HEX0_DP   = 0;
        end
    endcase