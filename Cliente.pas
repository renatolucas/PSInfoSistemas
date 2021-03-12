unit Cliente;

interface

uses
  Endereco;

Type
  TCliente = Class
    Private
      nome       :  String;
      identidade :  String;
      cpf        :  String;
      telefone   :  String;
      email      :  String;
      endereco   : TEndereco;

    Public
      function getNome        : String;
      function getIdentidade  : String;
      function getCPF         : String;
      function getTelefone    : String;
      function getEmail       : String;
      function getEndereco    : TEndereco;

      constructor               create(fNome:String; fIdentidade:String; fCpf:String; fTelefone:String; fEmail:String; fEndereco:TEndereco);
      procedure setNome        (fValor: String);
      procedure setIdentidade  (fValor: String);
      procedure setCPF         (fValor: String);
      procedure setTelefone    (fValor: String);
      procedure setEmail       (fValor: String);
      procedure setEndereco    (fValor: TEndereco);
  End;

  implementation

    constructor TCliente.create(fNome:String; fIdentidade:String; fCpf:String; fTelefone:String; fEmail:String; fEndereco:TEndereco);
    begin
      nome:= fNome;
      identidade:= fIdentidade;
      cpf:= fCpf;
      telefone:= fTelefone;
      email:= fEmail;
      endereco:= fEndereco;
    end;

    {$REGION 'Getters'}

    function TCliente.getNome;
    begin
      result:= nome;
    end;

    function TCliente.getIdentidade;
    begin
      result:= identidade;
    end;

    function TCliente.getCPF;
    begin
     result:= cpf;
    end;

    function TCliente.getTelefone;
    begin
      result:= telefone;
    end;

    function TCliente.getEmail;
    begin
      result:= email;
    end;

    function TCliente.getEndereco;
    begin
      result:= endereco;
    end;

    {$ENDREGION}

    {$REGION 'Setters'}
    procedure TCliente.setNome(fValor: string);
    begin
      nome:= fValor;
    end;

    procedure TCliente.setIdentidade(fValor: string);
    begin
      identidade:= fValor;
    end;

    procedure TCliente.setCPF(fValor: string);
    begin
      cpf:=  fValor;
    end;

    procedure TCliente.setTelefone(fValor: string);
    begin
      telefone:= fValor;
    end;

    procedure TCliente.setEmail(fValor: string);
    begin
      email:= fValor;
    end;

    procedure TCliente.setEndereco(fValor: TEndereco);
    begin
      endereco:= fValor;
    end;
    {$ENDREGION}





end.
