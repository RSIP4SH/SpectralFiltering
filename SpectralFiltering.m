clc,clear,close all;
M=256;
N=256;
ILPF=zeros(256);		%理想低通滤波器
IHPF=ones(256);			%理想高通滤波器
for i=1:256
    for j=1:256
        if sqrt((i-128)^2+(j-128)^2)<100
            ILPF(i,j)=1;
            IHPF(i,j)=0;
        end
    end
end
subplot(231),imshow(ILPF,[]),title('ILPF 2D频谱图');
subplot(232),imshow(IHPF,[]),title('IHPF 2D频谱图');
orginalPic=imread('cameraman.tif');
HILPF=zeros(512);			%对滤波器进行扩充
HILPF(129:384,129:384)=ILPF;
HIHPF=ones(512);			%对滤波器进行扩充
HIHPF(129:384,129:384)=IHPF;
subplot(233),imshow(frequencyFilter(orginalPic,HILPF)),title('理想低通滤波结果');
subplot(234),imshow(frequencyFilter(orginalPic,HIHPF)),title('理想高通滤波结果');
subplot(235),imshow(orginalPic),title('原始图像');
[z1,Fx,Fy]=mesh3D(IHPF);	 %作网格,并求出幅值
z2=mesh3D(ILPF);			 %求出幅值
figure,mesh(Fx,Fy,z1),title('ILPF 3D频谱图');
figure,mesh(Fx,Fy,z2);title('IHPF 3D频谱图');