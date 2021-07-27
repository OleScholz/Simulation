close all
clearvars
clc

Simulation.Time   = 2;

Startauslenkung = 0/180*pi; %[rad]
Moment_aero = 255.25;       %[Nm/rad]


Traegheitsmoment_GF = 0.054;   %  [kg/m^2]
Traegheitsmoment_Motor = 0.000138;   %  [kg/m^2]
Traegheitsmoment_Getriebe = 0.005;  %  [kg/m^2]
Reibung = 1;                %[Nms]  Getriebe, Lager, ohne Motor
Uebersetzung = 10;


    %Motorberechung
Spannung = 8;             %[V]
Drehzahlkonstante = 208;   %[U/(min V)]
Momentenkonstante = 0.046;   %[Nm/A]
Steigung = 275;             %[U/(min Nm)]


Nennspannung = 18;  %[V]
Leerlaufdrehzahl = Nennspannung * Drehzahlkonstante;    %[U/min]
Leerlaufstrom = 0.755;    %[A]
Reibmoment = Momentenkonstante * Leerlaufstrom;     %[Nm]
Motorreibkonstante = Reibmoment / (Leerlaufdrehzahl * 2 * pi / 60); %[Nms]

disp(Motorreibkonstante);


sim('Aktuator.slx')