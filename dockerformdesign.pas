unit DockerFormDesign;

interface

uses
  Classes, SysUtils, Forms, ProjectIntf;

{ Call to register a custom form class with the IDE

  RegisterForm parameters:

  Package: The name of the package containing your custom form
  FormClass: The class type of your custom form
  Category: The group under which your form class apears in the New... dialog
  Caption: The name of your form class as it appears in the New... dialog
  Description: A brief summary of your form class as it appears in the New... dialog
  Units: A list of units to add the uses clause of a unit with your form class
    (Typically just the name of the unit defining your form class) }

procedure RegisterForm(const Package: string; FormClass: TCustomFormClass; const Category, Caption, Description, Units: string);

implementation

procedure RegisterForm(const Package: string; FormClass: TCustomFormClass; const Category, Caption, Description, Units: string);
begin
  ProjectIntf.RegisterForm(Package, FormClass, Category, Caption, Description, Units);
end;

{ TCustomFormDescriptor }

(*type
  TCustomFormDescriptor = class(TFileDescPascalUnitWithResource)
  private
    FCaption: string;
    FDescription: string;
    FUnits: string;
  public
    constructor Create(const Package: string; FormClass: TCustomFormClass; const Caption, Description, Units: string); reintroduce;
    function GetResourceType: TResourceType; override;
    function GetLocalizedName: string; override;
    function GetLocalizedDescription: string; override;
    function GetInterfaceUsesSection: string; override;
  end;

procedure RegisterForm(const Package: string; FormClass: TCustomFormClass; const Category, Caption, Description, Units: string);
begin
  RegisterNoIcon([FormClass]);
  if NewIDEItems.IndexOf(Category) < 0 then
    RegisterNewItemCategory(TNewIDEItemCategory.Create(Category));
  RegisterProjectFileDescriptor(TCustomFormDescriptor.Create(Package, FormClass,
    Caption, Description, Units), Category);
end;

constructor TCustomFormDescriptor.Create(const Package: string; FormClass: TCustomFormClass;
  const Caption, Description, Units: string);
begin
  inherited Create;
  RequiredPackages := 'LCL;' + Package;
  ResourceClass := FormClass;
  Name := Caption;
  UseCreateFormStatements := True;
  FCaption := Caption;
  FDescription := Description;
  FUnits := Units;
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
  Result := Result + ', Controls, Forms,'#13#10 +
    '  ' + FUnits;
end;*)

end.

