unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnstart_all: TButton;
    btnstop_all: TButton;
    btnpause_all: TButton;
    btnresume_all: TButton;
    Panel1: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    Button5: TButton;
    Button6: TButton;
    Image2: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Panel3: TPanel;
    Button7: TButton;
    Button8: TButton;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnstart_allClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnpause_allClick(Sender: TObject);
    procedure btnresume_allClick(Sender: TObject);
    procedure btnstop_allClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  t_utama_awal, t_utama_akhir: TDateTime;  
  t_1_awal, t_1_akhir: TDateTime;
  t_2_awal, t_2_akhir: TDateTime;
  paused : boolean;
  paused_1 : boolean;
  paused_2 : boolean;

implementation

uses DateUtils;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);

begin
  Paused := False;
  Paused_1 := False;
  Paused_2 := False;

  timer1.Interval := 1000;
  timer2.Interval := 1000;
  timer3.Interval := 1000;
  Panel1.Caption := '00:00:00';
  btnstart_all.Enabled := true;
  btnstop_all.Enabled := false;
  btnpause_all.Enabled := False;
  btnresume_all.Enabled := False;
  Button6.Enabled:=False;
  Button8.Enabled:=False;
  Timer1.Enabled := false;
  Timer2.Enabled := false;
  Timer3.Enabled := false;
end;

procedure TForm1.btnstart_allClick(Sender: TObject);
begin
//t_utama_awal:=Now;
t_utama_awal := Strtotime('00:00:00');
t_utama_akhir := t_utama_awal;
t_1_awal:=t_utama_awal;
t_2_awal:=t_utama_awal;
t_1_akhir :=t_utama_awal;
t_2_akhir :=t_utama_awal;

btnstop_all.Enabled:=True;
btnpause_all.Enabled:=True;
btnresume_all.Enabled:=True;
btnstart_all.Enabled:=false;
Button5.Enabled:=false;
Button7.Enabled:=false;
Button6.Enabled:=true;
Button8.Enabled:=true;
Timer1.Enabled := true;
Timer2.Enabled := true;
Timer3.Enabled := true;
  Panel1.Caption := '00:00:00';
  Panel2.Caption := '00:00:00';
  Panel3.Caption := '00:00:00';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
 startt, endd, distance : String;

begin
if not Paused then
begin
t_utama_akhir := t_utama_akhir + strtotime('00:00:01');
//t_utama_akhir := Strtotime('00:01:00');
//t_utama_akhir := t_utama_akhir + strtotime('00:00:01');
//t_utama_awal := StrToTime('00:00:00');
startt :=FormatDateTime('hh:nn:ss', t_utama_awal);
endd :=FormatDateTime('hh:nn:ss', t_utama_akhir);
distance:= FormatDateTime('hh:nn:ss',  t_utama_akhir - t_utama_awal);
Panel1.Caption := distance;
end;
end;

procedure TForm1.btnpause_allClick(Sender: TObject);
begin

  Timer1.Enabled := false;
  Timer2.Enabled := false;
  Timer3.Enabled := false;
  Paused := true;
end;

procedure TForm1.btnresume_allClick(Sender: TObject);
begin
  Timer1.Enabled := true;
  Timer2.Enabled := true;
  Timer3.Enabled := true;
  Paused := false;
end;

procedure TForm1.btnstop_allClick(Sender: TObject);
begin
  Timer1.Enabled := false;
  Timer2.Enabled := false;
  Timer3.Enabled := false;
  btnpause_all.Enabled:=false;
btnresume_all.Enabled:=false;
btnstart_all.Enabled:=true;
Button5.Enabled:=true;
Button7.Enabled:=true;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
 startt, endd, distance : String;
begin
if not Paused and not paused_1 then
begin
t_1_akhir := t_1_akhir + strtotime('00:00:01');
//t_utama_akhir := Strtotime('00:01:00');
//t_utama_akhir := t_utama_akhir + strtotime('00:00:01');
//t_utama_awal := StrToTime('00:00:00');
startt :=FormatDateTime('hh:nn:ss', t_1_awal);
endd :=FormatDateTime('hh:nn:ss', t_1_akhir);
distance:= FormatDateTime('hh:nn:ss',  t_1_akhir - t_1_awal);
Panel2.Caption := distance;
end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
if not paused_1 then
begin
   Timer2.Enabled := false;
   Paused_1 := true;
    Button6.Caption:='Resume';
end
else
begin
   Timer2.Enabled := true;
   Paused_1 := false;
   Button6.Caption:='Pause';
end;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
var
 startt, endd, distance : String;
begin
if not Paused and not paused_2 then
begin
t_2_akhir := t_2_akhir + strtotime('00:00:01');
//t_utama_akhir := Strtotime('00:01:00');
//t_utama_akhir := t_utama_akhir + strtotime('00:00:01');
//t_utama_awal := StrToTime('00:00:00');
startt :=FormatDateTime('hh:nn:ss', t_2_awal);
endd :=FormatDateTime('hh:nn:ss', t_2_akhir);
distance:= FormatDateTime('hh:nn:ss',  t_2_akhir - t_2_awal);
Panel3.Caption := distance;
end;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
if not paused_2 then
begin
   Timer3.Enabled := false;
   Paused_2 := true;
    Button8.Caption:='Resume';
end
else
begin
   Timer3.Enabled := true;
   Paused_2 := false;
   Button8.Caption:='Pause';
end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
t_1_awal:=Strtotime('00:00:00');
t_1_akhir :=t_1_awal;
btnpause_all.Enabled:=True;
btnresume_all.Enabled:=True;
Button6.Enabled:=true;
Button5.Enabled:=False;
Timer2.Enabled := true;
  Panel2.Caption := '00:00:00';
end;

end.
