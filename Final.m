
function varargout = Final(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Final_OpeningFcn, ...
                   'gui_OutputFcn',  @Final_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
function Final_OpeningFcn(hObject, eventdata, handles, varargin)
global img_1
global img_2
global img_3

cla(handles.axes3,'reset');
set(handles.axes3,'Visible','off');
set(handles.togglebutton1,'Visible','off');%����������ť
set(handles.togglebutton2,'Visible','off');
set(handles.togglebutton3,'Visible','off');
    
    
ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'down')
colormap gray
set(ha,'handlevisibility','off','visible','off');

handles.output = hObject;

guidata(hObject, handles);
function varargout = Final_OutputFcn(hObject, eventdata, handles) 
function mFile_Callback(hObject, eventdata, handles)
function mOpen_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3

[filename,pathname,filterindex]=uigetfile({'*.bmp';'*.jpg';'*.gif';'*.png';'*.tif'},'pick an image')
axes(handles.axes1);
fpath=[pathname filename];

if isequal(filename,0)||isequal(pathname,0)
    warndlg('Please select a picture first!','Warning');
    return;
else
    img_1=imread(fpath);
    imshow(img_1);
    setappdata(handles.figure1,'img_1',img_1);
end;
set(handles.togglebutton1,'Visible','on');
function mSave_Callback(hObject, eventdata, handles)
function mClose_Callback(hObject, eventdata, handles)
close;
function mGray_Callback(hObject, eventdata, handles)
function mColor_Callback(hObject, eventdata, handles)
function mDispose_Callback(hObject, eventdata, handles)
function mCut_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3

hRect=imrect(handles.axes1);
pos=getPosition(hRect);
newM=imcrop(img_1,pos);
delete(hRect);
axes(handles.axes2);
imshow(newM);
img_2=newM;
set(handles.togglebutton2,'Visible','on');
function GrayDispose_Callback(hObject, eventdata, handles)
function HisEqual_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
img_1=getappdata(handles.figure1,'img_1');
[m,n]=size(img_1);
k=zeros(1,256);
for i=1:m
    for j=1:n
        k(1,img_1(i,j)+1)=k(1,img_1(i,j)+1)+1;
    end
end

pro=zeros(1,256);
pro=double(pro);
k=double(k);
for i=1:256
    pro(1,i)=k(1,i)/(m*n);%m*nΪ�ܵ����ظ���
end
for i=2:256
    pro(1,i)=pro(1,i-1)+pro(1,i);
end
for i=1:256
    pro(1,i)=pro(1,i)*255;
end
img_2=double(img_1)
for i=1:m
    for j=1:n
        img_2(i,j)=pro(1,img_2(i,j)+1);
    end
end

img_2=uint8(img_2);
axes(handles.axes2)
imshow(img_2)
set(handles.togglebutton2,'Visible','on');



function Smooth_Callback(hObject, eventdata, handles)
function Sharpen_Callback(hObject, eventdata, handles)
function fft_Callback(hObject, eventdata, handles)
function Morphology_Callback(hObject, eventdata, handles)
function outLine_Callback(hObject, eventdata, handles)
function thresHold_Callback(hObject, eventdata, handles)
function Reversal_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
img_1=getappdata(handles.figure1,'img_1');
img_2=255-img_1; %ʵ�ַ�ת
axes(handles.axes2);
imshow(img_2);
set(handles.togglebutton2,'Visible','on');
function mlog_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
img_1=getappdata(handles.figure1,'img_1');
img_2=mat2gray(img_1,[0 255]);%��һ��
s=inputdlg('���������v(0<v<500)��','�����任');
v=str2num(s{1});%%���ַ���ת��Ϊ���ָ�ʽ
g1=log2(1+v*img_2)/log2(v+1)%�����任��ʽ

img_2=img_2*255;
img_2=uint8(img_2);
g1=g1*255;
g1=uint8(g1);
axes(handles.axes2);
imshow(g1);
img_2=g1;
set(handles.togglebutton2,'Visible','on');
function Gama_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
img_1=getappdata(handles.figure1,'img_1');
img_2=mat2gray(img_1,[0 255]);%��һ��

c=1;
s=inputdlg('������٤����(0<��<1)��','٤���任');
gamma=str2num(s{1});%%���ַ���ת��Ϊ���ָ�ʽ
img_2=c*(img_2.^gamma);%٤���任��ʽ
img_2=img_2*255;
img_2=uint8(img_2);
axes(handles.axes2);
imshow(img_2);
set(handles.togglebutton2,'Visible','on');
function Pratical_Callback(hObject, eventdata, handles)
function ch_size_Callback(hObject, eventdata, handles)
function filter_Callback(hObject, eventdata, handles)
function tansFm_Callback(hObject, eventdata, handles)
function col2gra_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
img_1=getappdata(handles.figure1,'img_1');
if(size(img_1,3)~=1)
    img_1=rgb2gray(img_1);
end
setappdata(handles.figure1,'img_1',img_1);
axes(handles.axes1);
imshow(img_1);
function big_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
img_1=getappdata(handles.figure1,'img_1');
s=inputdlg('������Ŵ���L(L>1)','�Ŵ�');
L=str2num(s{1});%%���ַ���ת��Ϊ���ָ�ʽ
if L<=1
    warndlg('Please input a number greater than one','Warning');
    return;
else
img_2=imresize(img_1,L);
axes(handles.axes2);
imshow(img_2);
figure(2);
imshow(img_2);
end
function small_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
img_1=getappdata(handles.figure1,'img_1');
s=inputdlg('��������С����S(0<S<1)','��С');
ss=str2num(s{1});%%���ַ���ת��Ϊ���ָ�ʽ
if L>=1
    warndlg('Please input a number less than one','Warning');
    return;
else
img_2=imresize(img_1,ss);
axes(handles.axes2);
imshow(img_2);
figure(2);
imshow(img_2);
end
function add_Noise_Callback(hObject, eventdata, handles)
function gaussian_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
img_1=getappdata(handles.figure1,'img_1');
img_2=imnoise(img_1,'gaussian');
set(handles.togglebutton2,'Visible','on');
axes(handles.axes2);
imshow(img_2);
setappdata(handles.figure1,'img_2',img_2);
function salt_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
img_1=getappdata(handles.figure1,'img_1');
img_2=imnoise(img_1,'salt & pepper');
set(handles.togglebutton2,'Visible','on');
axes(handles.axes2);
imshow(img_2);
setappdata(handles.figure1,'img_2',img_2);
function speckle_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
img_1=getappdata(handles.figure1,'img_1');
img_2=imnoise(img_1,'speckle');
set(handles.togglebutton2,'Visible','on');
axes(handles.axes2);
imshow(img_2);
setappdata(handles.figure1,'img_2',img_2);
function avefilt_Callback(hObject, eventdata, handles)

global img_1
global img_2
global img_3

s=inputdlg('�������˲�ģ���С����������','��ֵ�˲�');
n=str2num(s{1});%%���ַ���ת��Ϊ���ָ�ʽ
img_3=avefilt(img_2,n);
set(handles.axes3,'Visible','on');
set(handles.togglebutton3,'Visible','on');
axes(handles.axes3);
imshow(img_3);
function d=avefilt(x,n)   
a=ones(n);
[M,N]=size(x);
x1=double(x);
x2=x1;
for i=1:M-n+1
     for j=1:N-n+1
            c=x1(i:i+n-1,j:j+n-1).*a;
            s=sum(sum(c));
            x2(i+(n-1)/2,j+(n-1)/2)=s/(n*n);  
     end
end
d=uint8(x2);
function medfilt_Callback(hObject, eventdata, handles)

global img_1
global img_2
global img_3
img_2=getappdata(handles.figure1,'img_2');
s=inputdlg('�������˲�ģ���С����������','��ֵ�˲�');
n=str2num(s{1});%%���ַ���ת��Ϊ���ָ�ʽ
set(handles.axes3,'Visible','on');
set(handles.togglebutton3,'Visible','on');
img_3=medfil(img_2,n);
axes(handles.axes3);
imshow(img_3);
function d=medfil(x,n)   
a=ones(n);
[M,N]=size(x);
x1=double(x);
x2=x1;
for i=1:M-n+1
     for j=1:N-n+1
            c=x1(i:i+n-1,j:j+n-1);
            c=c(:);
            med=median(c);
            x2(i+(n-1)/2,j+(n-1)/2)=med;  
     end
end
d=uint8(x2);
function Sobel_Callback(hObject, eventdata, handles)
set(handles.axes3,'Visible','on');
set(handles.togglebutton3,'Visible','on');
global img_1
global img_2
global img_3
f=getappdata(handles.figure1,'img_1');
f=double(f);
[M,N]=size(f);

sobelx=[1,2,1;0,0,0;-1,-2,-1];
sobely=[1,0,-1;2,0,-2;1,0,-1];
g=zeros(M,N);
for i=2:M-1
     for j=2:N-1
            x=sum(sum(sobelx.*f(i-1:i+1,j-1:j+1)));
            y=sum(sum(sobely.*f(i-1:i+1,j-1:j+1)));
            g(i,j)=abs(x)+abs(y);
     end
end
g=uint8(g);
axes(handles.axes3);
imshow(g);
img_3=g;
function Robel_Callback(hObject, eventdata, handles)
set(handles.axes3,'Visible','on');
set(handles.togglebutton3,'Visible','on');
global img_1
global img_2
global img_3
f=getappdata(handles.figure1,'img_1');
f=double(f);
[M,N]=size(f);

robx=[1,0;0,-1];
roby=[0,1;-1,0];
h=zeros(M,N);
for i=2:M-1
     for j=2:N-1
            x=sum(sum(robx.*f(i:i+1,j:j+1)));
            y=sum(sum(roby.*f(i:i+1,j:j+1)));
            h(i,j)=abs(x)+abs(y);
     end
end
h=uint8(h);
axes(handles.axes3);
imshow(h);
img_3=h;
function Laplacian_1_Callback(hObject, eventdata, handles)
set(handles.axes3,'Visible','on');
set(handles.togglebutton3,'Visible','on');
global img_1
global img_2
global img_3
f=getappdata(handles.figure1,'img_1');
f=double(f);
[M,N]=size(f);

lap=[1,1,1;1,-8,1;1,1,1];
g=zeros(M,N);
for i=2:M-1
     for j=2:N-1
            g(i,j)=sum(sum(lap.*f(i-1:i+1,j-1:j+1)));
     end
end
g=uint8(g);
axes(handles.axes3);
imshow(g);
img_3=g;
function Laplacian_2_Callback(hObject, eventdata, handles)
set(handles.axes3,'Visible','on');
set(handles.togglebutton3,'Visible','on');
global img_1
global img_2
global img_3
f=getappdata(handles.figure1,'img_1');
f=double(f);
[M,N]=size(f);

lap=[0,1,0;1,-4,1;0,1,0];
h=zeros(M,N);
for i=2:M-1
     for j=2:N-1
            h(i,j)=sum(sum(lap.*f(i-1:i+1,j-1:j+1)));
     end
end
h=uint8(h);
axes(handles.axes3);
imshow(h);
img_3=h;
function radiobutton1_Callback(hObject, eventdata, handles)
function radiobutton2_Callback(hObject, eventdata, handles)
function fudu_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
set(handles.togglebutton2,'Visible','off');
set(handles.togglebutton3,'Visible','off');
img_1=getappdata(handles.figure1,'img_1');
J=img_1;
K=fft2(J);
img_2=fftshift(K);%��Ƶ��ת�Ƶ����ģ���ʵ�����ڸ���Ҷ�任ʱ������ĳ������

M=abs(img_2/256);
axes(handles.axes2);
imshow(uint8(M));
function phase_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
img_1=getappdata(handles.figure1,'img_1');

J=img_1;
K=fft2(J);
img_2=fftshift(K);
phase=abs(log(angle(img_2)*180/pi));
axes(handles.axes3);
imshow(phase,[]);
function Opening_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
img_1=getappdata(handles.figure1,'img_1');
s=inputdlg('������ṹԪ��B��С����������','������');
n=str2num(s{1});%%���ַ���ת��Ϊ���ָ�ʽ
B =ones(n);
img_2 = imopen(img_1, B);
set(handles.axes2,'HandleVisibility','ON');
axes (handles.axes2);
imshow(img_2);
function Closing_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
img_1=getappdata(handles.figure1,'img_1');
s=inputdlg('������ṹԪ��B��С����������','������');
n=str2num(s{1});%%���ַ���ת��Ϊ���ָ�ʽ
B =ones(n);
img_2 = imclose(img_1, B);
set(handles.axes2,'HandleVisibility','ON');
axes (handles.axes2);
imshow(img_2);
function Dilation_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
img_1=getappdata(handles.figure1,'img_1');
s=inputdlg('������ṹԪ��B��С����������','����');
n=str2num(s{1});%%���ַ���ת��Ϊ���ָ�ʽ
B =ones(n);
img_2 = imdilate(img_1, B);
set(handles.axes2,'HandleVisibility','ON');
axes (handles.axes2);
imshow(img_2);
function Erosion_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
img_1=getappdata(handles.figure1,'img_1');
s=inputdlg('������ṹԪ��B��С����������','��ʴ');
n=str2num(s{1});%%���ַ���ת��Ϊ���ָ�ʽ
B =ones(n);
img_2 = imerode(img_1, B);
set(handles.axes2,'HandleVisibility','ON');
axes (handles.axes2);
imshow(img_2);
function edge_sobel_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
f=getappdata(handles.figure1,'img_1');
f=double(f);
[M,N]=size(f);

sobelx=[1,2,1;0,0,0;-1,-2,-1];
sobely=[1,0,-1;2,0,-2;1,0,-1];
g=zeros(M,N);
for i=2:M-1
     for j=2:N-1
            x=sum(sum(sobelx.*f(i-1:i+1,j-1:j+1)));
            y=sum(sum(sobely.*f(i-1:i+1,j-1:j+1)));
            g(i,j)=abs(x)+abs(y);
     end
end
g=uint8(g);
set(handles.axes2,'Visible','on');
set(handles.togglebutton2,'Visible','on');
axes(handles.axes2);
imshow(g);
img_2=g;
function edge_robers_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
f=getappdata(handles.figure1,'img_1');
f=double(f);
[M,N]=size(f);

robx=[1,0;0,-1];
roby=[0,1;-1,0];
h=zeros(M,N);
for i=2:M-1
     for j=2:N-1
            x=sum(sum(robx.*f(i:i+1,j:j+1)));
            y=sum(sum(roby.*f(i:i+1,j:j+1)));
            h(i,j)=abs(x)+abs(y);
     end
end
h=uint8(h);
set(handles.axes2,'Visible','on');
set(handles.togglebutton2,'Visible','on');
axes(handles.axes2);
imshow(h);
img_2=h;
function edge_prewitt_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3

f=getappdata(handles.figure1,'img_1');
f=double(f);
[M,N]=size(f);

sobelx=[-1,-1,-1;0,0,0;1,1,1];
sobely=[-1,0,1;-1,0,1;-1,0,1];
g=zeros(M,N);
for i=2:M-1
     for j=2:N-1
            x=sum(sum(sobelx.*f(i-1:i+1,j-1:j+1)));
            y=sum(sum(sobely.*f(i-1:i+1,j-1:j+1)));
            g(i,j)=abs(x)+abs(y);
     end
end
g=uint8(g);
set(handles.axes2,'Visible','on');
set(handles.togglebutton2,'Visible','on');
axes(handles.axes2);
imshow(g);
img_2=g;
function edge_laplacian_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
f=getappdata(handles.figure1,'img_1');
f=double(f);
[M,N]=size(f);

lap=[0,1,0;1,-4,1;0,1,0];
h=zeros(M,N);
for i=2:M-1
     for j=2:N-1
            h(i,j)=sum(sum(lap.*f(i-1:i+1,j-1:j+1)));
     end
end
h=uint8(h);
set(handles.axes2,'Visible','on');
set(handles.togglebutton2,'Visible','on');
axes(handles.axes2);
imshow(h);
img_2=h;
function Thre_Otus_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3


I=double(img_1);
 
[m,n]=size(I);


count=zeros(256,1); 
pcount=zeros(256,1);
for i=1:m
    for j=1:n
       pixel=I(i,j);
        count(pixel+1)=count(pixel+1)+1;
    end
end
dw=0;
for i=0:255
    pcount(i+1)=count(i+1)/(m*n);
    dw=dw+i*pcount(i+1);
end
Th=0;
Thbest=0;
dfc=0;
dfcmax=0;
while (Th>=0 & Th<=255)
    dp1=0;
    dw1=0;
    for i=0:Th
        dp1=dp1+pcount(i+1);
        dw1=dw1+i*pcount(i+1);
    end
    if dp1>0
        dw1=dw1/dp1;
    end
    dp2=0;
    dw2=0;
    for i=Th+1:255
        dp2=dp2+pcount(i+1);
        dw2=dw2+i*pcount(i+1);
    end
    if dp2>0
        dw2=dw2/dp2;
    end
    dfc=dp1*(dw1-dw)^2+dp2*(dw2-dw)^2;
    if dfc>=dfcmax
        dfcmax=dfc;
        Thbest=Th;
    end
    Th=Th+1;
end
Th=Thbest;
for i=1:m
    for j=1:n
        if I(i,j)>=Th
            I(i,j)=255;
        else
            I(i,j)=0;
       end
    end
end
set(handles.axes2,'Visible','on');
set(handles.togglebutton2,'Visible','on');
axes (handles.axes2);
imshow(I);
axes (handles.axes5);
imhist(I);
img_2=I;
function Thre_two_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
I=img_1;
[m,n]=size(I);
s=inputdlg('��������ֵt(0<t<255)','��ֵ������');
v=str2num(s{1});%%���ַ���ת��Ϊ���ָ�ʽ
if v<0||v>255
    warndlg('Please input a number in 0-255','Warning');
    return;
else
for i=1:m
    for j=1:n
        temp=I(i,j);
        if(temp>=v)%�Ҷ�ֵ�����������ֵ����ȡΪ255
            I(i,j)=255;
        else
            I(i,j)=0;%����ȡΪ0
        end
    end
end

set(handles.axes2,'Visible','on');
set(handles.togglebutton2,'Visible','on');
axes (handles.axes2);
imshow(I);
axes (handles.axes5);
imhist(I);
img_2=I;
end;
function Untitled_2_Callback(hObject, eventdata, handles)
cla(handles.axes1,'reset');
cla(handles.axes2,'reset');
cla(handles.axes3,'reset');
cla(handles.axes4,'reset');
cla(handles.axes5,'reset');
cla(handles.axes6,'reset');

set(handles.axes1,'Visible','off');
set(handles.axes2,'Visible','off');
set(handles.axes3,'Visible','off');
set(handles.axes4,'Visible','off');
set(handles.axes5,'Visible','off');
set(handles.axes6,'Visible','off');

set(handles.togglebutton1,'Visible','off');
set(handles.togglebutton2,'Visible','off');
set(handles.togglebutton3,'Visible','off');
function Untitled_3_Callback(hObject, eventdata, handles)
function gaotong_Callback(hObject, eventdata, handles)
function ideal_h_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
f=getappdata(handles.figure1,'img_1');
f = mat2gray(f,[0 255]);
[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_1 = ones(P,Q);
H_2 = ones(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        if(D <= 30)  H_1(x+(P/2)+1,y+(Q/2)+1) = 0; end    
        if(D <= 160) H_2(x+(P/2)+1,y+(Q/2)+1) = 0; end
     end
end

G_1 = H_1 .* F;
G_2 = H_2 .* F;

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);         

for x = 1:1:M
    for y = 1:1:N
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
    end
end
axes(handles.axes2)
imshow(log(1 + abs(G_1)),[ ]);
axes(handles.axes3)
imshow(g_1,[0 1]);
function butter_h_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
f=getappdata(handles.figure1,'img_1');
f = mat2gray(f,[0 255]);

[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_1 = zeros(P,Q);
H_2 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        D_0 = 100;
        H_1(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D_0/D)^2);   
        H_2(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D_0/D)^6);
     end
end


G_1 = H_1 .* F;
G_2 = H_2 .* F;

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);         

for x = 1:1:M
    for y = 1:1:N
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
    end
end
axes(handles.axes2)
imshow(log(1 + abs(G_1)),[ ]);
axes(handles.axes3)
imshow(g_1,[0 1]);
function Untitled_7_Callback(hObject, eventdata, handles)
function ideal_l_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
f=getappdata(handles.figure1,'img_1');
f = mat2gray(f,[0 255]);

[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_1 = zeros(P,Q);
H_2 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        if(D <= 60)  H_1(x+(P/2)+1,y+(Q/2)+1) = 1; end    
        if(D <= 160)  H_2(x+(P/2)+1,y+(Q/2)+1) = 1; end
     end
end

G_1 = H_1 .* F;
G_2 = H_2 .* F;

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);         

for x = 1:1:M
    for y = 1:1:N
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
    end
end

axes(handles.axes2)
imshow(log(1 + abs(G_1)),[ ]);
axes(handles.axes3)
imshow(g_1,[0 1]);
function butter_l_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
f=getappdata(handles.figure1,'img_1');
f = mat2gray(f,[0 255]);

[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_1 = zeros(P,Q);
H_2 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        D_0 = 100;
        H_1(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^2);   
        H_2(x+(P/2)+1,y+(Q/2)+1) = 1/(1+(D/D_0)^6);
     end
end


G_1 = H_1 .* F;
G_2 = H_2 .* F;

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);         

for x = 1:1:M
    for y = 1:1:N
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
    end
end
axes(handles.axes2)
imshow(log(1 + abs(G_1)),[ ]);
axes(handles.axes3)
imshow(g_1,[0 1]);
function gaussian_l_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
f=getappdata(handles.figure1,'img_1');
f = mat2gray(f,[0 255]);

[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_1 = zeros(P,Q);
H_2 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        D_0 = 60;
        H_1(x+(P/2)+1,y+(Q/2)+1) = exp(-(D*D)/(2*D_0*D_0));   
        D_0 = 160;
        H_2(x+(P/2)+1,y+(Q/2)+1) = exp(-(D*D)/(2*D_0*D_0));
     end
end

G_1 = H_1 .* F;
G_2 = H_2 .* F;

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);         

for x = 1:1:M
    for y = 1:1:N
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
    end
end

axes(handles.axes2)
imshow(log(1 + abs(G_1)),[ ]);
axes(handles.axes3)
imshow(g_1,[0 1]);
function gaussian_h_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
f=getappdata(handles.figure1,'img_1');
f = mat2gray(f,[0 255]);

[M,N] = size(f);
P = 2*M;
Q = 2*N;
fc = zeros(M,N);

for x = 1:1:M
    for y = 1:1:N
        fc(x,y) = f(x,y) * (-1)^(x+y);
    end
end

F = fft2(fc,P,Q);

H_1 = zeros(P,Q);
H_2 = zeros(P,Q);

for x = (-P/2):1:(P/2)-1
     for y = (-Q/2):1:(Q/2)-1
        D = (x^2 + y^2)^(0.5);
        D_0 = 60;
        H_1(x+(P/2)+1,y+(Q/2)+1) = 1 - exp(-(D*D)/(2*D_0*D_0));   
        D_0 = 160;
        H_2(x+(P/2)+1,y+(Q/2)+1) = 1 - exp(-(D*D)/(2*D_0*D_0));
     end
end

G_1 = H_1 .* F;
G_2 = H_2 .* F;

g_1 = real(ifft2(G_1));
g_1 = g_1(1:1:M,1:1:N);

g_2 = real(ifft2(G_2));
g_2 = g_2(1:1:M,1:1:N);         

for x = 1:1:M
    for y = 1:1:N
        g_1(x,y) = g_1(x,y) * (-1)^(x+y);
        g_2(x,y) = g_2(x,y) * (-1)^(x+y);
    end
end

axes(handles.axes2)
imshow(log(1 + abs(G_1)),[ ]);
axes(handles.axes3)
imshow(g_1,[0 1]);
function togglebutton1_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
var=get(handles.togglebutton1,'value');
if var
    axes(handles.axes4)
    imhist(img_1);
else
    
    cla(handles.axes4,'reset');
    set(handles.axes4,'Visible','off');
end
function axes3_CreateFcn(hObject, eventdata, handles)
function togglebutton2_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
var=get(handles.togglebutton2,'value');
if var
    axes(handles.axes5)
    imhist(img_2);
else
    cla(handles.axes5,'reset');
    set(handles.axes5,'Visible','off');
end
function togglebutton3_Callback(hObject, eventdata, handles)
global img_1
global img_2
global img_3
var=get(handles.togglebutton3,'value');
if var
    axes(handles.axes6)
    imhist(img_3);
else
    cla(handles.axes6,'reset');
    set(handles.axes6,'Visible','off');
end
function axes4_CreateFcn(hObject, eventdata, handles)
function image_cut_Callback(hObject, eventdata, handles)
function save1_Callback(hObject, eventdata, handles)
[FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...
                                 '*.bmp','Bitmap(*.bmp)';...
                                 '*.gif','GIF(*.gif)';...
                                 '*.*',  'All Files (*.*)'},...
                                 'Save Picture','Untitled');
if FileName==0
    return;
else
    h=getframe(handles.axes1);
    imwrite(h.cdata,[PathName,FileName]);
end;
function save2_Callback(hObject, eventdata, handles)
[FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...
                                 '*.bmp','Bitmap(*.bmp)';...
                                 '*.gif','GIF(*.gif)';...
                                 '*.*',  'All Files (*.*)'},...
                                 'Save Picture','Untitled');
if FileName==0
    return;
else
    h=getframe(handles.axes3);
    imwrite(h.cdata,[PathName,FileName]);
end;
function save3_Callback(hObject, eventdata, handles)
[FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...
                                 '*.bmp','Bitmap(*.bmp)';...
                                 '*.gif','GIF(*.gif)';...
                                 '*.*',  'All Files (*.*)'},...
                                 'Save Picture','Untitled');
if FileName==0
    return;
else
    h=getframe(handles.axes2);
    imwrite(h.cdata,[PathName,FileName]);
end;