unit DockerReg;

{$mode delphi}

interface

uses
  Classes, SysUtils, Forms, DockerFormDesign, DockNoteFrm;

procedure Register;

implementation

procedure Register;
begin
  RegisterForm('dockers', TDockNoteForm, 'Docker Forms', 'Note Form', 'A form to take notes', 'DockNoteFrm');
end;

end.

