function coor = traverse(n)
    index = 2^n -1;
    [x, y] = Hilbert(n);
    % 归一化到 0 到 1 的范围
    normalized_x = (x - min(x)) / (max(x) - min(x));
    normalized_y = (y - min(y)) / (max(y) - min(y));
    
    % 放大到 0 到 8 的范围
    scaled_x = round(normalized_x * index);
    scaled_y = round(normalized_y * index);
    
    % plot(scaled_x, scaled_y, '-o');
    coor = [scaled_x', scaled_y'];
end
