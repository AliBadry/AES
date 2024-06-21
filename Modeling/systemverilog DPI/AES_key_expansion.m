function [round_keys] = AES_key_expansion(key_vector,key_size)
    %% first round key should be concatenation of the main key forming (key_size/32) 32-bits words
    for k1=1:1:key_size/32
        round_keys.binary_vector(k1,:)=reshape(hexToBinaryVector(key_vector.hex_reshaped(1:4,k1),8)',[32,1])'; %forming 32-bits words horizontally by concatenation column's bytes.
    end
    %% perform G-function to the last word in the last round key
    switch key_size
        case 128
            for k1=5:1:44
                if(mod(k1-1,4)==0)
                    round_keys.binary_vector(k1,:) = bitxor(G_function(round_keys.binary_vector(k1-1,:),(k1-1)/4,key_size),round_keys.binary_vector(k1-4,:));
                else
                    round_keys.binary_vector(k1,:) = bitxor(round_keys.binary_vector(k1-1,:),round_keys.binary_vector(k1-4,:));
                end
            end
        case 192
        case 256
        otherwise
            error('Wrong key size in the AES_key_expansion function')
            
    end
    for k1=1:1:44
        round_keys.hex(k1,:) = binaryVectorToHex(round_keys.binary_vector(k1,:));
    end
end

