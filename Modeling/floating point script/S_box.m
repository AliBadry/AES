function [s_out] = S_box(input_byte,sub_option)
%two options of substitution:
% 1-the input is hexadecimal byte
% 2-the input is binary byte
% else print an error message
% The output is a binary vector
if(sub_option==2)
    sub_byte = binaryVectorToHex(input_byte);
elseif(sub_option==1)
    sub_byte = input_byte;
else
    error('unavailable option in S_box function')
end
    switch char(sub_byte)
        case '00'
            subbed_byte = {'63'};
        case '01'
            subbed_byte = {'7C'};
        case '02'
            subbed_byte = {'77'};
        case '03'
            subbed_byte = {'7B'};
        case '04'
            subbed_byte = {'F2'};
        case '05'
            subbed_byte = {'6B'};
        case '06'
            subbed_byte = {'6F'};
        case '07'
            subbed_byte = {'C5'};
        case '08'
            subbed_byte = {'30'};
        case '09'
            subbed_byte = {'01'};
        case '0A'
            subbed_byte = {'67'};
        case '0B'
            subbed_byte = {'2B'};
        case '0C'
            subbed_byte = {'FE'};
        case '0D'
            subbed_byte = {'D7'};
        case '0E'
            subbed_byte = {'AB'};
        case '0F'
            subbed_byte = {'76'};
		case '10' 
            subbed_byte = {'CA'};
        case '11'
            subbed_byte = {'82'};
        case '12'
            subbed_byte = {'C9'};
        case '13'
            subbed_byte = {'7D'};
        case '14'
            subbed_byte = {'FA'};
        case '15'
            subbed_byte = {'59'};
        case '16'
            subbed_byte = {'47'};
        case '17'
            subbed_byte = {'F0'};
        case '18'
            subbed_byte = {'AD'};
        case '19'
            subbed_byte = {'D4'};
        case '1A'
            subbed_byte = {'A2'};
        case '1B'
            subbed_byte = {'AF'};
        case '1C'
            subbed_byte = {'9C'};
        case '1D'
            subbed_byte = {'A4'};
        case '1E'
            subbed_byte = {'72'};
        case '1F'
            subbed_byte = {'C0'};
		case '20' 
            subbed_byte = {'B7'};
        case '21'
            subbed_byte = {'FD'};
        case '22'
            subbed_byte = {'93'};
        case '23'
            subbed_byte = {'26'};
        case '24'
            subbed_byte = {'36'};
        case '25'
            subbed_byte = {'3F'};
        case '26'
            subbed_byte = {'F7'};
        case '27'
            subbed_byte = {'CC'};
        case '28'
            subbed_byte = {'34'};
        case '29'
            subbed_byte = {'A5'};
        case '2A'
            subbed_byte = {'E5'};
        case '2B'
            subbed_byte = {'F1'};
        case '2C'
            subbed_byte = {'71'};
        case '2D'
            subbed_byte = {'D8'};
        case '2E'
            subbed_byte = {'31'};
        case '2F'
            subbed_byte = {'15'};
		case '30' 
            subbed_byte = {'04'};
        case '31'
            subbed_byte = {'C7'};
        case '32'
            subbed_byte = {'23'};
        case '33'
            subbed_byte = {'C3'};
        case '34'
            subbed_byte = {'18'};
        case '35'
            subbed_byte = {'96'};
        case '36'
            subbed_byte = {'05'};
        case '37'
            subbed_byte = {'9A'};
        case '38'
            subbed_byte = {'07'};
        case '39'
            subbed_byte = {'12'};
        case '3A'
            subbed_byte = {'80'};
        case '3B'
            subbed_byte = {'E2'};
        case '3C'
            subbed_byte = {'EB'};
        case '3D'
            subbed_byte = {'27'};
        case '3E'
            subbed_byte = {'B2'};
        case '3F'
            subbed_byte = {'75'};
		case '40' 
            subbed_byte = {'09'};
        case '41'
            subbed_byte = {'83'};
        case '42'
            subbed_byte = {'2C'};
        case '43'
            subbed_byte = {'1A'};
        case '44'
            subbed_byte = {'1B'};
        case '45'
            subbed_byte = {'6E'};
        case '46'
            subbed_byte = {'5A'};
        case '47'
            subbed_byte = {'A0'};
        case '48'
            subbed_byte = {'52'};
        case '49'
            subbed_byte = {'3B'};
        case '4A'
            subbed_byte = {'D6'};
        case '4B'
            subbed_byte = {'B3'};
        case '4C'
            subbed_byte = {'29'};
        case '4D'
            subbed_byte = {'E3'};
        case '4E'
            subbed_byte = {'2F'};
        case '4F'
            subbed_byte = {'84'};
		case '50' 
            subbed_byte = {'53'};
        case '51'
            subbed_byte = {'D1'};
        case '52'
            subbed_byte = {'00'};
        case '53'
            subbed_byte = {'ED'};
        case '54'
            subbed_byte = {'20'};
        case '55'
            subbed_byte = {'FC'};
        case '56'
            subbed_byte = {'B1'};
        case '57'
            subbed_byte = {'5B'};
        case '58'
            subbed_byte = {'6A'};
        case '59'
            subbed_byte = {'CB'};
        case '5A'
            subbed_byte = {'BE'};
        case '5B'
            subbed_byte = {'39'};
        case '5C'
            subbed_byte = {'4A'};
        case '5D'
            subbed_byte = {'4C'};
        case '5E'
            subbed_byte = {'58'};
        case '5F'
            subbed_byte = {'CF'};
		case '60' 
            subbed_byte = {'D0'};
        case '61'
            subbed_byte = {'EF'};
        case '62'
            subbed_byte = {'AA'};
        case '63'
            subbed_byte = {'FB'};
        case '64'
            subbed_byte = {'43'};
        case '65'
            subbed_byte = {'4D'};
        case '66'
            subbed_byte = {'33'};
        case '67'
            subbed_byte = {'85'};
        case '68'
            subbed_byte = {'45'};
        case '69'
            subbed_byte = {'F9'};
        case '6A'
            subbed_byte = {'02'};
        case '6B'
            subbed_byte = {'7F'};
        case '6C'
            subbed_byte = {'50'};
        case '6D'
            subbed_byte = {'3C'};
        case '6E'
            subbed_byte = {'9F'};
        case '6F'
            subbed_byte = {'A8'};
		case '70' 
            subbed_byte = {'51'};
        case '71'
            subbed_byte = {'A3'};
        case '72'
            subbed_byte = {'40'};
        case '73'
            subbed_byte = {'8F'};
        case '74'
            subbed_byte = {'92'};
        case '75'
            subbed_byte = {'9D'};
        case '76'
            subbed_byte = {'38'};
        case '77'
            subbed_byte = {'F5'};
        case '78'
            subbed_byte = {'BC'};
        case '79'
            subbed_byte = {'B6'};
        case '7A'
            subbed_byte = {'DA'};
        case '7B'
            subbed_byte = {'21'};
        case '7C'
            subbed_byte = {'10'};
        case '7D'
            subbed_byte = {'FF'};
        case '7E'
            subbed_byte = {'F3'};
        case '7F'
            subbed_byte = {'D2'};
		case '80' 
            subbed_byte = {'CD'};
        case '81'
            subbed_byte = {'0C'};
        case '82'
            subbed_byte = {'13'};
        case '83'
            subbed_byte = {'EC'};
        case '84'
            subbed_byte = {'5F'};
        case '85'
            subbed_byte = {'97'};
        case '86'
            subbed_byte = {'44'};
        case '87'
            subbed_byte = {'17'};
        case '88'
            subbed_byte = {'C4'};
        case '89'
            subbed_byte = {'A7'};
        case '8A'
            subbed_byte = {'7E'};
        case '8B'
            subbed_byte = {'3D'};
        case '8C'
            subbed_byte = {'64'};
        case '8D'
            subbed_byte = {'5D'};
        case '8E'
            subbed_byte = {'19'};
        case '8F'
            subbed_byte = {'73'};
		case '90' 
            subbed_byte = {'60'};
        case '91'
            subbed_byte = {'81'};
        case '92'
            subbed_byte = {'4F'};
        case '93'
            subbed_byte = {'DC'};
        case '94'
            subbed_byte = {'22'};
        case '95'
            subbed_byte = {'2A'};
        case '96'
            subbed_byte = {'90'};
        case '97'
            subbed_byte = {'88'};
        case '98'
            subbed_byte = {'46'};
        case '99'
            subbed_byte = {'EE'};
        case '9A'
            subbed_byte = {'B8'};
        case '9B'
            subbed_byte = {'14'};
        case '9C'
            subbed_byte = {'DE'};
        case '9D'
            subbed_byte = {'5E'};
        case '9E'
            subbed_byte = {'0B'};
        case '9F'
            subbed_byte = {'DB'};
		case 'A0' 
            subbed_byte = {'E0'};
        case 'A1'
            subbed_byte = {'32'};
        case 'A2'
            subbed_byte = {'3A'};
        case 'A3'
            subbed_byte = {'0A'};
        case 'A4'
            subbed_byte = {'49'};
        case 'A5'
            subbed_byte = {'06'};
        case 'A6'
            subbed_byte = {'24'};
        case 'A7'
            subbed_byte = {'5C'};
        case 'A8'
            subbed_byte = {'C2'};
        case 'A9'
            subbed_byte = {'D3'};
        case 'AA'
            subbed_byte = {'AC'};
        case 'AB'
            subbed_byte = {'62'};
        case 'AC'
            subbed_byte = {'91'};
        case 'AD'
            subbed_byte = {'95'};
        case 'AE'
            subbed_byte = {'E4'};
        case 'AF'
            subbed_byte = {'79'};
		case 'B0' 
            subbed_byte = {'E7'};
        case 'B1'
            subbed_byte = {'C8'};
        case 'B2'
            subbed_byte = {'37'};
        case 'B3'
            subbed_byte = {'6D'};
        case 'B4'
            subbed_byte = {'8D'};
        case 'B5'
            subbed_byte = {'D5'};
        case 'B6'
            subbed_byte = {'4E'};
        case 'B7'
            subbed_byte = {'A9'};
        case 'B8'
            subbed_byte = {'6C'};
        case 'B9'
            subbed_byte = {'56'};
        case 'BA'
            subbed_byte = {'F4'};
        case 'BB'
            subbed_byte = {'EA'};
        case 'BC'
            subbed_byte = {'65'};
        case 'BD'
            subbed_byte = {'7A'};
        case 'BE'
            subbed_byte = {'AE'};
        case 'BF'
            subbed_byte = {'08'};
		case 'C0' 
            subbed_byte = {'BA'};
        case 'C1'
            subbed_byte = {'78'};
        case 'C2'
            subbed_byte = {'25'};
        case 'C3'
            subbed_byte = {'2E'};
        case 'C4'
            subbed_byte = {'1C'};
        case 'C5'
            subbed_byte = {'A6'};
        case 'C6'
            subbed_byte = {'B4'};
        case 'C7'
            subbed_byte = {'C6'};
        case 'C8'
            subbed_byte = {'E8'};
        case 'C9'
            subbed_byte = {'DD'};
        case 'CA'
            subbed_byte = {'74'};
        case 'CB'
            subbed_byte = {'1F'};
        case 'CC'
            subbed_byte = {'4B'};
        case 'CD'
            subbed_byte = {'BD'};
        case 'CE'
            subbed_byte = {'8B'};
        case 'CF'
            subbed_byte = {'8A'};
		case 'D0' 
            subbed_byte = {'70'};
        case 'D1'
            subbed_byte = {'3E'};
        case 'D2'
            subbed_byte = {'B5'};
        case 'D3'
            subbed_byte = {'66'};
        case 'D4'
            subbed_byte = {'48'};
        case 'D5'
            subbed_byte = {'03'};
        case 'D6'
            subbed_byte = {'F6'};
        case 'D7'
            subbed_byte = {'0E'};
        case 'D8'
            subbed_byte = {'61'};
        case 'D9'
            subbed_byte = {'35'};
        case 'DA'
            subbed_byte = {'57'};
        case 'DB'
            subbed_byte = {'B9'};
        case 'DC'
            subbed_byte = {'86'};
        case 'DD'
            subbed_byte = {'C1'};
        case 'DE'
            subbed_byte = {'1D'};
        case 'DF'
            subbed_byte = {'9E'};
		case 'E0' 
            subbed_byte = {'E1'};
        case 'E1'
            subbed_byte = {'F8'};
        case 'E2'
            subbed_byte = {'98'};
        case 'E3'
            subbed_byte = {'11'};
        case 'E4'
            subbed_byte = {'69'};
        case 'E5'
            subbed_byte = {'D9'};
        case 'E6'
            subbed_byte = {'8E'};
        case 'E7'
            subbed_byte = {'94'};
        case 'E8'
            subbed_byte = {'9B'};
        case 'E9'
            subbed_byte = {'1E'};
        case 'EA'
            subbed_byte = {'87'};
        case 'EB'
            subbed_byte = {'E9'};
        case 'EC'
            subbed_byte = {'CE'};
        case 'ED'
            subbed_byte = {'55'};
        case 'EE'
            subbed_byte = {'28'};
        case 'EF'
            subbed_byte = {'DF'};
		case 'F0' 
            subbed_byte = {'8C'};
        case 'F1'
            subbed_byte = {'A1'};
        case 'F2'
            subbed_byte = {'89'};
        case 'F3'
            subbed_byte = {'0D'};
        case 'F4'
            subbed_byte = {'BF'};
        case 'F5'
            subbed_byte = {'E6'};
        case 'F6'
            subbed_byte = {'42'};
        case 'F7'
            subbed_byte = {'68'};
        case 'F8'
            subbed_byte = {'41'};
        case 'F9'
            subbed_byte = {'99'};
        case 'FA'
            subbed_byte = {'2D'};
        case 'FB'
            subbed_byte = {'0F'};
        case 'FC'
            subbed_byte = {'B0'};
        case 'FD'
            subbed_byte = {'54'};
        case 'FE'
            subbed_byte = {'BB'};
        case 'FF'
            subbed_byte = {'16'};
        otherwise
            error('invalid byte')
    end
    s_out = hexToBinaryVector(subbed_byte,8);
end