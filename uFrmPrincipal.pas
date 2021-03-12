unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, System.Json, Servicos, Endereco,
  Vcl.Buttons;

type
  TFrmPrincipal = class(TForm)
    PnlPrincipal: TPanel;
    LblTitulo: TLabel;
    MskEdtCPF: TMaskEdit;
    LblMskEdtCPF: TLabel;
    MskEdtTel: TMaskEdit;
    LblMskEdtTel: TLabel;
    GrpBoxEndereco: TGroupBox;
    MskEdtCep: TMaskEdit;
    LblCep: TLabel;
    LblEstado: TLabel;
    LblPais: TLabel;
    EdtNome: TEdit;
    LblNome: TLabel;
    LblIdentidade: TLabel;
    EdtIdentidade: TEdit;
    LblEmail: TLabel;
    EdtEmail: TEdit;
    LblLogradouro: TLabel;
    EdtLogradouro: TEdit;
    EdtNumero: TEdit;
    LblNumero: TLabel;
    LblComplemento: TLabel;
    EdtComplemento: TEdit;
    LblBairro: TLabel;
    EdtBairro: TEdit;
    LblCidade: TLabel;
    EdtCidade: TEdit;
    EdtUf: TEdit;
    EdtPais: TEdit;
    BtnSalvar: TBitBtn;
    procedure MskEdtCepEnter(Sender: TObject);
    procedure MskEdtCepExit(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure MskEdtCPFExit(Sender: TObject);
    procedure EdtNomeEnter(Sender: TObject);
    procedure EdtNomeExit(Sender: TObject);
    procedure EdtIdentidadeChange(Sender: TObject);
    procedure EdtIdentidadeExit(Sender: TObject);
    procedure MskEdtCPFEnter(Sender: TObject);
    procedure EdtIdentidadeEnter(Sender: TObject);
    procedure MskEdtTelEnter(Sender: TObject);
    procedure MskEdtTelExit(Sender: TObject);
    procedure EdtEmailEnter(Sender: TObject);
    procedure EdtEmailExit(Sender: TObject);
  private
    { Private declarations }
    function verificaCamposPreenchidos(): TEdit;
    procedure CarregaEndereco(JSON: TJSONObject);
    procedure limparCampos;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses Cliente;

procedure TFrmPrincipal.MskEdtCepEnter(Sender: TObject);
begin
  MskEdtCep.Color := $00B9FFFF;
end;

procedure TFrmPrincipal.MskEdtCepExit(Sender: TObject);
var
   LJsonObj: TJSONObject;
   cep : TCep;
begin
  if length(MskEdtCep.Text) <> 8 then
    begin
      MessageDlg('CEP inválido', mtError, [mbOK], 0);
      MskEdtCep.Clear;
      if(MskEdtCep.CanFocus) then
        MskEdtCep.SetFocus;
    end
  else
    begin
     cep := Tcep.Create;
     LJsonObj:= cep.GetCEP(MskEdtCep.Text);

     if LJsonObj <> nil then
      CarregaEndereco(LJsonObj)

     else
      begin
        MessageDlg('CEP inválido', mtError, [mbOK], 0);
        MskEdtCep.Clear;
        MskEdtCep.SetFocus;
      end;

    end;

end;

procedure TFrmPrincipal.MskEdtCPFEnter(Sender: TObject);
begin
  MskEdtCPF.Color:= $00B9FFFF;
end;

procedure TFrmPrincipal.MskEdtCPFExit(Sender: TObject);
begin
  if(Length(MskEdtCPF.Text) < 11) then
    begin
      MessageDlg('CPF inválido.', mtWarning, [mbOK], 0);
      if(MskEdtCPF.CanFocus) then
        MskEdtCPF.SetFocus;
    end;
  MskEdtCPF.Color:= clWindow;

end;

procedure TFrmPrincipal.MskEdtTelEnter(Sender: TObject);
begin
  MskEdtTel.Color:= $00B9FFFF;
end;

procedure TFrmPrincipal.MskEdtTelExit(Sender: TObject);
begin
  MskEdtTel.Color:= clWindow;
end;

procedure TFrmPrincipal.BtnSalvarClick(Sender: TObject);
var edt     : TEdit;
    cliente :  TCliente;
    endereco:  TEndereco;
    email   :  TEmail;
begin
  try
    edt:= TEdit.Create(nil);
    edt:= verificaCamposPreenchidos;

    if(edt <> nil) then
      begin
        MessageDlg('Favor preencher o campo selecionado.', mtWarning, [mbOK], 0);
        if(edt.CanFocus) then
          edt.SetFocus;
          exit;
      end;

     endereco := TEndereco.create(MskEdtCep.Text, EdtLogradouro.Text, StrToInt(EdtNumero.Text), EdtBairro.Text, EdtComplemento.Text,
                     EdtCidade.Text, EdtUf.Text, EdtPais.Text);
     cliente := TCliente.create(EdtNome.Text, EdtIdentidade.Text, MskEdtCPF.Text, MskEdtTel.Text, EdtEmail.Text, endereco);
     email := TEmail.Create;
     if(email.enviarEmail(cliente, email.gerarXml(cliente))) then
      begin
        MessageDlg('Cadastro realizado e e-mail enviado com sucesso.', mtConfirmation, [mbOK], 0);
        limparCampos
      end
     else
      MessageDlg('Erro ao efetuar o cadastro, favor conferir os dados e tentar novamente.', mtError, [mbOK], 0);

   finally
     FreeAndNil(cliente);
     FreeAndNil(endereco);
     FreeAndNil(email);

  end;
end;

procedure TfrmPrincipal.CarregaEndereco(JSON: TJSONObject);
begin
  EdtLogradouro.Text  :=  JSON.Get('logradouro').JsonValue.Value;
  EdtBairro.Text      :=  JSON.Get('bairro').JsonValue.Value;
  EdtCidade.Text      :=  JSON.Get('localidade').JsonValue.Value;
  EdtComplemento.Text :=  JSON.Get('complemento').JsonValue.Value;
  EdtUf.Text          :=  JSON.Get('uf').JsonValue.Value;
  EdtPais.Text        :=  'Brasil';
  MskEdtCep.Color := clWindow;

  if(EdtNumero.CanFocus) then
    EdtNumero.SetFocus;
  end;

procedure TFrmPrincipal.EdtEmailEnter(Sender: TObject);
begin
  EdtEmail.Color:= $00B9FFFF;
end;

procedure TFrmPrincipal.EdtEmailExit(Sender: TObject);
begin
  EdtEmail.Color:= clWindow;
end;

procedure TFrmPrincipal.EdtIdentidadeChange(Sender: TObject);
begin
  EdtIdentidade.Color:= $00B9FFFF;
end;

procedure TFrmPrincipal.EdtIdentidadeEnter(Sender: TObject);
begin
  EdtIdentidade.Color:= $00B9FFFF;
end;

procedure TFrmPrincipal.EdtIdentidadeExit(Sender: TObject);
begin
  EdtIdentidade.Color:= clWindow;
end;

procedure TFrmPrincipal.EdtNomeEnter(Sender: TObject);
begin
  EdtNome.Color := $00B9FFFF;
end;


procedure TFrmPrincipal.EdtNomeExit(Sender: TObject);
begin
  EdtNome.Color:= clWindow;
end;

function TfrmPrincipal.verificaCamposPreenchidos: TEdit;
begin
  if(EdtNome.Text = EmptyStr) then
    result:=  EdtNome
  else if(EdtIdentidade.Text = EmptyStr) then
    result:= EdtIdentidade
  else if MskEdtCPF.Text = EmptyStr then
    result:= TEdit(MskEdtCPF)
  else if MskEdtTel.Text = EmptyStr then
    result:= TEdit(MskEdtTel)
  else if(EdtEmail.Text = EmptyStr) then
    result:= EdtEmail
  else if(MskEdtCep.Text =  EmptyStr) then
    result:= TEdit(MskEdtCep)
  else if(EdtLogradouro.Text = EmptyStr) then
    result:= EdtLogradouro
  else if(EdtNumero.Text = EmptyStr) then
    result:= EdtNumero
  else if(EdtBairro.Text = EmptyStr) then
    result:= EdtBairro
  else if(EdtCidade.Text = EmptyStr) then
    result:= EdtCidade
  else if(EdtUf.Text = EmptyStr) then
    result:= EdtUf
  else if(EdtPais.Text = EmptyStr) then
    result:= EdtPais;

end;

procedure TFrmPrincipal.limparCampos;
var
  I: Integer;
begin
  for I := 0 to self.ComponentCount-1 do
    begin
      if(self.Components[I] is TEdit) then
        (self.Components[I] as TEdit).Clear;
      if(self.Components[I] is TMaskEdit ) then
        (self.Components[I] as TMaskEdit).Clear;
    end;

end;


end.
