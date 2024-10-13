function [Plane_Matrix] = BitPlanes_Recover(Plane_bits,row,col)

Plane_Matrix = zeros(row,col);
num = 0; %¼ÆÊý

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


