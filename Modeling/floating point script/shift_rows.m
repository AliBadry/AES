function [shift_out] = shift_rows(binary_input)
%the input is 4 32-bits columns that should be circular shifted left
%the output is 4 32-bits rows

%the first bytes of each word does not change its place
shift_out(1:8,:) = binary_input(1:8,:);

%second bytes should be shifted the left once
shift_out(9:16,1) = binary_input(9:16,2);
shift_out(9:16,2) = binary_input(9:16,3);
shift_out(9:16,3) = binary_input(9:16,4);
shift_out(9:16,4) = binary_input(9:16,1);

%third bytes should be shifted to the left twice
shift_out(17:24,1) = binary_input(17:24,3);
shift_out(17:24,2) = binary_input(17:24,4);
shift_out(17:24,3) = binary_input(17:24,1);
shift_out(17:24,4) = binary_input(17:24,2);

%fourth bytes should be shifted to the left three times
shift_out(25:32,1) = binary_input(25:32,4);
shift_out(25:32,2) = binary_input(25:32,1);
shift_out(25:32,3) = binary_input(25:32,2);
shift_out(25:32,4) = binary_input(25:32,3);

shift_out = shift_out';
end

