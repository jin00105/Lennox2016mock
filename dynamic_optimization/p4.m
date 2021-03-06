clear all

msg = 'test parameters';
timeline = 10000;
%general economy
a = 0.8;
x0r = 500;
xsig2 = 36;

%forestry
lf = 0.5; %lambda
af = 0.9;
xf0r = 500;
xfsig2 = 36;

%housing
lr = 0.9;
ar = 0.5;
xr0r = 500;
xrsig2 = 36;

%donation
lb = 0.7;
ab = 0.9;
xb0r = 150;
xbsig2 = 9;

% CVAL  str
al = 1;
be = 1;

godsimnum = 1;

period = 10;
lag = 0;
A = 1; % amplitude

burnin = 201; % burn in first few values of net return as they have not converged yet

cvalth = 0; % buying threshold for buystrat code 1

simtime = 9500; % number of buying opportunities
fund = 0; % money saved
cumb = 0; % cummulative conservation value

bfn = 1; % benefit fn scheme. 1=constant, 2=normal var correlated to e_fj, 3=non-linear fn of 2

rho = 0.1; %0.1; % economic discount rate
del = 0.01; % ecological discount rate

efmu = 0; % mean of ef
efsig2 = 9; % var of ef
ermu = 0; % mean of er
ersig2 = 9; % var of er

ch = 0; % land change cost and option value

b_def = 10; % default b 
t_jmethod = 1; % 0=earliest time its profitable, 1=time when its most profitable
intrate = 0.0;

simver = 2; %1=godinfo 2=perfect info
code = [2]; % buy strategy stuff
