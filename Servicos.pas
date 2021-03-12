unit Servicos;

interface
 uses
  System.SysUtils, System.Variants, System.Classes, Data.DBXJSON, DBXJSONReflect, idHTTP, IdSSLOpenSSL, System.Json, Cliente, Xml.XmlDoc,
  XMLIntf, IDSmtp, IdMessage, IdAttachmentFile, IdExplicitTLSClientServerBase, IdText;

  type
    TCep = class
      private

      public
        function GetCEP(CEP:string): TJSONObject;
    end;

    TEmail = class
      public
        function GerarXml(Cliente: TCliente): String;
        function EnviarEmail(Cliente: TCliente; ArquivoNome: String): Boolean;
    end;


implementation

  //Adaptado de https://github.com/juniorabranches/CEPascal
  function TCep.GetCEP(CEP: string): TJSONObject;
  var
     HTTP: TIdHTTP;
     IDSSLHandler : TIdSSLIOHandlerSocketOpenSSL;
     Response: TStringStream;
     LJsonObj: TJSONObject;
  begin
     try
        HTTP := TIdHTTP.Create;
        IDSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create;
        HTTP.IOHandler := IDSSLHandler;
        IDSSLHandler.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
        Response := TStringStream.Create('');
        HTTP.Get('https://viacep.com.br/ws/' + CEP + '/json', Response);
        if (HTTP.ResponseCode = 200) and not(Utf8ToAnsi(Response.DataString) = '{'#$A'  "erro": true'#$A'}') then
           Result := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes( Utf8ToAnsi(Response.DataString)), 0) as TJSONObject;
     finally
        FreeAndNil(HTTP);
        FreeAndNil(IDSSLHandler);
        Response.Destroy;
     end;
  end;

  function TEmail.GerarXml(Cliente: TCliente): String;
  var xml   : TXmlDocument;
      noCliente, noEndereco, noNome, noIdentidade, noCpf, noTelefone, noEmail, noCep,
      noLogradouro, noNumero, noComplemento, noBairro, noCidade, noUf, noPais :  IXMLNode;
  begin
     xml:= TXmlDocument.Create(nil);
     xml.Active:= true;
     xml.FileName := '';
     xml.XML.Text := '';
     xml.Active := False;
     xml.Active := True;
     xml.Version := '1.0';
     xml.Encoding := 'UTF-8';

     noCliente         := xml.AddChild('cliente');

     noNome            := xml.CreateNode('clienteNome', ntElement);
     noNome.Text       := cliente.getNome;
     noCliente.ChildNodes.Add(noNome);

     noIdentidade      :=  xml.CreateNode('clienteIdentidade', ntElement);
     noIdentidade.Text :=  cliente.getIdentidade;
     noCliente.ChildNodes.Add(noIdentidade);

     noCpf             :=  xml.CreateNode('clienteCpf', ntElement);
     noCpf.Text        :=  cliente.getIdentidade;
     noCliente.ChildNodes.Add(noCpf);

     noTelefone        :=  xml.CreateNode('clienteTelefone', ntElement);
     noTelefone.Text         :=  cliente.getTelefone;
     noCliente.ChildNodes.Add(noTelefone);

     noEmail           := xml.CreateNode('clienteEmail', ntElement);
     noEmail.Text            := cliente.getEmail;
     noCliente.ChildNodes.Add(noEmail);

     noEndereco        := xml.CreateNode('endereco', ntElement);

     noCep             := xml.CreateNode('enderecoCep', ntElement);
     noCep.Text        := cliente.getEndereco.getCep;
     noEndereco.ChildNodes.Add(noCep);

     noLogradouro      := xml.CreateNode('enderecoLogradouro', ntElement);
     noLogradouro.Text := cliente.getEndereco.getLogradouro;
     noEndereco.ChildNodes.Add(noLogradouro);

     noNumero           := xml.CreateNode('enderecoNumero', ntElement);
     noNumero.Text      := IntToStr(cliente.getEndereco.getNumero);
     noEndereco.ChildNodes.Add(noNumero);

     noComplemento      := xml.CreateNode('enderecoComplemento', ntElement);
     noComplemento.Text      := cliente.getEndereco.getComplemento;
     noEndereco.ChildNodes.Add(noComplemento);

     noBairro           := xml.CreateNode('enderecoBairro', ntElement);
     noBairro.Text           := cliente.getEndereco.getBairro;
     noEndereco.ChildNodes.Add(noBairro);

     noCidade            := xml.CreateNode('enderecoCidade', ntElement);
     noCidade.Text       := cliente.getEndereco.getCidade;
     noEndereco.ChildNodes.Add(noCidade);

     noUf                := xml.CreateNode('enderecoUf', ntElement);
     noUf.Text           := cliente.getEndereco.getUf;
     noEndereco.ChildNodes.Add(noUf);

     noPais              := xml.CreateNode('enderecoPais', ntElement);
     noPais.Text         := cliente.getEndereco.getPais;
     noEndereco.ChildNodes.Add(noPais);

     noCliente.ChildNodes.Add(noEndereco);
     xml.SaveToFile('cadastro.xml');
     result:= 'cadastro.xml';
  end;

  //Adaptado de http://swepc.se/blog/2016/12/07/send-email-using-gmail-delphi-10/#more-54
  function TEmail.EnviarEmail(Cliente: TCliente; ArquivoNome: String): Boolean;
  var
    DATA: TIdMessage;
    SMTP: TIdSMTP;
    SSL: TIdSSLIOHandlerSocketOpenSSL;
    function corpoEmail(Cliente: TCliente): String;
    begin
      result:= 'Nome: '         +cliente.getNome+sLineBreak+
               'Identidade: '   +cliente.getIdentidade+sLineBreak+
               'CPF: '          +cliente.getCPF+sLineBreak+
               'Telefone: '     +cliente.getTelefone+sLineBreak+
               'Email: '        +cliente.getEmail+sLineBreak+
               '__________________________________________'+sLineBreak+
               'Endereço '     +sLineBreak+
               'Cep: '          +cliente.getEndereco.getCep+sLineBreak+
               'Logradouro: '   +cliente.getEndereco.getLogradouro+sLineBreak+
               'Numero: '       +IntToStr(cliente.getEndereco.getNumero)+sLineBreak+
               'Complemento: '  +cliente.getEndereco.getComplemento+sLineBreak+
               'Bairro: '       +cliente.getEndereco.getBairro+sLineBreak+
               'Cidade: '       +cliente.getEndereco.getCidade+sLineBreak+
               'Estado: '       +cliente.getEndereco.getUf+sLineBreak+
               'País: '         +cliente.getEndereco.getPais+sLineBreak;
    end;

    begin
        SMTP := TIdSMTP.Create(nil);
        DATA := TIdMessage.Create(nil);
        SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
        SSL.SSLOptions.Method := sslvTLSv1;
        SSL.SSLOptions.Mode := sslmUnassigned;
        SSL.SSLOptions.VerifyMode := [];
        SSL.SSLOptions.VerifyDepth := 0;

        DATA.From.Address := 'renatoteste06@gmail.com';
        DATA.Recipients.EMailAddresses := 'renatolucas6@gmail.com';
        DATA.subject := 'Teste de admissão Info Sistemas';
        DATA.body.text := corpoEmail(Cliente);
        if FileExists(ArquivoNome) then
          TIdAttachmentFile.Create(DATA.MessageParts, ArquivoNome);

        SMTP.IOHandler := SSL;
        SMTP.Host := 'smtp.gmail.com';
        SMTP.Port := 587;
        SMTP.username := 'renatoteste06@gmail.com';
        SMTP.password := '[testes]';
        SMTP.UseTLS := utUseExplicitTLS;

        try
          SMTP.Connect;
          SMTP.Send(DATA);
        finally
          SMTP.Disconnect;
          SMTP.Free;
          DATA.Free;
          SSL.Free;
          if FileExists(ArquivoNome) then
            DeleteFile(ArquivoNome);

        end;

    end;


end.
