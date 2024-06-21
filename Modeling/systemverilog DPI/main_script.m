clear; clc; close all;
%input vector is seeded to be: d9da7bea1a31d8abe2a27b4e855c5c5c / 40554DC4EDD210B27E4BE5D4D6DCDE0F / 1a0f5b2c5e8829dd4cb387563eacb8be
%key is seeded to be: 50ed00c48388ea9b0fb7c204c2c12d39 / 3AB8199730DB8A5CF3F3D1617D956CD7 / 1a0f5b2c5e8829dd4cb387563eacb8be
%% ======= generating the input vector and encryption key=========%%
user_generation_select = input("Please insert '1' for random generation of input and key vectors or '2' for user defined input and key vectors: ");
key_size = 128; % the available key sizes are 128-bits, 192-bits, 256-bits.
switch(user_generation_select)
    case 1
        [input_vector,key_vector] = initialize_inputs(key_size); %this function is parameterized for all key sizes
    case 2
        in_vector_hex = input("Insert 128-bits input vector in hex format ex:(a8df1): ","s");
        key_vector_hex = input("Insert 128-bits key vector in hex format ex:(a8df1): ","s");
        [input_vector,key_vector] = initialize_inputs_manually(in_vector_hex,key_vector_hex);
    otherwise
        error('invalid input')
end
%% ========generating the round keys=========%%
round_keys = AES_key_expansion(key_vector,key_size); %parameterized for 128-AES only

%% =========rounds operation============%%
cipher_text = rounds_operation(input_vector,round_keys,key_size); %parameterized for 128-AES only

final_result = strcat(cipher_text.hex(1,1),cipher_text.hex(2,1),cipher_text.hex(3,1),cipher_text.hex(4,1));
disp(final_result)