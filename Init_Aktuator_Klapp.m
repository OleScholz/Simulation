close all
clearvars
clc

a = 0.047;     %[m]
Steigung = 0.002;       %[m/Umdrehung]
r = 0.016;     %[m]   Radius der Gewindestange
M_Hubstange = 0.02; %[kg]
I_GF = 0.16;        %[kg*m^2]
I_Spindel = 0;         %[kg*m^2]
I_Motor = 0.0000132;        %[kg*m^2]

Uebersetzung = 3.7;

Spannung = 12;             %[V] 
Drehzahlkonstante = 569;   %[U/(min V)]
Momentenkonstante = 16.8/1000;   %[Nm/A]
Kennliniensteigung = 108*1000;             %[U/(min Nm)]


sim('Aktuator_Klapp.slx')