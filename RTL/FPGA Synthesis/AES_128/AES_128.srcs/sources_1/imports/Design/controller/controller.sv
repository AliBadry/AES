module controller #(
    parameter RC_WIDTH = 10
) (
    input logic clk, rst_n,
    input logic start_operation,
    output logic key_MUX1, key_MUX2,
    output logic rounds_MUX1, rounds_MUX2,
    output logic FF_key_enable, FF_round_enable,
    output logic [$clog2(RC_WIDTH)-1:0] RC_sig,
    output logic data_valid
);
typedef enum logic[3:0] {IDLE, ZERO, ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT,  NINE, TEN, ELEVEN} states;

states current_state, next_state;
logic [1:0] counter_comb, counter_seq;

always_ff @( posedge clk, negedge rst_n ) begin
    if(!rst_n) begin
        current_state<= IDLE;
        counter_seq <= 2'b0;
    end
    else begin
        current_state <= next_state;
        counter_seq <= counter_comb;
    end
end

always_comb begin 
    key_MUX1 = 1'b0;
    key_MUX2 = 1'b0;
    rounds_MUX1 = 1'b0;
    rounds_MUX2 = 1'b0;
    FF_key_enable = 1'b1;
    FF_round_enable = 1'b0;
    RC_sig = 'b0;
    data_valid = 1'b0;
    next_state = IDLE;
    counter_comb = counter_seq;

    case (current_state)
        IDLE: begin
            key_MUX1 = 1'b0;
            key_MUX2 = 1'b0;
            rounds_MUX1 = 1'b0;
            rounds_MUX2 = 1'b0;
            FF_key_enable = 1'b1;
            FF_round_enable = 1'b0;
            RC_sig = 'b0;
            data_valid = 1'b0;

            //-------condition to start the fsm operation------------//
            if(start_operation) begin
                next_state = ZERO;
            end
            else begin
                next_state = IDLE;
            end
        end 

        ZERO: begin
            key_MUX1 = 1'b1;
            key_MUX2 = 1'b1;
            rounds_MUX1 = 1'b0;
            rounds_MUX2 = 1'b0;
            FF_round_enable = 1'b0;
            FF_key_enable = 1'b1;
            RC_sig = 'b0;
            data_valid = 1'b0;
            counter_comb = 2'b0;
            next_state = ONE;
        end

        ONE: begin
            key_MUX1 = 1'b1;
            key_MUX2 = 1'b1;
            rounds_MUX1 = 1'b1;
            rounds_MUX2 = 1'b0;
            FF_round_enable = 1'b0;
            RC_sig = 'h1;
            data_valid = 1'b0;
            if(counter_seq == 'h1) begin
                next_state = TWO;
                counter_comb = 2'b0;
                FF_key_enable = 1'b1;
            end
            /*else if (counter_seq=='h1) begin
                next_state = ONE;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b1;
            end*/
            else begin
                next_state = ONE;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b0;
            end
        end

        TWO: begin
            key_MUX1 = 1'b1;
            key_MUX2 = 1'b1;
            rounds_MUX1 = 1'b1;
            rounds_MUX2 = 1'b0;
            FF_round_enable = 1'b0;
            RC_sig = 'h2;
            data_valid = 1'b0;
            if(counter_seq == 'h1) begin
                next_state = THREE;
                counter_comb = 2'b0;
                FF_key_enable = 1'b1;
            end
            /*else if (counter_seq=='h1) begin
                next_state = TWO;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b1;
            end*/
            else begin
                next_state = TWO;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b0;
            end
        end

        THREE: begin
            key_MUX1 = 1'b1;
            key_MUX2 = 1'b1;
            rounds_MUX1 = 1'b1;
            rounds_MUX2 = 1'b0;
            FF_round_enable = 1'b0;
            RC_sig = 'h3;
            data_valid = 1'b0;

            if(counter_seq == 'h1) begin
                next_state = FOUR;
                counter_comb = 2'b0;
                FF_key_enable = 1'b1;
            end
            /*else if (counter_seq=='h1) begin
                next_state = THREE;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b1;
            end*/
            else begin
                next_state = THREE;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b0;
            end
        end

        FOUR: begin
            key_MUX1 = 1'b1;
            key_MUX2 = 1'b1;
            rounds_MUX1 = 1'b1;
            rounds_MUX2 = 1'b0;
            FF_round_enable = 1'b0;
            RC_sig = 'h4;
            data_valid = 1'b0;
            if(counter_seq == 'h1) begin
                next_state = FIVE;
                counter_comb = 2'b0;
                FF_key_enable = 1'b1;
            end
            /*else if (counter_seq=='h1) begin
                next_state = FOUR;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b1;
            end*/
            else begin
                next_state = FOUR;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b0;
            end
        end

        FIVE: begin
            key_MUX1 = 1'b1;
            key_MUX2 = 1'b1;
            rounds_MUX1 = 1'b1;
            rounds_MUX2 = 1'b0;
            FF_round_enable = 1'b0;
            RC_sig = 'h5;
            data_valid = 1'b0;
            if(counter_seq == 'h1) begin
                next_state = SIX;
                counter_comb = 2'b0;
                FF_key_enable = 1'b1;
            end
            /*else if (counter_seq=='h1) begin
                next_state = FIVE;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b1;
            end*/
            else begin
                next_state = FIVE;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b0;
            end
        end

        SIX: begin
            key_MUX1 = 1'b1;
            key_MUX2 = 1'b1;
            rounds_MUX1 = 1'b1;
            rounds_MUX2 = 1'b0;
            FF_round_enable = 1'b0;
            RC_sig = 'h6;
            data_valid = 1'b0;
            if(counter_seq == 'h1) begin
                next_state = SEVEN;
                counter_comb = 2'b0;
                FF_key_enable = 1'b1;
            end
            /*else if (counter_seq=='h1) begin
                next_state = SIX;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b1;
            end*/
            else begin
                next_state = SIX;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b0;
            end
        end

        SEVEN: begin
            key_MUX1 = 1'b1;
            key_MUX2 = 1'b1;
            rounds_MUX1 = 1'b1;
            rounds_MUX2 = 1'b0;
            FF_round_enable = 1'b0;
            RC_sig = 'h7;
            data_valid = 1'b0;
            if(counter_seq == 'h1) begin
                next_state = EIGHT;
                counter_comb = 2'b0;
                FF_key_enable = 1'b1;
            end
            /*else if (counter_seq=='h1) begin
                next_state = SEVEN;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b1;
            end*/
            else begin
                next_state = SEVEN;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b0;
            end
        end

        EIGHT: begin
            key_MUX1 = 1'b1;
            key_MUX2 = 1'b1;
            rounds_MUX1 = 1'b1;
            rounds_MUX2 = 1'b0;
            FF_round_enable = 1'b0;
            RC_sig = 'h8;
            data_valid = 1'b0;
            if(counter_seq == 'h1) begin
                next_state = NINE;
                counter_comb = 2'b0;
                FF_key_enable = 1'b1;
            end
            /*else if (counter_seq=='h1) begin
                next_state = EIGHT;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b1;
            end*/
            else begin
                next_state = EIGHT;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b0;
            end
        end

        NINE: begin
            key_MUX1 = 1'b1;
            key_MUX2 = 1'b1;
            rounds_MUX1 = 1'b1;
            rounds_MUX2 = 1'b0;
            FF_round_enable = 1'b0;
            RC_sig = 'h9;
            data_valid = 1'b0;
            if(counter_seq == 'h1) begin
                next_state = TEN;
                counter_comb = 2'b0;
                FF_key_enable = 1'b1;
            end
            /*else if (counter_seq=='h1) begin
                next_state = NINE;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b1;
            end*/
            else begin
                next_state = NINE;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b0;
            end
        end

        TEN: begin
            key_MUX1 = 1'b1;
            key_MUX2 = 1'b1;
            rounds_MUX1 = 1'b1;
            
            FF_round_enable = 1'b1;
            RC_sig = 'h0;
            data_valid = 1'b0;
            if(counter_seq == 'h1) begin
                next_state = ELEVEN;
                counter_comb = 2'b0;
                rounds_MUX2 = 1'b1;
                FF_key_enable = 1'b1;
            end
            /*else if (counter_seq=='h1) begin
                next_state = TEN;
                counter_comb = counter_seq +1'b1;
                FF_key_enable = 1'b0;
            end*/
            else begin
                next_state = TEN;
                counter_comb = counter_seq +1'b1;
                rounds_MUX2 = 1'b0;
                FF_key_enable = 1'b0;
            end
        end

        ELEVEN: begin
            key_MUX1 = 1'b0;
            key_MUX2 = 1'b0;
            rounds_MUX1 = 1'b0;
            rounds_MUX2 = 1'b0;
            FF_round_enable = 1'b0;
            FF_key_enable = 1'b1;
            RC_sig = 'h0;
            data_valid = 1'b1;

            if(start_operation) begin
                next_state = ZERO;
            end
            else begin
                next_state = ELEVEN;
            end
            
        end

        default: begin
            key_MUX1 = 1'b0;
            key_MUX2 = 1'b0;
            rounds_MUX1 = 1'b0;
            rounds_MUX2 = 1'b0;
            FF_key_enable = 1'b1;
            FF_round_enable = 1'b0;
            RC_sig = 'b0;
            data_valid = 1'b0;
            counter_comb = counter_seq;
            next_state = IDLE;
        end
    endcase
end
endmodule