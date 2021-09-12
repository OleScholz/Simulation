close all
clearvars
clc

a = 0.047;                  %[m]
Steigung = 0.002;           %[m/Umdrehung]
r = 0.016;                  %[m]   Radius der Gewindestange
M_Hubstange = 0.02;         %[kg]
I_GF = 0.16;                %[kg*m^2]
I_Spindel = 0.0000042;      %[kg*m^2]
I_Motor = 0.0000132;        %[kg*m^2]

Reibungsbeiwert = 0.0015;               %[]
Hebelarm = 0.0025;                      %[m]
Normalkraft = 2*I_GF*pi / (4*2^2*a);      %[N]


Wirkungsgrad = 0.75;    %vom Getriebe       0.75
Uebersetzung = 3.7;

Spannung = 12;                      %[V]     12
Drehzahlkonstante = 451;            %[U/(min V)]
Momentenkonstante = 21.2/1000;      %[Nm/A]
Kennliniensteigung = 106*1000;      %[U/(min Nm)]

set_param('Aktuator_Klapp','AlgebraicLoopSolver','TrustRegion')
sim('Aktuator_Klapp.slx')