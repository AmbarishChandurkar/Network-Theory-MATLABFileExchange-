%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% CODE DISPLAYING RL - CIRCUIT %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% OUTPUTS FOR VARIOUS INPUTS %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% * AMBARISH PRASHANT CHANDURKAR - BT17ECE021
%% Part 1 - Initialisation of program

    clearvars;
    clc;
    k=1:4;
    %% order of wave - sine,square,trianguler,exp (k = 1,2,3,4)
    
%% Part 2 - Circuit Parameters

    R = [1 1 1 1] ; %The Value of Resistance
    L = [1e-2 1e-2 1e-4 1e-3]; %The Value of Inductance
    tau(k) = L(k)./R(k); 
    
%% Part 3 - Source Parameters

    V=1;
    f=[1e2 1e3 1e3 1e1]; 
    w=2*pi*f; 
%% Part 4 - Solution Parameters

    Tf = [3*tau(1) 10*tau(2) 30*tau(3) 10*tau(4)]; 
             
    h = [1e-5 1e-5 1e-5 1e-7];
    
%% Part 5 - Initialization for solution

for k = 1:4
    
    n=1; 
    t(n)=0; %The Time Axis points
    i(n)=0;
    v(n)=0; 
    di(n)=(-R(k)*i(n)+v(n))/L(k); 
    vr(n)=R(k)*i(n);  %voltage across resistor
    vl(n)=L(k)*di(n); %voltage across inductor
    n=1;
    
%% Part 6 - The Computation of solution

    while t(n) <= Tf(k) 
        i(n+1)=i(n)+(h(k)*di(n)); 
        n=n+1; %Increment of index
        t(n)=t(n-1)+h(k); %Increment of Time
        
       switch(k)
           case 1
                v(n) = V*sin(w(k)*t(n)); %% Code for "Sine Wave" Input
                
           case 2
           %% Code for Step Voltage as Input
                if t(n)<(5*tau(k)) %% Code for "Square Wave" Input
                    v(n)= V;
                else
                    v(n)= 0;
                end
                
            case 3
                v(n) = V*sawtooth(w(k)*t(n),0.5); %% Code for "Triangular Wave" Input
               
            case 4
                v(n) = (1 - exp(-w(k)*t(n)));
       end
       
        di(n)=(-R(k)*i(n)+v(n))/L(k); 
        vr(n)=R(k)*i(n);
        vl(n)=L(k)*di(n); 
    end
    n=1; %Reinitialisaton of index
    