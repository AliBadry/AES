function [input_vector,key_vector] = initialize_inputs(key_size)
    %rng(1);
    rng("default");
    input_vector.binary = randi([0,1],128,1); 

    %remember, the key size could be 128,192 or 256-bits
    key_vector.binary = randi([0,1],key_size,1);

    % we will reshape the input vector and the encryption key to convert the binary stream to hexadecimal numbers
    input_vector.binary_reshaped = reshape(input_vector.binary,[8,size(input_vector.binary,1)/8]);
    input_vector.hex = binaryVectorToHex(input_vector.binary_reshaped');

    key_vector.binary_reshaped = reshape(key_vector.binary,[8,key_size/8]);
    key_vector.hex = binaryVectorToHex(key_vector.binary_reshaped');
    %construct the 16x16 matrix input to the encryption system
    input_vector.hex_reshaped = reshape(input_vector.hex,[4,4]);

    %8 is the byte size , 4 is the number of rows or the number of bytes in each column. so the number of columns in the key_vector depends on the key size.
    %128-bits -> 4 columns. 192-bits -> 6 columns. 256-bits -> 8 columns. Number of rows is constant(4).
    key_vector.hex_reshaped = reshape(key_vector.hex,[4,key_size/(8*4)]); 
end

