function [CBS] = BitPlanes_Compress(Plane,L_fix,L)
%----------------����BMPR�㷨������λƽ��----------------%
[origin_bits] = BitPlanes_Rearrange(Plane);
%----------------ѹ��������λƽ��ı�����----------------%
[compress_bits] = BitStream_Compress(origin_bits,L_fix,L);
CBS = compress_bits; %��¼ѹ���ı�����
end

