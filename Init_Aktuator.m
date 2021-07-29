close all
clearvars
clc

Simulation.Time   = 2;

Startauslenkung = 0/180*pi; %[rad]
Sollwert0 = 20;     %[°]
Sollwert1 = -20;    %[°]
Sollwert2 = 0;      %[°]
Periodendauer = 0.73;   %[s]
t1 = Periodendauer/4;   %[s]    Zeitpunkt, wenn auf Sollwert 1 umgestellt wird
t2 = Periodendauer * 3/4;   %[s]    Zeitpunkt, wenn auf Sollwert 2 umgestellt wird
Moment_aero = 255.25;       %[Nm/rad]


Traegheitsmoment_GF = 0.054;   %  [kg/m^2]
Traegheitsmoment_Motor = 10.5/10000000;   %  [kg/m^2]
Traegheitsmoment_Getriebe = 0.005;  %  [kg/m^2]
Reibung = 1;                %[Nms]  Getriebe, Lager, ohne Motor
Uebersetzung = 19683/64;


    %Motorberechung
Spannung_max = 12;         %[V]
%Spannung = 8;             %[V]     Von nun an geregelt
Drehzahlkonstante = 1070;   %[U/(min V)]
Momentenkonstante = 8.95/1000;   %[Nm/A]
Steigung = 27.1*1000;             %[U/(min Nm)]


Nennspannung = 12;  %[V]
Leerlaufdrehzahl = Nennspannung * Drehzahlkonstante;    %[U/min]
Leerlaufstrom = 522/1000;    %[A]
Reibmoment = Momentenkonstante * Leerlaufstrom;     %[Nm]
Motorreibkonstante = Reibmoment / (Leerlaufdrehzahl * 2 * pi / 60); %[Nms]

    %Regler
I_Konstante = 10;       %[V/(s*°)]
P_Konstante = 2;     %[V/°]
D_Konstante = 0;       %[Vs/°]

disp(Motorreibkonstante);


sim('Aktuator.slx')