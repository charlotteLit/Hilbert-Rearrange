clear
clc

% 读取图像
I = imread('测试图像\Lena.tiff');
origin_I = double(I); 

% 嵌入数据生成
num_D = 3000000;
rand('seed',0); 
D = round(rand(1,num_D)*1); 

% 加密、混洗、隐藏密钥
K_en = 1; 
K_sh = 2; 
K_hide=3; 

% 压缩参数
L_fix = 3; 
L = 4; 

% 预留空间
[ES_I,num_Of,PL_len,PL_room,total_Room] = Vacate_Encrypt(origin_I,L_fix,L,K_en,K_sh);

[row,col] = size(origin_I); 
num = ceil(log2(row))+ceil(log2(col))+2; 
if total_Room>=num 
    
    [stego_I,emD] = Data_Embed(ES_I,K_sh,K_hide,D); 
    num_emD = length(emD);
    
    [exD] = Data_Extract(stego_I,K_sh,K_hide,num_emD);
    
    [recover_I] = Image_Recover(stego_I,K_en,K_sh);

    % 图像对比
    figure(1);
    H=GetHis(origin_I);
    plot(0:255,H);
    area(0:255,H,'FaceColor','b')
    figure(2);
    H=GetHis(ES_I);
    plot(0:255,H);
    area(0:255,H,'FaceColor','b')
    figure(3);
    H=GetHis(stego_I);
    plot(0:255,H);
    area(0:255,H,'FaceColor','b')

    figure(4);
    subplot(141);
    imshow(origin_I,[]);title('原始图像');
    subplot(142);
    imshow(ES_I,[]);title('加密图像');
    subplot(143);
    imshow(stego_I,[]);title('载密图像');
    subplot(144);
    imshow(recover_I,[]);title('恢复图像');


    [m,n] = size(origin_I);
    bpp = num_emD/(m*n);
    
    check1 = isequal(emD,exD);
    check2 = isequal(origin_I,recover_I);
    if check1 == 1
        disp('提取数据与嵌入数据完全相同！')
    else
        disp('Warning！数据提取错误！')
    end
    if check2 == 1
        disp('重构图像与原始图像完全相同！')
    else
        disp('Warning！图像重构错误！')
    end
    
    if check1 == 1 && check2 == 1
        disp(['Embedding capacity equal to : ' num2str(num_emD) ' bits'] )
        disp(['Embedding rate equal to : ' num2str(bpp) ' bpp'])
        fprintf(['该测试图像------------ OK','\n\n']);
    else
        fprintf(['该测试图像------------ ERROR','\n\n']);
    end  
else 
    disp('辅助信息大于压缩空间，导致无法存储数据！') 
    fprintf(['该测试图像------------ ERROR','\n\n']);
end

