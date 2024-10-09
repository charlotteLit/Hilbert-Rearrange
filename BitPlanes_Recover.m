function [Plane_Matrix] = BitPlanes_Recover(Plane_bits,row,col)
% 函数说明：根据BMPR算法逆过程将比特流恢复成位平面矩阵
% 输入：Plane_bits（位平面比特流）,Block_size（分块大小）,type（重排列方式）,row,col（矩阵的行列数）
% 输出：Plane_Matrix（位平面矩阵）

Plane_Matrix = zeros(row,col);
num = 0; %计数

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


