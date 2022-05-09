clear; 
clc; clf;

rho = 2500;
g = 9.81;
avtheta = 26;
L = 7.2/1000;
d = 1.2/1000;






%%
fh = figure(5);
fh.WindowState = 'maximized';

P_star = [0.087,0.175,0.242,0.471,0.834,1.466,2.003,2.501,3.254,4.894,6.83,8.827];
mu_exp = [0.336,0.345,0.302,0.288,0.275,0.348,0.338,0.335,0.34,0.37,0.394,0.424];
plot(P_star,mu_exp,"-.r*","markersize",10, "Linewidth",2)
xlim([0 8.9]);
ylim([0.261 0.43]);
set(gca,'FontSize',20)
xlabel('P^*',"FontSize",20);
ylabel('\mu',"FontSize",25);
hold on

%%
fh = figure(6);
fh.WindowState = 'maximized';

counter = 0;
for theta = 14:0.1:26
    counter = counter + 1;
    surface = 30*d^2;
    M = 3/1000;
    P = cosd(theta)*M*g/surface;
    mu = tand(avtheta);
    ksi = tand(theta);
    tm = ((2*mu*(mu-ksi)*(1+mu^2)*(1-mu*ksi))^(0.5)-2*mu*(mu-ksi))/(2*mu*(1+mu*ksi));
    f = (1+mu*ksi)/(1-mu^2-4*mu*tm);
    beta = 0.8;
    h = beta*P/(rho*g);
    Fd = (rho*g*(h^2)*L/2)*cosd(theta)*f;
    T = P*(L^2)*sind(theta);
    all = 2*L*cosd(theta).*sind(theta)/(d*(beta^2)*f);
    i = abs(theta-26);
    count(counter) = i;
    final(counter) = all;
end 


x = 12; y = 4;
patch([x fliplr(count)], [y fliplr(final)] ,[0,0.85, 1]);
hold on

plot(count, final,"r-.",'LineWidth',4);
xlim([0 12]);
ylim([0 4]);
xlabel('\Delta\Theta (deg)');
ylabel('P^*');
set(gca,'FontSize',20)
hold on

DEMx = [0,0,1,1.205,1.36,1.527,1.646,1.789,1.932,2.076,2.219,2.362,2.505,2.648,2.767,...
    2.887,3.03,3.173,3.316,3.459,3.459,3.459,3.602,3.746,3.865,3.984,4.127,...
    4.27,4.414,4.581,4.748,4.915,5.034,5.177,5.296,5.439,5.606,5.75,5.893,...
    6.036,6.203,6.322,6.465,6.632,6.775,6.895,7.038,7.229,7.372,7.515,7.634,...
    7.753,7.92,8.04,8.183,8.302,8.469,8.588,8.732,8.899,9.018,9.161,9.304,...
    9.423,9.543,9.757,9.877,10.044,10.235,10.378,10.569,10.759,10.903,11.046,...
    11.237,11.38,11.523,11.642,11.761,11.917,12];
DEMx = flip(DEMx,2);

DEMy = [0,0.25,0.3,0.326,0.337,0.347,0.358,0.358,0.358,0.368,0.379,0.4,0.411,0.421,0.432,...
    0.442,0.463,0.463,0.484,0.474,0.463,0.484,0.484,0.484,0.474,0.484,0.484,...
    0.495,0.505,0.505,0.516,0.516,0.526,0.547,0.558,0.579,0.6,0.642,0.663,...
    0.674,0.695,0.684,0.674,0.642,0.621,0.611,0.589,0.6,0.589,0.589,0.6,0.611,...
    0.632,0.642,0.653,0.674,0.663,0.674,0.674,0.674,0.684,0.674,0.695,0.684,...
    0.705,0.705,0.716,0.716,0.716,0.716,0.705,0.695,0.705,0.705,0.716,0.716,...
    0.716,0.705,0.716,0.705,0.711];
DEMy = flip(DEMy,2);

circles_x = [1,1.932,3.03,3.984,5.034,6.036,7.038,8.04,9.018,10.044,11.046,12];
circles_y = [0.3,0.358,0.463,0.484,0.526,0.674,0.589,0.642,0.674,0.716,0.705,0.711];

patch([count fliplr(DEMx)], [final fliplr(DEMy)], 'y');
hold on

x = 12; y = 0;
patch([x fliplr(DEMx)], [y fliplr(DEMy)] ,[0.5,1, 0.610]);
hold on

scatter(circles_x,circles_y,40,"filled","bo")
hold on

plot(DEMx,DEMy,"k-.");
hold on

experimental_x = [2.044,2.223,2.414,2.606,2.749,2.892,3.036,3.179,3.323,3.442,...
    3.538,3.657,3.729,3.849,3.992,4.088,4.207,4.327,4.422,4.542,4.661,4.781,...
    4.948,5.068,5.187,5.307,5.474,5.57,5.689,5.833,5.952,6.072,6.215,6.335,...
    6.478,6.574,6.669,6.741,6.801,6.7770,6.6930,6.6220,6.4780,6.3110,6.1670,...
    6.0240,5.8330,5.6650,5.5220,5.3780,5.2110,5.0440,4.9000,4.7330,4.5660,...
    4.4460,4.2550,4.0880,3.9200,3.7290,3.5380,3.3710,3.1790,3.0120,2.8210,...
    2.6530,2.4860,2.3190,2.1750,2.0200];

experimental_y = [2.478,2.478,2.457,2.436,2.404,2.373,2.331,2.299,2.257,2.226,...
    2.205,2.173,2.131,2.11,2.079,2.037,2.005,1.974,1.932,1.89,1.848,1.816,...
    1.795,1.764,1.722,1.701,1.669,1.638,1.617,1.585,1.554,1.533,1.501,1.459,...
    1.417,1.375,1.323,1.249,1.155,1.1020,1.0500,1.0080,0.9450,0.8920,0.8710,...
    0.8500,0.8290,0.8080,0.7870,0.7660,0.7450,0.7240,0.7140,0.6930,0.6930,...
    0.6820,0.6720,0.6510,0.6400,0.6300,0.6090,0.6090,0.5980,0.5980,0.5770,...
    0.5460,0.5460,0.5350,0.5140,0.5040];
plot(experimental_x, experimental_y,"k","linewidth",1.5)
set(gca,'FontSize',20)
hold on

bs_y = [0.2, 0.9, 1.7, 2.6];
plot([4.35,4.35,4.35,4.35], bs_y,"-r.","markersize",20)
for i = 1:4
    str = "  (b_"+string(i)+")";
    text(4.35,bs_y(i), str, "Fontsize",15);
end
hold on

%%
fh = figure(7);
fh.WindowState = 'maximized';

counter = 0;
for theta = 0:0.1:90
    counter = counter + 1;
    surface = 30*d^2;
    M = 3/1000;
    P = cosd(theta)*M*g/surface;
    mu = tand(avtheta);
    ksi = tand(theta);
    tm = ((2*mu*(mu-ksi)*(1+mu^2)*(1-mu*ksi))^(0.5)-2*mu*(mu-ksi))/(2*mu*(1+mu*ksi));
    f = (1+mu*ksi)/(1-mu^2-4*mu*tm);
    beta = 0.8;
    h = beta*P/(rho*g);
    Fd = (rho*g*(h^2)*L/2)*cosd(theta)*f;
    T = M*g*sind(theta);
    theta_list(counter) = theta;
    Fd_list(counter) = (Fd);
    T_list(counter) = (T);
end 

h(1) = plot(theta_list, Fd_list,"-r.",'LineWidth',4,"DisplayName","\Theta(deg) vs F_d(N)"); hold on
h(2) = plot(theta_list, T_list,"-b.",'LineWidth',4,"DisplayName","\Theta(deg) vs T(N)"); hold on
set(gca,'FontSize',20)
xlim([0,90]);
ylim([-0.04,0.3]);
xlabel('\Theta(deg)',"Fontsize",15) ;
legend(h(:)); legend boxoff; hold on


%%
fh = figure(8);
fh.WindowState = 'maximized';

mass_x1 = [0.071,0.369,0.709,1.106,1.475,1.844,2.156,2.44,2.667,2.837,2.979,...
    3.149,3.291,3.546,3.83,4.17,4.539,4.851,5.305,5.645,6.156,6.553,7.035,...
    7.376,7.688,7.986];
expected_prob_y = [0.372,0.411,0.45,0.497,0.527,0.554,0.551,0.533,0.497,...
    0.456,0.42,0.375,0.334,0.286,0.244,0.209,0.176,0.158,0.14,0.131,0.134,...
    0.146,0.167,0.194,0.226,0.259];
plot(mass_x1, expected_prob_y,"k","linewidth",2)
xlim([0 8]);
ylim([0 0.7]);
xlabel('Ant mass (mg)');
ylabel('Probability of capture');
set(gca,'FontSize',20)
hold on
mass_x2 = [0.071,0.369,0.681,1.078,1.447,1.816,2.128,2.44,2.695,2.979,3.206,...
    3.433,3.546,3.745,3.887,4.113,4.312,4.567,4.766,5.021,5.277,5.532,5.787,...
    6.071,6.355,6.553,6.78,6.95,7.064,7.234,7.404,7.574,7.688,7.745,7.858,7.915,8.014];
upper_limit_y = [0.602,0.569,0.557,0.581,0.617,0.643,0.658,0.664,0.661,0.643,...
    0.623,0.581,0.539,0.497,0.459,0.426,0.393,0.351,0.325,0.292,0.268,0.25,...
    0.241,0.235,0.253,0.28,0.313,0.343,0.369,0.408,0.453,0.491,0.527,0.563,0.608,0.64,0.658];
plot(mass_x2, upper_limit_y,"k--","linewidth",2)
hold on
mass_x3 = [0.043,0.227,0.426,0.567,0.766,1.05,1.305,1.475,1.645,1.844,2.043,...
    2.213,2.298,2.468,2.582,2.638,2.752,2.894,2.979,3.092,3.262,3.433,3.546,...
    3.716,3.915,4.085,4.284,4.482,4.681,4.908,5.135,5.333,5.702,6.043,6.241,...
    6.44,6.723,6.979,7.149,7.348,7.546,7.716,7.986];
lower_limit_y = [0.182,0.226,0.268,0.31,0.354,0.39,0.42,0.435,0.444,0.453,...
    0.447,0.435,0.417,0.381,0.357,0.334,0.307,0.262,0.22,0.185,0.146,0.128,...
    0.119,0.107,0.098,0.092,0.08,0.077,0.074,0.071,0.069,0.066,0.069,0.069,...
    0.069,0.069,0.071,0.071,0.069,0.066,0.063,0.063,0.063];
plot(mass_x3, lower_limit_y,"k--","linewidth",2)
hold on


%%
fh = figure(4);
fh.WindowState = 'maximized';

subplot(10,8,[3 4 5 6 11 12 13 14 19 20 21 22 27 28 29 30 35 36 37 38])
M = 3;
avrtheta = 29;rho = 2500;d = 2.2/1000;
counter1 = 0;
for theta = [39,37,31,20]
    counter1 = counter1 + 1;
    sigma_star = 30;
    P_star = 2*(cosd(theta)/(sigma_star));
    count1 = [2,3,3,2];
    P_star1(counter1) = P_star;
end

counter2 = 0;
for theta = [41,41,39,34,30,21,17]
    counter2 = counter2 + 1;
    sigma_star = 30;
    P_star = 2*(cosd(theta)/(sigma_star));
    count2 = [2,3,4,4,3.5,3,2];
    P_star2(counter2) = P_star;
end

counter3 = 0;
for theta = [42.5,42.5,40.5,40,37,34,33,30,21,17,16]
    counter3 = counter3 + 1;
    sigma_star = 30;
    P_star = 2*(cosd(theta)/(sigma_star));
    count3 = [2,3,4,5,6,6,5,4,3.5,3,2];
    P_star3(counter3) = P_star;
end

counter4 = 0;
for theta = [43,43,42.8,42,40,37,34,29,21,17,15,15]
    counter4 = counter4 + 1;
    sigma_star = 30;
    P_star = 2*(cosd(theta)/(sigma_star));
    count4 = [2,3,3.5,4,6,6.5,6.5,4.5,4,3.5,3,2];
    P_star4(counter4) = P_star;
end

counter5 = 0;
for theta = [43,43,41,39,37,34,30,25,19,12,12]
    counter5 = counter5 + 1;
    sigma_star = 30;
    P_star = 2*(cosd(theta)/(sigma_star));
    count5 = [2,3.6,6,7,7.4,7.4,5.5,5,4,3.5,2];
    P_star5(counter5) = P_star;
end

counter6 = 0;
for theta = [47.8,47.8,47,43,38,35,21,1,1]
    counter6 = counter6 + 1;
    sigma_star = 30;
    P_star = 2*(cosd(theta)/(sigma_star))+0.004;
    count6 = [2,4,6,8,8,6,4,3,2];
    P_star6(counter6) = P_star;
end



x1=0;y1=0;x2=10;y2=1;x3=0;y3=1;x4=10;y4=0;
xl = [x1,x2,x3,x4]; yl = [y1,y2,y3,y4];
plot(xl,yl);
area(xl,yl,"Facecolor","blue");hold on
line(count1,P_star1,"color","green");
xlim([2 8]);
ylim([0.045 0.075]);
set(gca,'FontSize',15)
set(gca, 'YTick', []);
xlabel('\Delta\Theta (deg)',"FontSize",13);
ylabel('P^*',"FontSize",15);
title("(a)");
hold on
line(count2,P_star2,"color","red"); hold on
line(count3,P_star3,"color","blue"); hold on
line(count4,P_star4,"color","magenta"); hold on
line(count5,P_star5,"color","black"); hold on
line(count6,P_star6,"color","red"); hold on

x = 2; y = 0.06;
patch([x fliplr(count1)], [y fliplr(P_star1)] ,[0.58,0.15,0.15 ]);hold on
patch([count1 fliplr(count2)], [P_star1 fliplr(P_star2)] ,[0.98,0.52,0.22]);hold on
patch([count2 fliplr(count3)], [P_star2 fliplr(P_star3)] ,[0.86,0.86,0.45]);hold on
patch([count3 fliplr(count4)], [P_star3 fliplr(P_star4)] ,[0.50,1.00,0.67]);hold on
patch([count4 fliplr(count5)], [P_star4 fliplr(P_star5)] ,[0.22,0.86,0.82]);hold on
patch([count5 fliplr(count6)], [P_star5 fliplr(P_star6)] ,[0.23,0.58,0.82]);hold on
set(0, 'DefaultFigureColormap', jet(64))
text(2.7, 0.055, '1.000');
text(3.8, 0.054, '0.800');
text(5.4, 0.054, '0.600');
text(6.3, 0.054, '0.400');
text(7.2, 0.054, '0.200');
text(7.2, 0.0515, '0.000');
colorbar()

subplot(10,8,[49 50 51 52 57 58 59 60 65 66 67 68 73 74 75 76])
counter1 = 0;
for theta = [63,51,52,49,39,30]
    counter1 = counter1 + 1;
    sigma_star = 78;
    P_star = 2.7*(cosd(theta)/(sigma_star)+0.0118);
    count1 = [2,3,4,4,3,2];
    P_s1(counter1) = P_star;
end 

counter2 = 0;
for theta = [45,45,43,41,37,30,23,25]
    counter2 = counter2 + 1;
    sigma_star = 30;
    P_star = 2*(cosd(theta)/(sigma_star));
    count2 = [2,3,4,6,6,4,3,2];
    P_s2(counter2) = P_star;
end

counter3 = 0;
for theta = [47,47,47,46,43,38,33,25,24,22]
    counter3 = counter3 + 1;
    sigma_star = 16;
    P_star = (cosd(theta)/(sigma_star)+0.004);
    count3 = [2,4,6,8,10,10,8,6,4,2];
    P_s3(counter3) = P_star;
end
h = zeros(1,3);
h(1) = scatter(count1,P_s1,"filled","g",'DisplayName','\Sigma^*= 16');
line(count1,P_s1,"color","green");
xlim([0 14]);
set(gca, 'YTick', []);
xlabel('\Delta\Theta (deg)',"FontSize",13);
ylabel('P^*',"FontSize",15);
set(gca,'FontSize',15)
title("(b)                                               ");hold on
h(2) = scatter(count2,P_s2,"filled","r^",'DisplayName','\Sigma^*= 30');
line(count2,P_s2,"color","red");hold on
h(3) = scatter(count3,P_s3,"filled","bs",'DisplayName','\Sigma^*= 78');
line(count3,P_s3,"color","blue");
legend(h(1:3)); legend boxoff; hold on


subplot(10,8,[53 54 55 56 61 62 63 64 69 70 71 72 77 78 79 80])
counter1 = 0;
for theta = [38,39,31,29,27,26]
    counter1 = counter1 + 1;
    sigma_star = 30;
    P_star = 2*(cosd(theta)/(sigma_star));
    count1 = [3,4,5,5,4,3];
    P_st1(counter1) = P_star;
end

counter2 = 0;
for theta = [41,39,30.5,21,17]
    counter2 = counter2 + 1;
    sigma_star = 30;
    P_star = 2*(cosd(theta)/(sigma_star));
    count2 = [2,4,4,3,2];
    P_st2(counter2) = P_star;
end

counter3 = 0;
for theta = [44,42,40,32,23,21,21,13,13]
    counter3 = counter3 + 1;
    sigma_star = 30;
    P_star = 2*(cosd(theta)/(sigma_star));
    count3 = [5,6,7,8,7,6,5,4,3];
    P_st3(counter3) = P_star;
end

counter4 = 0;
for theta = [43,41,34,32,27,17,11,1,1]
    counter4 = counter4 + 1;
    sigma_star = 30;
    P_star = 2*(cosd(theta)/(sigma_star));
    count4 = [4,6,7.6,7,6,5,4,3,2];
    P_st4(counter4) = P_star;
end

plot(count1, P_st1,"-r.",'markersize',20);hold on
xlim([0 10]);
ylim([0.0469 0.075]);
set(gca,'FontSize',15)
set(gca, 'YTick', []);
plot(count2, P_st2,"-.rs",'markersize',8);
plot(count3, P_st3,"-b.",'markersize',20);
plot(count4, P_st4,"-.bs",'markersize',8);
xlabel('\Delta\Theta (deg)',"FontSize",13);
ylabel('P^*',"FontSize",15);
title("                                               (c)");hold on
lgd = legend("d = 6.0 mm; \phi_L_* = 0.8","d = 1.2 mm; \phi_L_* = 0.8","d = 6.0 mm; \phi_L_* = 0.2","d = 1.2 mm; \phi_L_* = 0.2");
lgd.FontSize = 8; legend boxoff; 
set(gcf,'color','w');

%%
fh = figure(1);
fh.WindowState = 'maximized';
text(0.05,0.50,'Pressure-Dependent Friction on Granular Slopes Close to Avalanche',"Fontsize",24);
text(0.4,0.4,'Academic Paper',"Fontsize",24);



