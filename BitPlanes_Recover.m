function [Plane_Matrix] = BitPlanes_Recover(Plane_bits,row,col)

Plane_Matrix = zeros(row,col);
num = 0; %¼ÆÊý

Block_size = 8;
sum = Block_size^2;
coor = traverse(log2(Block_size));
l = floor(row/Block_size); 
w = floor(col/Block_size);

for i=1:l
    for j=1:w
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


