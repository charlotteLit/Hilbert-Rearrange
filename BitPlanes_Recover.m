function [Plane_Matrix] = BitPlanes_Recover(Plane_bits,row,col)
% ����˵��������BMPR�㷨����̽��������ָ���λƽ�����
% ���룺Plane_bits��λƽ���������,Block_size���ֿ��С��,type�������з�ʽ��,row,col���������������
% �����Plane_Matrix��λƽ�����

Plane_Matrix = zeros(row,col);
num = 0; %����
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
            Plane_Matrix(x,y) = Plane_bits(num);
        end
    end
end


