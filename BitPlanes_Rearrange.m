function [origin_bits] = BitPlanes_Rearrange(Plane,Block_size,type)
% ����˵��������BMPR�㷨������λƽ�����Plane
% ���룺Plane��λƽ�����,Block_size���ֿ��С��,type�������з�ʽ��
% �����origin_bits��������֮���λƽ���������

[row,col] = size(Plane);
m = floor(row/Block_size); %m*n�����ֿ�ĸ���
n = floor(col/Block_size);
origin_bits = zeros(); %������¼λƽ�������еı�����
num = 0; %����
%-------------------�ֿ��ڰ��б������ֿ�䰴�б�������-�У�------------------%
if type==0 %0��00
    for i=1:m  %�ֿ�֮�䰴�б���
        for j=1:n
            begin_x = (i-1)*Block_size+1; %��Ӧ�ֿ����ʼ����
            begin_y = (j-1)*Block_size+1;
            end_x = i*Block_size; %��Ӧ�ֿ�Ľ�������
            end_y = j*Block_size;
            for x=begin_x:end_x  %�ֿ�֮�ڰ��б���
                for y=begin_y:end_y
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end 
        end
        if col-n*Block_size>=1  %��ʣ����
            begin_y = n*Block_size+1;
            end_y = col;
            for x=begin_x:end_x  %�ֿ�֮�ڰ��б���
                for y=begin_y:end_y
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end
        end  
    end
    if row-m*Block_size>=1 %��ʣ����
        begin_x = m*Block_size+1; 
        end_x = row;
        for j=1:n
            begin_y = (j-1)*Block_size+1;
            end_y = j*Block_size;
            for x=begin_x:end_x  %�ֿ�֮�ڰ��б���
                for y=begin_y:end_y
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end  
        end  
    end
    if row-m*Block_size>=1 && col-n*Block_size>=1 %����ʣ������
        begin_x = m*Block_size+1;
        begin_y = n*Block_size+1;
        end_x = row;
        end_y = col;
        for x=begin_x:end_x  %�ֿ�֮�䰴�б���
            for y=begin_y:end_y
                num = num+1;
                origin_bits(num) = Plane(x,y);
            end
        end  
    end
%-------------------�ֿ��ڰ��б������ֿ�䰴�б�������-�У�------------------%
elseif type==1 %1��01
    for j=1:n  %�ֿ�֮�䰴�б���
        for i=1:m
            begin_x = (i-1)*Block_size+1; %��Ӧ�ֿ����ʼ����
            begin_y = (j-1)*Block_size+1;
            end_x = i*Block_size; %��Ӧ�ֿ�Ľ�������
            end_y = j*Block_size;
            for x=begin_x:end_x  %�ֿ�֮�ڰ��б���
                for y=begin_y:end_y
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end 
        end
        if row-m*Block_size>=1  %��ʣ����
            begin_x = m*Block_size+1;
            end_x = row;
            for x=begin_x:end_x  %�ֿ�֮�ڰ��б���
                for y=begin_y:end_y
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end
        end  
    end
    if col-n*Block_size>=1 %��ʣ����
        begin_y = n*Block_size+1; 
        end_y = col;
        for i=1:m
            begin_x = (i-1)*Block_size+1;
            end_x = i*Block_size;
            for x=begin_x:end_x  %�ֿ�֮�ڰ��б���
                for y=begin_y:end_y
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end  
        end  
    end
    if row-m*Block_size>=1 && col-n*Block_size>=1 %����ʣ������
        begin_x = m*Block_size+1;
        begin_y = n*Block_size+1;
        end_x = row;
        end_y = col;
        for x=begin_x:end_x  %�ֿ�֮�䰴�б���
            for y=begin_y:end_y
                num = num+1;
                origin_bits(num) = Plane(x,y);
            end
        end  
    end
%-------------------�ֿ��ڰ��б������ֿ�䰴�б�������-�У�------------------%
elseif type==2 %2��10
    for i=1:m  %�ֿ�֮�䰴�б���
        for j=1:n
            begin_x = (i-1)*Block_size+1; %��Ӧ�ֿ����ʼ����
            begin_y = (j-1)*Block_size+1;
            end_x = i*Block_size; %��Ӧ�ֿ�Ľ�������
            end_y = j*Block_size; 
            for y=begin_y:end_y  %�ֿ�֮�ڰ��б���
                for x=begin_x:end_x  
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end 
        end
        if col-n*Block_size>=1  %��ʣ����
            begin_y = n*Block_size+1;
            end_y = col;
            for y=begin_y:end_y  %�ֿ�֮�ڰ��б���
                for x=begin_x:end_x  
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end 
        end  
    end
    if row-m*Block_size>=1 %��ʣ����
        begin_x = m*Block_size+1; 
        end_x = row;
        for j=1:n
            begin_y = (j-1)*Block_size+1;
            end_y = j*Block_size;
            for y=begin_y:end_y  %�ֿ�֮�ڰ��б���
                for x=begin_x:end_x  
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end   
        end  
    end
    if row-m*Block_size>=1 && col-n*Block_size>=1 %����ʣ������
        begin_x = m*Block_size+1;
        begin_y = n*Block_size+1;
        end_x = row;
        end_y = col;
        for y=begin_y:end_y  %�ֿ�֮�ڰ��б���
            for x=begin_x:end_x  
                num = num+1;
                origin_bits(num) = Plane(x,y);
            end
        end   
    end
%-------------------�ֿ��ڰ��б������ֿ�䰴�б�������-�У�------------------%
elseif type==3 %type==3��3��11
    for j=1:n  %�ֿ�֮�䰴�б���
        for i=1:m
            begin_x = (i-1)*Block_size+1; %��Ӧ�ֿ����ʼ����
            begin_y = (j-1)*Block_size+1;
            end_x = i*Block_size; %��Ӧ�ֿ�Ľ�������
            end_y = j*Block_size;
            for y=begin_y:end_y  %�ֿ�֮�ڰ��б���
                for x=begin_x:end_x  
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end  
        end
        if row-m*Block_size>=1  %��ʣ����
            begin_x = m*Block_size+1;
            end_x = row;
            for y=begin_y:end_y  %�ֿ�֮�ڰ��б���
                for x=begin_x:end_x  
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end
        end  
    end
    if col-n*Block_size>=1 %��ʣ����
        begin_y = n*Block_size+1; 
        end_y = col;
        for i=1:m
            begin_x = (i-1)*Block_size+1;
            end_x = i*Block_size;
            for y=begin_y:end_y  %�ֿ�֮�ڰ��б���
                for x=begin_x:end_x  
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end  
        end  
    end
    if row-m*Block_size>=1 && col-n*Block_size>=1 %����ʣ������
        begin_x = m*Block_size+1;
        begin_y = n*Block_size+1;
        end_x = row;
        end_y = col;
        for y=begin_y:end_y  %�ֿ�֮�ڰ��б���
            for x=begin_x:end_x  
                num = num+1;
                origin_bits(num) = Plane(x,y);
            end
        end  
    end 
%-------------------hilbert����---------------------%
else %type==4��4��hilbert
    coor = traverse(3);
    l = floor(row/8); %m*n����8�ֿ�
    w = floor(col/8);
    for i=1:l
        for j=1:w
            begin_x = (i-1)*8+1; %��Ӧ�ֿ����ʼ����
            begin_y = (j-1)*8+1;
            for c=1:2:127
                x = coor(c)+begin_x;
                y = coor(c+1)+begin_y;
                num = num+1;
                origin_bits(num) = Plane(x,y);
            end
        end
    end
end