# Hilbert-Rearrange
### 对源文件进行修改
在源代码基础上，修改位重排方式

四种排列方式：00,01,10,11
➡️
Hilbert遍历8*8大小的块

### Hilbert遍历顺序

### 函数说明
- Vacate_Encrypt 空出图像空间，加密原始图像
  - Prediction_Error 计算预测误差
  - Vacate_Room 预留空间
    - BitPlanes_Extract 提取位平面
    - BitPlanes_Compress 位平面压缩
      - BitPlanes_Rearrange 位平面重排
      - BitStream_Compress 比特流重排
    - BitPlanes_Embed 嵌入位平面
  - Image_Shuffle 图像混洗
- Data_Embed 数据嵌入
  - Image_ReShuffle 图像反混洗
  - Data_Encrypt 数据加密
- Data_Extract 数据提取
- Image_Recover 图像恢复
  - BitStream_DeCompress 位平面解压缩
  - BitPlanes_Recover 恢复位平面