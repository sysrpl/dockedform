unit DockNoteFrm;

{$mode delphi}

interface

uses
  Classes, SysUtils, Graphics, Forms, Controls, StdCtrls, ExtCtrls;

{ TDockNoteForm }

type
  TDockNoteForm = class(TForm)
	private
    FBanner: TShape;
    FNoteMemo: TMemo;
    FClearButton: TButton;
    procedure CreateControls;
    procedure ClearButtonClick(Sender: TObject);
    function GetBannerColor: TColor;
    function GetNotes: TStrings;
    procedure SetBannerColor(Value: TColor);
    procedure SetNotes(Value: TStrings);
	public
    constructor CreateNew(AOwner: TComponent; Num: Integer = 0); override;
    destructor Destroy; override;
	published
    property BannerColor: TColor read GetBannerColor write SetBannerColor;
    property Notes: TStrings read GetNotes write SetNotes;
  end;

implementation

{ TDockNoteForm }

constructor TDockNoteForm.CreateNew(AOwner: TComponent; Num: Integer = 0);
begin
  inherited CreateNew(AOwner, Num);
  CreateControls;
end;

procedure TDockNoteForm.CreateControls;
var
  WasDesigning: Boolean;
begin
  if FBanner <> nil then
  	Exit;
  WasDesigning := csDesigning in ComponentState;
  if WasDesigning then
	  SetDesigning(False, False);
  FBanner := TShape.Create(nil);
  FBanner.Parent := Self;
  FBanner.Align := alTop;
  FBanner.Pen.Style := psClear;
  FBanner.Brush.Color := clInactiveCaption;
  FBanner.Height := 80;
  SetDesigning(False, True);
  FNoteMemo := TMemo.Create(nil);
  FNoteMemo.Parent := Self;
  FNoteMemo.Lines.Clear;
  FNoteMemo.SetBounds(8, 88, 160, 120);
  FBanner.Height := 80;
  FClearButton := TButton.Create(nil);
  FClearButton.Parent := Self;
  FClearButton.Caption := 'Clear';
  FClearButton.SetBounds(8 + 160 - 75, 88 + 120 + 8, 75, 25);
  FClearButton.OnClick := ClearButtonClick;
  if WasDesigning then
	  SetDesigning(True, False);
end;

destructor TDockNoteForm.Destroy;
begin
  FBanner.Free;
  FNoteMemo.Free;
  FClearButton.Free;
  inherited Destroy;
end;

procedure TDockNoteForm.ClearButtonClick(Sender: TObject);
begin
  Notes.Clear;
end;

function TDockNoteForm.GetBannerColor: TColor;
begin
	Result := FBanner.Brush.Color;
end;

function TDockNoteForm.GetNotes: TStrings;
begin
	Result := FNoteMemo.Lines;
end;

procedure TDockNoteForm.SetBannerColor(Value: TColor);
begin
	FBanner.Brush.Color := Value;
end;

procedure TDockNoteForm.SetNotes(Value: TStrings);
begin
	Notes.Assign(Value);
end;

end.

