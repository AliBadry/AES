function [cipher_text] = rounds_operation(input_vector,round_keys,key_size)
%making each word of the input in a row
plain_text = reshape(input_vector.binary,[32,4])';

%% round zero is only adding the round key
rounds(1).final_out.binary = bitxor(plain_text,round_keys.binary_vector(1:4,:));
% for k1=1:1:4
%     rounds(1).final_out.hex(k1,:) = binaryVectorToHex(rounds(1).final_out.binary(k1,:));
% end
rounds(1).final_out.hex = binaryVectorToHex(rounds(1).final_out.binary);
% rounds(1).sub.binary_vector = zeros(4,32);
switch key_size
    case 128
%% the rest of the rounds except the last round
        for k1=2:1:10 % loop on the number of rounds. remember the last round is different. thats why we loop here on 9 only not 10 rounds in AES-128
            
            % first we want to substitute each byte from the s_box function
            for k2=1:1:4 %loop on the four words
                for k3=1:8:32 %loop on each byte in the word
                    rounds(k1).sub.binary_vector(k2,k3:k3+7) = S_box(rounds(k1-1).final_out.binary(k2,k3:k3+7),2);
                end
            end
            rounds(k1).sub.hex = binaryVectorToHex(rounds(k1).sub.binary_vector);
            
            %second, we want to cyclic shift rows to the left
            rounds(k1).shift.binary_vector = shift_rows(rounds(k1).sub.binary_vector');
            rounds(k1).shift.hex = binaryVectorToHex(rounds(k1).shift.binary_vector);
            
            %third, we need to mix columns of the 4 words
            for k2=1:1:4
                rounds(k1).mix.binary_vector(k2,:) = mix_cols(rounds(k1).shift.binary_vector(k2,:));
            end
            rounds(k1).mix.hex = binaryVectorToHex(rounds(k1).mix.binary_vector);
            
            %finally we will add the round key to the mix columns output
            rounds(k1).final_out.binary = bitxor(round_keys.binary_vector((k1-1)*4+1:k1*4,:),rounds(k1).mix.binary_vector(1:4,:));
            rounds(k1).final_out.hex = binaryVectorToHex(rounds(k1).final_out.binary);
        end
%% the last round
        % first we want to substitute each byte from the s_box function
        for k2=1:1:4 %loop on the four words
                for k3=1:8:32 %loop on each byte in the word
                    rounds(11).sub.binary_vector(k2,k3:k3+7) = S_box(rounds(10).final_out.binary(k2,k3:k3+7),2);
                end
        end
        rounds(11).sub.hex = binaryVectorToHex(rounds(11).sub.binary_vector);
        %second, we want to cyclic shift rows to the left
        rounds(11).shift.binary_vector = shift_rows(rounds(11).sub.binary_vector');
        rounds(11).shift.hex = binaryVectorToHex(rounds(11).shift.binary_vector);
        %finally we will add the round key to the mix columns output
        rounds(11).final_out.binary = bitxor(round_keys.binary_vector((10)*4+1:11*4,:),rounds(11).shift.binary_vector(1:4,:));
        rounds(11).final_out.hex = binaryVectorToHex(rounds(11).final_out.binary);
        
        cipher_text.binary_vector = rounds(11).final_out.binary;
        cipher_text.hex = rounds(11).final_out.hex;
    case 192
    case 256
    otherwise
        error('wrong key size')
end
end

