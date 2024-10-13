function [ES_I,num_Of,PL_len,PL_room,total_Room] = Vacate_Encrypt(origin_I,L_fix,L,K_en,K_sh)

[row,col] = size(origin_I); 
num = ceil(log2(row))+ceil(log2(col))+3; 

[PE_I,num_Of,Overflow] = Prediction_Error(origin_I);

[vacate_I,PL_len,PL_room,total_Room] = Vacate_Room(PE_I,L_fix,L,num_Of,Overflow);

rand('seed',K_en); 
E = round(rand(row,col)*255); 
encrypt_I = vacate_I;
for i=1:row  
    for j=1:col
        encrypt_I(i,j) = bitxor(vacate_I(i,j),E(i,j));
    end
end

transition_I = encrypt_I;
if total_Room>=num 
    bits_room = zeros(1,num);
    bin2_room = dec2bin(total_Room)-'0';
    len = length(bin2_room);
    bits_room(num-len+1:num) = bin2_room;
    for i=1:num 
        j = col-num+i; 
        value = transition_I(row,j);
        bit = bits_room(i);
        value_1 = (floor(value/2))*2 + bit;
        transition_I(row,j) = value_1;
    end  
end

rand('seed',K_sh); 
SH = randperm(row*col); 
[shuffle_I] = Image_Shuffle(transition_I,SH);

ES_I = shuffle_I;
