close all
clearvars
clc

Simulation.Time   = 2;

Startauslenkung = 0/180*pi; %[rad]
Sollwert0 = 20;     %[�]
Sollwert1 = -20;    %[�]
Sollwert2 = 0;      %[�]
Periodendauer = 0.73;   %[s]
t1 = Periodendauer/4;   %[s]    Zeitpunkt, wenn auf Sollwert 1 umgestellt wird
t2 = Periodendauer * 3/4;   %[s]    Zeitpunkt, wenn auf Sollwert 2 umgestellt wird
Moment_aero = 255.25;       %[Nm/rad]


Traegheitsmoment_GF = 0.054;   %  [kg/m^2]
Traegheitsmoment_Motor = 0.000138;   %  [kg/m^2]
Traegheitsmoment_Getriebe = 0.005;  %  [kg/m^2]
Reibung = 1;                %[Nms]  Getriebe, Lager, ohne Motor
Uebersetzung = 10;


    %Motorberechung
Spannung_max = 18;         %[V]
Spannung = 8;             %[V]
Drehzahlkonstante = 208;   %[U/(min V)]
Momentenkonstante = 0.046;   %[Nm/A]
Steigung = 275;             %[U/(min Nm)]


Nennspannung = 18;  %[V]
Leerlaufdrehzahl = Nennspannung * Drehzahlkonstante;    %[U/min]
Leerlaufstrom = 0.755;    %[A]
Reibmoment = Momentenkonstante * Leerlaufstrom;     %[Nm]
Motorreibkonstante = Reibmoment / (Leerlaufdrehzahl * 2 * pi / 60); %[Nms]

    %Regler
I_Konstante = 10;       %[V/(s*�)]
P_Konstante = 2;     %[V/�]
D_Konstante = 0;       %[Vs/�]

disp(Motorreibkonstante);


sim('Aktuator.slx')