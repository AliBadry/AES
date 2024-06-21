function [mix_out] = mix_cols(input_vector)
%MIX_COLS the input here should be 1 word (32-bits) to mix them together
% we calculate 4-bytes individually then return the result as 32-bits in binary

%each byte consists of 4 terms that should be calculated separatly before calculating the final result of the byte
%% ----------calculating the first byte.---------%% 
%we should make all vectors of same size to perform the bitwise xor operation
byte1_term1 = [input_vector(1,1:8) 0];
byte1_term2 = bitxor([input_vector(1,9:16) 0],[0 input_vector(1,9:16)]);
byte1_term3 = [0 input_vector(1,17:24)];
byte1_term4 = [0 input_vector(1,25:32)];

byte1 = bitxor(bitxor(byte1_term1,byte1_term2),bitxor(byte1_term3,byte1_term4));
if(byte1(1,1) == 1)
   byte1 = reduction(byte1); 
end
mix_out(1,1:8) = byte1(1,2:9);
%% -------calculating the second byte--------%%
byte2_term1 = [0 input_vector(1,1:8)];
byte2_term2 = [input_vector(1,9:16) 0];
byte2_term3 = bitxor([input_vector(1,17:24) 0],[0 input_vector(1,17:24)]);
byte2_term4 = [0 input_vector(1,25:32)];

byte2 = bitxor(bitxor(byte2_term1,byte2_term2),bitxor(byte2_term3,byte2_term4));
if(byte2(1,1) == 1)
    byte2 = reduction(byte2); 
end
mix_out(1,9:16) = byte2(1,2:9);
%% -------calculating the third byte----%%
byte3_term1 = [0 input_vector(1,1:8)];
byte3_term2 = [0 input_vector(1,9:16)];
byte3_term3 = [input_vector(1,17:24) 0];
byte3_term4 = bitxor([input_vector(1,25:32) 0],[0 input_vector(1,25:32)]);

byte3 = bitxor(bitxor(byte3_term1,byte3_term2),bitxor(byte3_term3,byte3_term4));
if(byte3(1,1) == 1)
    byte3 = reduction(byte3); 
end
mix_out(1,17:24) = byte3(1,2:9);
%% ------calculating the fourth byte --------%%
byte4_term1 = bitxor([input_vector(1,1:8) 0],[0 input_vector(1,1:8)]);
byte4_term2 = [0 input_vector(1,9:16)];
byte4_term3 = [0 input_vector(1,17:24)];
byte4_term4 = [input_vector(1,25:32) 0];

byte4 = bitxor(bitxor(byte4_term1,byte4_term2),bitxor(byte4_term3,byte4_term4));
if(byte4(1,1) == 1)
    byte4 = reduction(byte4); 
end
mix_out(1,25:32) = byte4(1,2:9);
end

function [reduction_result] = reduction(input_byte)
    reduction_result = bitxor(input_byte,[1 0 0 0 1 1 0 1 1]);
end