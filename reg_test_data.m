% Kjøredata
clear; clf; clc

starttid = datenum('18:35:00.000', 'HH:MM:SS.FFF').*(24*60*60);
stopptid = datenum('18:48:00.000', 'HH:MM:SS.FFF').*(24*60*60);

datalog = importdata('reg_test_gyro.txt');

t = [];
hiv = [];
rull = [];
stamp = [];

for i = 1:numel(datalog)
    linje = datalog(i);
    tid = datenum(strrep(char(extractBetween(linje, "09 ", " INFO")), ...
        ',','.'),'HH:MM:SS.FFF').*(24*60*60);
    datatype = char(extractBetween(linje, "'", "':"));
    verdier = char(extractBetween(linje, "[", "]"));
    verdier = split(verdier, ", ");
    if (tid >= starttid) && (tid <= stopptid) 
        t = [t; tid-starttid];
        hiv = [hiv, str2double(verdier(1))/10];
        rull = [rull, str2double(verdier(2))];
        stamp = [stamp, -str2double(verdier(3))];
    end
end


% all data
figure(1)
plot(t,hiv,t,rull,t,stamp)
legend('hiv [dm]','rull [°]','stamp [°]'); grid on;

%translasjon 1
figure(3)
subplot(2,1,1)
plot(t(564:728)-t(564),hiv(564:728),t(564:728)-t(564),rull(564:728),t(564:728)-t(564),stamp(564:728),'LineWidth',2)
legend('hiv [dm]','rull [°]','stamp [°]'); grid on; xticks(0:1:20); xlim([0,15]);
title('Translasjon i jag-retning uten regulering'); yticks(0:2:20); ylim([0,20]);
set(gca,'FontSize', 14)


subplot(2,1,2)
plot(t(1402:1559)-t(1402),hiv(1402:1559),t(1402:1559)-t(1402),rull(1402:1559),t(1402:1559)-t(1402),stamp(1402:1559),'LineWidth',2)
legend('hiv [dm]','rull [°]','stamp [°]'); grid on; xlabel('Tid [s]'); xticks(0:1:20); xlim([0,15]);
title('Translasjon i jag-retning med regulering'); yticks(-2:1:10); ylim([-1,9]);
set(gca,'FontSize', 14)

%translasjon 2
% figure(4)
% subplot(2,1,1)
% plot(t(2219:2411)-t(2219),hiv(2219:2411),t(2219:2411)-t(2219),rull(2219:2411),t(2219:2411)-t(2219),stamp(2219:2411))
% legend('hiv [dm]','rull [°]','stamp [°]'); grid on; xlabel('tid [s]'); xticks(0:2:20); xlim([0,15]);
% title('Translasjon i jag-retning uten regulering'); yticks(-28:4:16); ylim([-28,16]);
% 
% subplot(2,1,2)
% plot(t(3095:3291)-t(3095),hiv(3095:3291),t(3095:3291)-t(3095),rull(3095:3291),t(3095:3291)-t(3095),stamp(3095:3291))
% legend('hiv [dm]','rull [°]','stamp [°]'); grid on; xlabel('tid [s]'); xticks(0:2:20); xlim([0,15]);
% title('Translasjon i jag-retning med regulering'); yticks(-10:2:10); ylim([-5,10]);

%vekt på manipulator
figure(5)
subplot(2,1,1)
plot(t(4355:4485)-t(4355),hiv(4355:4485),t(4355:4485)-t(4355),rull(4355:4485),t(4355:4485)-t(4355),stamp(4355:4485),'LineWidth',2)
legend('hiv [dm]','rull [°]','stamp [°]'); grid on;  xticks(0:1:14); xlim([0,14]);
title('Vekt på manipulator uten regulering'); yticks(-40:5:20); ylim([-40,20]);
set(gca,'FontSize', 14)

subplot(2,1,2)
plot(t(5251:5645)-t(5251),hiv(5251:5645),t(5251:5645)-t(5251),rull(5251:5645),t(5251:5645)-t(5251),stamp(5251:5645),'LineWidth',2)
legend('hiv [dm]','rull [°]','stamp [°]'); grid on; xlabel('Tid [s]'); xticks(0:1:17); xlim([0,16.5]);
title('Vekt på manipulator med regulering'); yticks(-18:2:12); ylim([-17,12]);
set(gca,'FontSize', 14)

% dytt
figure(6)
subplot(2,1,1)
plot(t(6244:6349)-t(6244),hiv(6244:6349),t(6244:6349)-t(6244),rull(6244:6349),t(6244:6349)-t(6244),stamp(6244:6349),'LineWidth',2)
legend('hiv [dm]','rull [°]','stamp [°]'); grid on; xticks(0:1:15); xlim([0,10]);
title('Dytt uten regulering'); yticks(-30:5:50); ylim([-30,50]);
set(gca,'FontSize', 14)

subplot(2,1,2)
plot(t(6522:6639)-t(6522),hiv(6522:6639),t(6522:6639)-t(6522),rull(6522:6639),t(6522:6639)-t(6522),stamp(6522:6639),'LineWidth',2)
legend('hiv [dm]','rull [°]','stamp [°]'); grid on; xlabel('Tid [s]'); xticks(0:1:10); xlim([0,10]);
title('Dytt med regulering'); yticks(-28:4:36); ylim([-25,36]);
set(gca,'FontSize', 14)



