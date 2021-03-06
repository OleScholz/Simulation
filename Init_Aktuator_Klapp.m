close all
clearvars
clc

a = 0.0375;                  %[m]
Steigung = 0.002;           %[m/Umdrehung]
r = 0.016;                  %[m]   Radius der Gewindestange
M_Hubstange = 0.02;         %[kg]
I_GF = 0.16;                %[kg*m^2]
I_Spindel = 0.0000042;      %[kg*m^2]
I_Motor = 0.0000132;        %[kg*m^2]

Reibungsbeiwert = 0.0015;               %[]
Hebelarm = 0.0025;                      %[m]
Normalkraft = 2*I_GF*pi / (4*2^2*a);      %[N]


Wirkungsgrad = 0.38;    %vom Getriebe       0.75
Uebersetzung = 3.7;

Spannung_max = 4;                      %[V]     12
Drehzahlkonstante = 451;            %[U/(min V)]
Momentenkonstante = 21.2/1000;      %[Nm/A]
Kennliniensteigung = 106*1000;      %[U/(min Nm)]


%Regler                                   U_max = 12        U_max = 4
I_Konstante = -1.18;       %[V/(s*?)]     -2.17             -1.18
P_Konstante = 30;          %[V/?]         15                30
D_Konstante = 0;           %[Vs/?]        0                 0

%set_param('Aktuator_Klapp','AlgebraicLoopSolver','TrustRegion')
set_param('Aktuator_Klapp','AlgebraicLoopSolver','LineSearch')
sim('Aktuator_Klapp.slx')