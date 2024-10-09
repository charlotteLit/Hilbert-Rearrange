function [origin_bits] = BitPlanes_Rearrange(Plane)

[row,col] = size(Plane);
origin_bits = zeros(); 
num = 0; 
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
            origin_bits(num) = Plane(x,y);
        end
    end
end
