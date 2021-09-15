close all
clearvars
clc

Startauslenkung = 0/180*pi; %[rad]
Sollwert0 = 20;     %[°]
Sollwert1 = -20;    %[°]
Sollwert2 = 0;      %[°]
Periodendauer = 0.73;   %[s]
t1 = Periodendauer/4;   %[s]    Zeitpunkt, wenn auf Sollwert 1 umgestellt wird
t2 = Periodendauer * 3/4;   %[s]    Zeitpunkt, wenn auf Sollwert 2 umgestellt wird
Moment_aero = 255.25;       %[Nm/rad]



%Getriebe
Uebersetzung = 200;
Effizienz = 0.9;


%Lagerreibung
Reibungsbeiwert = 0.0018;
Hebel1 = 208;       %[mm]
Hebel2 = 265;       %[mm]
Axialkraft = 3000;      %[N]
Radialkraft = 6000;     %[N]



    %Motorberechung                     449463
Drehzahlkonstante = 1070;   %[U/(min V)]    1070
Momentenkonstante = 8.95/1000;   %[Nm/A]        8.95/1000
Steigung = 27.1*1000;             %[U/(min Nm)]     27.1*1000

Nennspannung = 12;  %[V]
Leerlaufstrom = 522/1000;    %[A]




%Trägheitsmomente
Traegheitsmoment_GF = 0.054;                %  [kgm^2]
Traegheitsmoment_Motor = 10.5/10000000;     %  [kgm^2]
Traegheitsmoment_Getriebe = 0.005;          %  [kgm^2]
Traegheitsmoment_Welle = 0.006;             %  [kgm^2]
Masse_Hubakuatorik = 0.117 + 0.3 + 0.052 + 0.044 + 0.015 + 0.014;   %[kg]
Abstand_Hubaktuatorik = 0.032;              %  [m]
Traegheitsmoment_gesamt =   Traegheitsmoment_GF + Traegheitsmoment_Motor/Uebersetzung + Traegheitsmoment_Getriebe + Traegheitsmoment_Welle + Masse_Hubakuatorik * Abstand_Hubaktuatorik^2;       %[kgm^2]
                                            %  [kgm^2]

                            
                            
    %Regler
Spannung_max = Nennspannung * 3/2;         %[V]     Nennspannung * 3/2
I_Konstante = 20;       %[V/(s*°)]      20
P_Konstante = 4;     %[V/°]             4
D_Konstante = 0;       %[Vs/°]          0



sim('Aktuator_Steuer.slx')