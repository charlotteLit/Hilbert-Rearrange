function [CBS] = BitPlanes_Compress(Plane,L_fix,L)
%----------------根据BMPR算法重排列位平面----------------%
[origin_bits] = BitPlanes_Rearrange(Plane);
%----------------压缩重排列位平面的比特流----------------%
[compress_bits] = BitStream_Compress(origin_bits,L_fix,L);
CBS = compress_bits; %记录压缩的比特流
end

