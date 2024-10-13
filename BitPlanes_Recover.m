function [Plane_Matrix] = BitPlanes_Recover(Plane_bits,row,col)
% Hilbert二级加密，二级8*8块，三级同上
% 二级2^6=64，三级2^9=512

Plane_Matrix = zeros(row,col);
num = 0; %计数
Block_size = 8;
sum = Block_size^2;
coor = traverse(log2(Block_size));

l = floor(row/sum); 
w = floor(col/sum);

for m=1:l
    for n=1:w
        for bc = 1:sum
            i = coor(bc,1) + (m-1)*Block_size+1;
            j = coor(bc,2) + (n-1)*Block_size+1;
            begin_x = (i-1)*Block_size+1; 
            begin_y = (j-1)*Block_size+1;
            for c=1:sum
                x = coor(c,1)+begin_x;
                y = coor(c,2)+begin_y;
                num = num+1;
                Plane_Matrix(x,y) = Plane_bits(num);
            end
        end
    end
end
