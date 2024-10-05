function [origin_bits] = BitPlanes_Rearrange(Plane,Block_size,type)


[row,col] = size(Plane);
m = floor(row/Block_size); 
n = floor(col/Block_size);
origin_bits = zeros(); 
num = 0; 

if type==0 
    for i=1:m  
        for j=1:n
            begin_x = (i-1)*Block_size+1; 
            begin_y = (j-1)*Block_size+1;
            end_x = i*Block_size; 
            end_y = j*Block_size;
            for x=begin_x:end_x  
                for y=begin_y:end_y
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end 
        end
        if col-n*Block_size>=1  
            begin_y = n*Block_size+1;
            end_y = col;
            for x=begin_x:end_x  
                for y=begin_y:end_y
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end
        end  
    end
    if row-m*Block_size>=1 
        begin_x = m*Block_size+1; 
        end_x = row;
        for j=1:n
            begin_y = (j-1)*Block_size+1;
            end_y = j*Block_size;
            for x=begin_x:end_x  
                for y=begin_y:end_y
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end  
        end  
    end
    if row-m*Block_size>=1 && col-n*Block_size>=1 
        begin_x = m*Block_size+1;
        begin_y = n*Block_size+1;
        end_x = row;
        end_y = col;
        for x=begin_x:end_x  
            for y=begin_y:end_y
                num = num+1;
                origin_bits(num) = Plane(x,y);
            end
        end  
    end

elseif type==1 
    for j=1:n  
        for i=1:m
            begin_x = (i-1)*Block_size+1; 
            begin_y = (j-1)*Block_size+1;
            end_x = i*Block_size; 
            end_y = j*Block_size;
            for x=begin_x:end_x  
                for y=begin_y:end_y
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end 
        end
        if row-m*Block_size>=1  
            begin_x = m*Block_size+1;
            end_x = row;
            for x=begin_x:end_x  
                for y=begin_y:end_y
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end
        end  
    end
    if col-n*Block_size>=1 
        begin_y = n*Block_size+1; 
        end_y = col;
        for i=1:m
            begin_x = (i-1)*Block_size+1;
            end_x = i*Block_size;
            for x=begin_x:end_x  
                for y=begin_y:end_y
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end  
        end  
    end
    if row-m*Block_size>=1 && col-n*Block_size>=1 
        begin_x = m*Block_size+1;
        begin_y = n*Block_size+1;
        end_x = row;
        end_y = col;
        for x=begin_x:end_x  
            for y=begin_y:end_y
                num = num+1;
                origin_bits(num) = Plane(x,y);
            end
        end  
    end

elseif type==2 
    for i=1:m  
        for j=1:n
            begin_x = (i-1)*Block_size+1; 
            begin_y = (j-1)*Block_size+1;
            end_x = i*Block_size; 
            end_y = j*Block_size; 
            for y=begin_y:end_y  
                for x=begin_x:end_x  
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end 
        end
        if col-n*Block_size>=1  
            begin_y = n*Block_size+1;
            end_y = col;
            for y=begin_y:end_y  
                for x=begin_x:end_x  
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end 
        end  
    end
    if row-m*Block_size>=1 
        begin_x = m*Block_size+1; 
        end_x = row;
        for j=1:n
            begin_y = (j-1)*Block_size+1;
            end_y = j*Block_size;
            for y=begin_y:end_y  
                for x=begin_x:end_x  
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end   
        end  
    end
    if row-m*Block_size>=1 && col-n*Block_size>=1 
        begin_x = m*Block_size+1;
        begin_y = n*Block_size+1;
        end_x = row;
        end_y = col;
        for y=begin_y:end_y  
            for x=begin_x:end_x  
                num = num+1;
                origin_bits(num) = Plane(x,y);
            end
        end   
    end

elseif type==3 
    for j=1:n  
        for i=1:m
            begin_x = (i-1)*Block_size+1; 
            begin_y = (j-1)*Block_size+1;
            end_x = i*Block_size; 
            end_y = j*Block_size;
            for y=begin_y:end_y  
                for x=begin_x:end_x  
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end  
        end
        if row-m*Block_size>=1  
            begin_x = m*Block_size+1;
            end_x = row;
            for y=begin_y:end_y  
                for x=begin_x:end_x  
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end
        end  
    end
    if col-n*Block_size>=1 
        begin_y = n*Block_size+1; 
        end_y = col;
        for i=1:m
            begin_x = (i-1)*Block_size+1;
            end_x = i*Block_size;
            for y=begin_y:end_y  
                for x=begin_x:end_x  
                    num = num+1;
                    origin_bits(num) = Plane(x,y);
                end
            end  
        end  
    end
    if row-m*Block_size>=1 && col-n*Block_size>=1 
        begin_x = m*Block_size+1;
        begin_y = n*Block_size+1;
        end_x = row;
        end_y = col;
        for y=begin_y:end_y  
            for x=begin_x:end_x  
                num = num+1;
                origin_bits(num) = Plane(x,y);
            end
        end  
    end 

else 
    coor = traverse(3);
    l = floor(row/8); 
    w = floor(col/8);
    for i=1:l
        for j=1:w
            begin_x = (i-1)*8+1; 
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