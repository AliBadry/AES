function binVec = hextobinvec(hexStr, numBits)
    % Validate input
    if nargin < 2
        numBits = numel(hexStr) * 4; % Default to full bit-width for hex string
    end
    binVec = zeros(1, numBits, 'uint8');
    
    % Loop through each character in the hex string
    hexMap = containers.Map('0123456789ABCDEF', 0:15);
    binMap = dec2bin(0:15, 4) - '0';
    
    hexStr = upper(hexStr); % Ensure uppercase
    for i = 1:numel(hexStr)
        if isKey(hexMap, hexStr(i))
            hexVal = hexMap(hexStr(i));
            binVec((i-1)*4+1:i*4) = binMap(hexVal+1, :);
        else
            error('Invalid hexadecimal character');
        end
    end
    
    % Truncate or pad the binary vector to the desired length
    if numBits < numel(binVec)
        binVec = binVec(1:numBits);
    elseif numBits > numel(binVec)
        binVec = [zeros(1, numBits - numel(binVec)), binVec];
    end
end