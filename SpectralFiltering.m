clc,clear,close all;
M=256;
N=256;
ILPF=zeros(256);		%�����ͨ�˲���
IHPF=ones(256);			%�����ͨ�˲���
for i=1:256
    for j=1:256
        if sqrt((i-128)^2+(j-128)^2)<100
            ILPF(i,j)=1;
            IHPF(i,j)=0;
        end
    end
end
subplot(231),imshow(ILPF,[]),title('ILPF 2DƵ��ͼ');
subplot(232),imshow(IHPF,[]),title('IHPF 2DƵ��ͼ');
orginalPic=imread('cameraman.tif');
HILPF=zeros(512);			%���˲�����������
HILPF(129:384,129:384)=ILPF;
HIHPF=ones(512);			%���˲�����������
HIHPF(129:384,129:384)=IHPF;
subplot(233),imshow(frequencyFilter(orginalPic,HILPF)),title('�����ͨ�˲����');
subplot(234),imshow(frequencyFilter(orginalPic,HIHPF)),title('�����ͨ�˲����');
subplot(235),imshow(orginalPic),title('ԭʼͼ��');
[z1,Fx,Fy]=mesh3D(IHPF);	 %������,�������ֵ
z2=mesh3D(ILPF);			 %�����ֵ
figure,mesh(Fx,Fy,z1),title('ILPF 3DƵ��ͼ');
figure,mesh(Fx,Fy,z2);title('IHPF 3DƵ��ͼ');