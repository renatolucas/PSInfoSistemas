unit Endereco;

interface

uses
  System.Variants;

Type
  TEndereco = class
    Private
      cep         : String;
      logradouro  : String;
      numero      : Cardinal;
      bairro      : String;
      complemento : String;
      cidade      : String;
      uf          : String;
      pais        : String;

    Public
      function getCep         : String;
      function getLogradouro  : String;
      function getNumero      : Cardinal;
      function getBairro      : String;
      function getComplemento : String;
      function getCidade      : String;
      function getUf          : String;
      function getPais        : String;

      constructor               create(fCep:String; fLogradouro:String; fNumero:Cardinal; fBairro:String; fComplemento:String; fCidade:String; fUf:String; fPais:String);
      procedure setCep         (fValor :String);
      procedure setLogradouro  (fValor :String);
      procedure setNumero      (fValor :Cardinal);
      procedure setBairro      (fValor :String);
      procedure setComplemento (fValor :String);
      procedure setCidade      (fValor :String);
      procedure setUf          (fValor :String);
      procedure setPais        (fValor :String);
   end;
   implementation

    constructor TEndereco.create(fCep:String; fLogradouro:String; fNumero:Cardinal; fBairro:String; fComplemento:String; fCidade:String; fUf:String; fPais:String);
    begin
      cep:= fCep;
      logradouro:= fLogradouro;
      numero:= fNumero;
      bairro:= fBairro;
      complemento := fComplemento;
      cidade:= fCidade;
      uf:= fUf;
      pais:= fPais;
    end;

    {$REGION 'Getters'}
      function TEndereco.getCep;
      begin
        result:= cep;
      end;

      function TEndereco.getLogradouro;
      begin
        result:= logradouro;
      end;

      function TEndereco.getNumero;
      begin
        result:= numero;
      end;

      function TEndereco.getBairro;
      begin
        result:= bairro;
      end;

      function TEndereco.getComplemento;
      begin
        result:= complemento;
      end;

      function TEndereco.getCidade;
      begin
        result:= cidade;
      end;

      function TEndereco.getUf;
      begin
        result:= uf;
      end;

      function TEndereco.getPais;
      begin
        result:= pais;
      end;
    {$ENDREGION}

    {$REGION 'Setters'}
      procedure TEndereco.setCep(fValor: string);
      begin
        cep:= fValor;
      end;

      procedure TEndereco.setLogradouro(fValor: string);
      begin
        logradouro:= fValor;
      end;

      procedure TEndereco.setNumero(fValor: Cardinal);
      begin
        numero:= fValor;
      end;

      procedure TEndereco.setBairro(fValor: string);
      begin
        bairro:= fValor;
      end;

      procedure TEndereco.setComplemento(fValor: string);
      begin
        complemento:= fValor;
      end;

      procedure TEndereco.setCidade(fValor: string);
      begin
        cidade:= fValor;
      end;

      procedure TEndereco.setUf(fValor: string);
      begin
        uf:= fValor;
      end;

      procedure TEndereco.setPais(fValor: string);
      begin
        pais:= fValor;
      end;
    {$ENDREGION}


end.
