
%% first one
%t=linspace(0,length(force)/2000,length(force));
fig1=figure
subplot(2,1,1);
plot(data(1).t,data(1).force);
hold on
plot(data(2).t,data(2).force);
hold on
plot(data(3).t,data(3).force);
hold on
plot(data(4).t,data(4).force);
hold on
plot(data(5).t,data(5).force);

subplot(2,1,2);
plot(data(1).t,data(1).EMG);
hold on
plot(data(2).t,data(2).EMG);
hold on
plot(data(3).t,data(3).EMG);
hold on
plot(data(4).t,data(4).EMG);
hold on
plot(data(5).t,data(5).EMG);

%% average force exerted within each segment of the force signal
exerted_avg_1=sum(data(1).force)/length(data(1).t);
exerted_avg_2=sum(data(2).force)/length(data(2).t);
exerted_avg_3=sum(data(3).force)/length(data(3).t);
exerted_avg_4=sum(data(4).force)/length(data(4).t);
exerted_avg_5=sum(data(5).force)/length(data(5).t);
%%  DR for each segment of the EMG signal

DR_1_1=max(data(1).EMG);
DR_1_2=min(data(1).EMG);
DR_1=DR_1_1-DR_1_2;

DR_1_3=max(data(2).EMG);
DR_1_4=min(data(2).EMG);
DR_2=DR_1_3-DR_1_4;

DR_1_5=max(data(3).EMG);
DR_1_6=min(data(3).EMG);
DR_3=DR_1_5-DR_1_6;

DR_1_7=max(data(4).EMG);
DR_1_8=min(data(4).EMG);
DR_4=DR_1_5-DR_1_6;

DR_1_9=max(data(5).EMG);
DR_1_10=min(data(5).EMG);
DR_5=DR_1_9-DR_1_10;


%% MS_1=immse(data(1).t,data(1).EMG)
MS_1=sum(data(1).EMG.^2)/length(data(1).EMG);
MS_2=sum(data(2).EMG.^2)/length(data(2).EMG);
MS_3=sum(data(3).EMG.^2)/length(data(3).EMG);
MS_4=sum(data(4).EMG.^2)/length(data(4).EMG);
MS_5=sum(data(5).EMG.^2)/length(data(5).EMG);

%% EMG signal
ZCR_1=mean(abs(diff(sign(data(1).EMG))));
ZCR_2=mean(abs(diff(sign(data(2).EMG))));
ZCR_3=mean(abs(diff(sign(data(3).EMG))));
ZCR_4=mean(abs(diff(sign(data(4).EMG))));
ZCR_5=mean(abs(diff(sign(data(5).EMG))));

%% compute TCR

TCR_1=mean(abs(sign(diff(data(1).EMG))))/(max(data(1).EMG)-min(data(1).EMG));
TCR_2=mean(abs(sign(diff(data(2).EMG))))/(max(data(2).EMG)-min(data(2).EMG));
TCR_3=mean(abs(sign(diff(data(3).EMG))))/(max(data(3).EMG)-min(data(3).EMG));
TCR_4=mean(abs(sign(diff(data(4).EMG))))/(max(data(4).EMG)-min(data(4).EMG));
TCR_5=mean(abs(sign(diff(data(5).EMG))))/(max(data(5).EMG)-min(data(5).EMG));


    
%% 7
fig2=figure
subplot(2,2,1)
plot(exerted_avg_1,DR_1,'ro');
hold on
plot(exerted_avg_2,DR_2,'ro')
hold on
plot(exerted_avg_3,DR_3,'ro')
hold on
plot(exerted_avg_4,DR_4,'ro')
hold on
plot(exerted_avg_5,DR_5,'ro')
title('DR VS AVERAGE FORCE')

subplot(2,2,2)
plot(exerted_avg_1,MS_1,'ro');
hold on
plot(exerted_avg_2,MS_2,'ro')
hold on
plot(exerted_avg_3,MS_3,'ro')
hold on
plot(exerted_avg_4,MS_4,'ro')
hold on
plot(exerted_avg_5,MS_5,'ro')
title('MS VS AVERAGE FORCE')


subplot(2,2,3)
plot(exerted_avg_1,ZCR_1,'ro');
hold on
plot(exerted_avg_2,ZCR_2,'ro')
hold on
plot(exerted_avg_3,ZCR_3,'ro')
hold on
plot(exerted_avg_4,ZCR_4,'ro')
hold on
plot(exerted_avg_5,ZCR_5,'ro')
title('ZCR VS AVERAGE FORCE')


subplot(2,2,4)
plot(exerted_avg_1,TCR_1,'ro');
hold on
plot(exerted_avg_2,TCR_2,'ro')
hold on
plot(exerted_avg_3,TCR_3,'ro')
hold on
plot(exerted_avg_4,TCR_4,'ro')
hold on
plot(exerted_avg_5,TCR_5,'ro')
title('TCR VS AVERAGE FORCE')

%% 8
polyfit_1=polyfit([exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5],[DR_1, DR_2, DR_3, DR_4, DR_5],1)
polyval_1=polyval(polyfit_1,[exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5])
subplot(2,2,1)
plot([exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5],polyval_1)


polyfit_2=polyfit([exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5],[MS_1, MS_2, MS_3, MS_4, MS_5],1)
polyval_2=polyval(polyfit_2,[exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5])
subplot(2,2,2)
plot([exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5],polyval_2)


polyfit_3=polyfit([exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5],[ZCR_1, ZCR_2, ZCR_3, ZCR_4, ZCR_5],1)
polyval_3=polyval(polyfit_3,[exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5])
subplot(2,2,3)
plot([exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5],polyval_3)


polyfit_4=polyfit([exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5],[TCR_1, TCR_2, TCR_3, TCR_4, TCR_5],1)
polyval_4=polyval(polyfit_4,[exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5])
subplot(2,2,4)
plot([exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5],polyval_4)


%% 
corr_1=corrcoef([exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5],[DR_1, DR_2, DR_3, DR_4, DR_5]);
corr_2=corrcoef([exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5],[MS_1, MS_2, MS_3, MS_4, MS_5]);
corr_3=corrcoef([exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5],[ZCR_1, ZCR_2, ZCR_3, ZCR_4, ZCR_5]);
corr_4=corrcoef([exerted_avg_1, exerted_avg_2, exerted_avg_3, exerted_avg_4, exerted_avg_5],[TCR_1, TCR_2, TCR_3, TCR_4, TCR_5]);

