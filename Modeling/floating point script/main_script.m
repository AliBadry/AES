clear; clc; close all;
%input vector is seeded to be: d9da7bea1a31d8abe2a27b4e855c5c5c / 40554DC4EDD210B27E4BE5D4D6DCDE0F / 1a0f5b2c5e8829dd4cb387563eacb8be
%key is seeded to be: 50ed00c48388ea9b0fb7c204c2c12d39 / 3AB8199730DB8A5CF3F3D1617D956CD7 / 1a0f5b2c5e8829dd4cb387563eacb8be

number_of_testcases = 202; %number of systemverilog generated tests
user_generation_select = input("Please insert '1' for random generation of input and key vectors or '2' for user defined input and key vectors or '3' for file reading: ");
key_size = 128; % the available key sizes are 128-bits, 192-bits, 256-bits.
switch(user_generation_select)
    case 1 %model random vectors generation
        %% ======= generating the input vector and encryption key=========%%
        [input_vector,key_vector] = initialize_inputs(key_size); %this function is parameterized for all key sizes
        
        %% ========generating the round keys=========%%
        round_keys = AES_key_expansion(key_vector,key_size); %parameterized for 128-AES only

        %% =========rounds operation============%%
        cipher_text = rounds_operation(input_vector,round_keys,key_size); %parameterized for 128-AES only

        final_result = strcat(cipher_text.hex(1,1),cipher_text.hex(2,1),cipher_text.hex(3,1),cipher_text.hex(4,1));
        disp(final_result)
        
    case 2 %user defined input vectors
        %% ======= generating the input vector and encryption key=========%%
        in_vector_hex = input("Insert 128-bits input vector in hex format ex:(a8df1): ","s");
        key_vector_hex = input("Insert 128-bits key vector in hex format ex:(a8df1): ","s");
        [input_vector,key_vector] = initialize_inputs_manually(in_vector_hex,key_vector_hex);
        
         %% ========generating the round keys=========%%
        round_keys = AES_key_expansion(key_vector,key_size); %parameterized for 128-AES only

        %% =========rounds operation============%%
        cipher_text = rounds_operation(input_vector,round_keys,key_size); %parameterized for 128-AES only

        final_result = strcat(cipher_text.hex(1,1),cipher_text.hex(2,1),cipher_text.hex(3,1),cipher_text.hex(4,1));
        disp(final_result)
        
    case 3 %systemverilog generated inputs
        fileID1 = fopen(['ciphered_text_file.txt'], 'w');
        
        fileID9 = fopen('../../RTL/Verification/input_vectors_only.txt','r');
        fileID10 = fopen('../../RTL/Verification/key_vectors_only.txt','r');
        
        input_vectors_file = fscanf(fileID9,'%s',[32 number_of_testcases])';
        key_vectors_file = fscanf(fileID10,'%s',[32 number_of_testcases])';
        
        fclose(fileID9);
        fclose(fileID10);
        
        for k1=1:1:number_of_testcases
            [input_vector,key_vector] = initialize_inputs_manually(input_vectors_file(k1,:),key_vectors_file(k1,:));
            
            %% ========generating the round keys=========%%
            round_keys = AES_key_expansion(key_vector,key_size); %parameterized for 128-AES only
            %% =========rounds operation============%%
            cipher_text = rounds_operation(input_vector,round_keys,key_size); %parameterized for 128-AES only
            final_result = strcat(cipher_text.hex(1,1),cipher_text.hex(2,1),cipher_text.hex(3,1),cipher_text.hex(4,1));
            
            fprintf(fileID1 , '%s\n', char(final_result));
        end
        fclose(fileID1);
    otherwise
        error('invalid input')
end
