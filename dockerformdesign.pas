unit DockerFormDesign;

interface

uses
  Classes, SysUtils, Forms, ProjectIntf, NewItemIntf;

type
  TCustomFormClass = class of TCustomForm;

procedure RegisterForm(FormClass: TCustomFormClass; const Caption, Description, UnitNamed: string);

implementation

{ TCustomFormDescriptor }

type
  TCustomFormDescriptor = class(TFileDescPascalUnitWithResource)
  private
    FCaption: string;
    FDescription: string;
    FUnitName: string;
  public
    constructor Create(FormClass: TCustomFormClass; const Caption, Description, UnitNamed: string);
    function GetResourceType: TResourceType; override;
    function GetLocalizedName: string; override;
    function GetLocalizedDescription: string; override;
    function GetInterfaceUsesSection: string; override;
  end;

var
  Created: Boolean;

procedure RegisterForm(FormClass: TCustomFormClass; const Caption, Description, UnitNamed: string);
const
  DockerForm = 'Docker Forms';
begin
  RegisterNoIcon([FormClass]);
  if not Created then
    RegisterNewItemCategory(TNewIDEItemCategory.Create(DockerForm));
  Created := True;
  RegisterProjectFileDescriptor(TCustomFormDescriptor.Create(FormClass, Caption,
    Description, UnitNamed), DockerForm);
end;

constructor TCustomFormDescriptor.Create(FormClass: TCustomFormClass;
  const Caption, Description, UnitNamed: string);
begin
  inherited Create;
  FCaption := Caption;
  FDescription := Description;
  FUnitName := UnitNamed;
  ResourceClass := FormClass;
  Name := Caption;
  RequiredPackages := 'LCL;dockers';
  UseCreateFormStatements := True;
end;

function TCustomFormDescriptor.GetResourceType: TResourceType;
begin
  Result := rtRes;
end;

function TCustomFormDescriptor.GetLocalizedName: string;
begin
  Result := FCaption;
end;

function TCustomFormDescriptor.GetLocalizedDescription: string;
begin
  Result:= FDescription;
end;

function TCustomFormDescriptor.GetInterfaceUsesSection: string;
begin
  Result := inherited GetInterfaceUsesSection;
  Result := Result + ', Forms,'#13#10 +
    '  ' + FUnitName;
end;

end.

