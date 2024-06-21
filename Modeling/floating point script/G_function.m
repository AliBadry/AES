function [G_output] = G_function(round_key,round_index,key_size)
% by the following order we will: 1-left rotate. 2-substitute. 3-add Rcon.
G_shift = [round_key(1,9:32) round_key(1,1:8)];
for k1=1:8:32
    G_sub(1,k1:k1+7) = S_box(G_shift(1,k1:k1+7),2);
end
switch key_size
    case 128
        switch round_index
            case 1
                G_output = bitxor(G_sub,[0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
            case 2
                G_output = bitxor(G_sub,[0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
            case 3
                G_output = bitxor(G_sub,[0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
            case 4
                G_output = bitxor(G_sub,[0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
            case 5
                G_output = bitxor(G_sub,[0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
            case 6
                G_output = bitxor(G_sub,[0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
            case 7
                G_output = bitxor(G_sub,[0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
            case 8
                G_output = bitxor(G_sub,[1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
            case 9
                G_output = bitxor(G_sub,[0 0 0 1 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
            case 10
                G_output = bitxor(G_sub,[0 0 1 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
        end
    case 192
    case 256
end
end

