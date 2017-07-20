{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit dockers;

interface

uses
  DockerReg, DockerFormDesign, DockNoteFrm, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('DockerReg', @DockerReg.Register);
end;

initialization
  RegisterPackage('dockers', @Register);
end.
