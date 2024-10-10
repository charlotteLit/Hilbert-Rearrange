clear
clc
%% ������������������
num_D = 2100000; %id_4628��ͼ��Ƕ��������2000000
rand('seed',0); %��������
D = round(rand(1,num_D)*1); %�����ȶ������
%% ͼ�����ݼ���Ϣ(BOSSbase_1.01),��ʽ:PGM,����:10000��
I_file_path = 'D:\ImageDatabase\BOSSbase_1.01\'; %����ͼ�����ݼ��ļ���·��
I_path_list = dir(strcat(I_file_path,'*.pgm'));  %��ȡ���ļ���������pgm��ʽ��ͼ��
img_num = length(I_path_list); %��ȡͼ��������
%% ��¼ÿ��ͼ��ĵ������Ϣ
num_BOSSbase = zeros(1,img_num); %��¼ÿ��ͼ���Ƕ���� 
bpp_BOSSbase = zeros(1,img_num); %��¼ÿ��ͼ���Ƕ����
over_BOSSbase = zeros(1,img_num);%��¼ÿ��ͼ���������ظ���
% room_BOSSbase = zeros(8,img_num);%��¼ÿ��ͼ�����λƽ���ѹ���ռ�
% len_BOSSbase = zeros(8,img_num); %��¼ÿ��ͼ�����λƽ���ѹ������������
%% ������Կ
K_en = 1; %ͼ�������Կ
K_sh = 2; %ͼ���ϴ��Կ
K_hide=3; %����Ƕ����Կ
%% ���ò���
Block_size = 4; %�ֿ��С���洢�ֿ��С�ı�������Ҫ������Ŀǰ��Ϊ4bits��
L_fix = 3; %�����������
L = 4; %��ͬ���������Ȳ���,�����޸�
%% ͼ�����ݼ�����
ERROR = 0; %������ͳ���޷��洢��Ϣ��ͼ����
for i=1:img_num
    %-------------------------------��ȡͼ��-------------------------------%
    I_name = I_path_list(i).name; %ͼ����
    I = imread(strcat(I_file_path,I_name));%��ȡͼ��
    origin_I = double(I);
    
    % figure;
    % subplot(111);imshow(origin_I,[]);title('ԭʼͼ��');

    %----------------�ճ�ͼ��ռ䲢���ܻ�ϴͼ�����������ߣ�----------------%
    [ES_I,num_Of,PL_len,PL_room,total_Room] = Vacate_Encrypt(origin_I,L_fix,L,K_en,K_sh);
    %--------���غɿռ����num������²Ž�������Ƕ�루������ѹ���ռ䣩--------%
    [row,col] = size(origin_I); %����origin_I������ֵ
    num = ceil(log2(row))+ceil(log2(col))+2; %��¼��ѹ���ռ��С��Ҫ�ı�����
    if total_Room>=num %��Ҫnum���ؼ�¼��ѹ���ռ��С
        %---------------�ڼ��ܻ�ϴͼ����Ƕ�����ݣ�����Ƕ���ߣ�---------------%
        [stego_I,emD] = Data_Embed(ES_I,K_sh,K_hide,D); 
        num_emD = length(emD);
        %-----------------������ͼ������ȡ������Ϣ�������ߣ�-----------------%
        [exD] = Data_Extract(stego_I,K_sh,K_hide,num_emD);
        %-----------------------�ָ�����ͼ�񣨽����ߣ�----------------------%
        [recover_I] = Image_Recover(stego_I,K_en,K_sh);
        %-----------------------------�����¼-----------------------------%
        [m,n] = size(origin_I);
        num_BOSSbase(i) = num_emD;
        bpp_BOSSbase(i) = num_emD/(m*n);
        over_BOSSbase(i) = num_Of; %��¼���Ԥ��������

        % for pl=1:8 %��¼ͼ��λƽ��ѹ�����Ⱥ�ѹ���ռ�
        %     len_BOSSbase(pl,i) = PL_len(pl);
        %     room_BOSSbase(pl,i) = PL_room(pl);
        % end

        %-----------------------------����ж�-----------------------------%
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
        %-----------------------------������-----------------------------%
        if check1 == 1 && check2 == 1
            bpp = bpp_BOSSbase(i);
            disp(['Embedding capacity equal to : ' num2str(num_emD)])
            disp(['Embedding rate equal to : ' num2str(bpp)])
            fprintf(['�� ',num2str(i),' ��ͼ��-------- OK','\n\n']);
        else
            ERROR = ERROR+1;
            if check1 ~= 1 && check2 == 1
                bpp_BOSSbase(i) = -1; %��ʾ��ȡ���ݲ���ȷ
            elseif check1 == 1 && check2 ~= 1
                bpp_BOSSbase(i) = -2; %��ʾͼ��ָ�����ȷ
            else
                bpp_BOSSbase(i) = -3; %��ʾ��ȡ���ݺͻָ�ͼ�񶼲���ȷ
            end
            fprintf(['�� ',num2str(i),' ��ͼ��-------- ERROR','\n\n']);
        end 
    else %��ͼ��̫���ӣ����Ԥ�����̫�࣬���¸�����Ϣ����ѹ���ռ�
        ERROR = ERROR+1;
        num_BOSSbase(i) = -1; %��ʾ����Ƕ��������Ϣ
        over_BOSSbase(i) = num_Of; %��¼���Ԥ��������
        % for pl=1:8 %��¼ͼ��λƽ��ѹ�����Ⱥ�ѹ���ռ�
        %     len_BOSSbase(pl,i) = PL_len(pl);
        %     room_BOSSbase(pl,i) = PL_room(pl);
        % end
        disp('������Ϣ����ѹ���ռ䣨��ѹ���ռ�С��0���������޷��洢���ݣ�') 
        fprintf(['�ò���ͼ��------------ ERROR','\n\n']);
    end  
end
%% ��������
save('num_BOSSbase')
save('bpp_BOSSbase')
save('over_BOSSbase')
% save('room_BOSSbase')
% save('len_BOSSbase')