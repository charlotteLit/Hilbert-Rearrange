clear
clc

% ��ȡͼ��
I = imread('����ͼ��\Lena.tiff');
origin_I = double(I); 

% Ƕ����������
num_D = 3000000;
rand('seed',0); 
D = round(rand(1,num_D)*1); 

% ���ܡ���ϴ��������Կ
K_en = 1; 
K_sh = 2; 
K_hide=3; 

% ѹ������
L_fix = 3; 
L = 4; 

% Ԥ���ռ�
[ES_I,num_Of,PL_len,PL_room,total_Room] = Vacate_Encrypt(origin_I,L_fix,L,K_en,K_sh);

[row,col] = size(origin_I); 
num = ceil(log2(row))+ceil(log2(col))+2; 
if total_Room>=num 
    
    [stego_I,emD] = Data_Embed(ES_I,K_sh,K_hide,D); 
    num_emD = length(emD);
    
    [exD] = Data_Extract(stego_I,K_sh,K_hide,num_emD);
    
    [recover_I] = Image_Recover(stego_I,K_en,K_sh);

    % ͼ��Ա�
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
    imshow(origin_I,[]);title('ԭʼͼ��');
    subplot(142);
    imshow(ES_I,[]);title('����ͼ��');
    subplot(143);
    imshow(stego_I,[]);title('����ͼ��');
    subplot(144);
    imshow(recover_I,[]);title('�ָ�ͼ��');


    [m,n] = size(origin_I);
    bpp = num_emD/(m*n);
    
    check1 = isequal(emD,exD);
    check2 = isequal(origin_I,recover_I);
    if check1 == 1
        disp('��ȡ������Ƕ��������ȫ��ͬ��')
    else
        disp('Warning��������ȡ����')
    end
    if check2 == 1
        disp('�ع�ͼ����ԭʼͼ����ȫ��ͬ��')
    else
        disp('Warning��ͼ���ع�����')
    end
    
    if check1 == 1 && check2 == 1
        disp(['Embedding capacity equal to : ' num2str(num_emD) ' bits'] )
        disp(['Embedding rate equal to : ' num2str(bpp) ' bpp'])
        fprintf(['�ò���ͼ��------------ OK','\n\n']);
    else
        fprintf(['�ò���ͼ��------------ ERROR','\n\n']);
    end  
else 
    disp('������Ϣ����ѹ���ռ䣬�����޷��洢���ݣ�') 
    fprintf(['�ò���ͼ��------------ ERROR','\n\n']);
end

