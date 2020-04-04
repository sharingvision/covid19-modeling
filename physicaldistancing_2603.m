
clear;
close all;

step=350;
%PARAMETER------------------------------------------
carr_capacity=100000000;
alfa=0.25;
carr_prob=1;
supress_gain=1;
K(1:30)=1;
delay_deteksi=3;
P(1:7)=0.32 ; P(8:14)=0.2; 
P(15:21)=0.15 ; P(22:28)=0.05;             %% jumlah penularan rata-rata untuk setiap stage per orang terinfeksi
P(29:30)=0.01;

%Setting variabel------------------
carr_prob(step)=0;
surpress_gain(step)=0;
akumulasi_terjangkit(step)=0;
imported_case(30,step)=0;
prob_down(1:step)=1;
confirmed_case(1:step)=0;

%kondisi awal-----------------------
x(1:30,1)=0;x(8,1)=0;
akumulasi_terjangkit(1)=x(1,1);
surpress_gain(1)=1;
imported_case(1,1)=38;imported_case(1,5)=0;

%kontrol

%menekan probabilitas penyebaran
prob_down(30:step)=1;
Deteksi(1:7)=0.05;Deteksi(8:14)=0.4;Deteksi(15:21)=0.4;Deteksi(22:28)=0.4;Deteksi(29:30)=0.05;
K=K-Deteksi;                                %% persentase terjangkit dari stage ke k yang masuk ke stage k+1


for k=1:step
    confirmed_case(k+delay_deteksi)=confirmed_case(k-1+delay_deteksi)+Deteksi*x(:,k);
    daily_confirmed_case(k+delay_deteksi)=Deteksi*x(:,k);
    x(:,k+1)=[supress_gain(k)*K(1)*P(1)*prob_down(k) supress_gain(k)*K(2)*P(2)*prob_down(k) supress_gain(k)*K(3)*P(3)*prob_down(k) supress_gain(k)*K(4)*P(4)*prob_down(k) supress_gain(k)*K(5)*P(5)*prob_down(k) supress_gain(k)*K(6)*P(6)*prob_down(k) supress_gain(k)*K(7)*P(7)*prob_down(k) supress_gain(k)*K(8)*P(8)*prob_down(k) supress_gain(k)*K(9)*P(9)*prob_down(k) supress_gain(k)*K(10)*P(10)*prob_down(k) supress_gain(k)*K(11)*P(11)*prob_down(k) supress_gain(k)*K(12)*P(12)*prob_down(k) supress_gain(k)*K(13)*P(13)*prob_down(k) supress_gain(k)*K(14)*P(14)*prob_down(k) supress_gain(k)*K(15)*P(15)*prob_down(k) supress_gain(k)*K(16)*P(16)*prob_down(k) supress_gain(k)*K(17)*P(17)*prob_down(k) supress_gain(k)*K(18)*P(18)*prob_down(k) supress_gain(k)*K(19)*P(19)*prob_down(k) supress_gain(k)*K(20)*P(20)*prob_down(k) supress_gain(k)*K(21)*P(21)*prob_down(k) supress_gain(k)*K(22)*P(22)*prob_down(k) supress_gain(k)*K(23)*P(23)*prob_down(k) supress_gain(k)*K(24)*P(24)*prob_down(k) supress_gain(k)*K(25)*P(25)*prob_down(k) supress_gain(k)*K(26)*P(26)*prob_down(k) supress_gain(k)*K(27)*P(27)*prob_down(k) supress_gain(k)*K(28)*P(28)*prob_down(k) supress_gain(k)*K(29)*P(29)*prob_down(k) supress_gain(k)*K(30)*P(30)*prob_down(k) ;
        K(1) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 K(2) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 K(3) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 K(4) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 K(5) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 K(6) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 K(7) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 K(8) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 K(9) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 K(10) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 K(11) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 K(12) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 K(13) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 K(14) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 K(15) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 K(16) 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 K(17) 0 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 K(18) 0 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 K(19) 0 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 K(20) 0 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 K(21) 0 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 K(22) 0 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 K(23) 0 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 K(24) 0 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 K(25) 0 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 K(26) 0 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 K(27) 0 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 K(28) 0 0;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 K(29) 0]*x(:,k)+imported_case(:,k);
   akumulasi_terjangkit(k+1)=akumulasi_terjangkit(k)+x(1,k+1);
   tidakbisa_tertular=akumulasi_terjangkit(k+1);
   belum_terjangkit=carr_capacity-tidakbisa_tertular;
   carr_prob(k+1)=(belum_terjangkit)/carr_capacity;
   supress_gain(k+1)=(1-(tidakbisa_tertular/carr_capacity)^alfa);   
end


empirik=[0 2 2 2 2 4 4 5 19 27 34 34 69 96 117 134 172 227 311 369 450 514 579 686 790 893];



%persiapan output simulasi
akumulasi_terjangkit_round=round(akumulasi_terjangkit);
x_round=round(x);
confirmed_case_round=round(confirmed_case)
akumulasi_terjangkit;
n=linspace(1,step+1,step+1);
x;
t1=datetime(2020,3,1);
t2=t1+step;
tanggal=datetime(t1:t2);

%plotting
plot(tanggal,akumulasi_terjangkit,tanggal,confirmed_case(1:step+1),'-');
figure
%plot(tanggal(1:26),confirmed_case(1:26),'-', tanggal(1:26),empirik,'.');
figure
plot(tanggal,x(1,:),tanggal,daily_confirmed_case(1:step+1),'-')
%figure;
%plot(x(1,:),'-');
%figure;
%plot(confirmed_case_round)




