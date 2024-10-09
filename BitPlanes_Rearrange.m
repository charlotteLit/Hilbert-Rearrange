function [origin_bits] = BitPlanes_Rearrange(Plane)

[row,col] = size(Plane);
origin_bits = zeros(); 
num = 0; 

coor = traverse(3);
l = floor(row/8); 
w = floor(col/8);
for i=1:l
    for j=1:w
        begin_x = (i-1)*8+1; 
        begin_y = (j-1)*8+1;
        for c=1:64
            x = coor(c,1)+begin_x;
            y = coor(c,2)+begin_y;
            num = num+1;
            origin_bits(num) = Plane(x,y);
        end
    end
end
