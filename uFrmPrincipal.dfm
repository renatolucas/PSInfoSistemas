object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de clientes'
  ClientHeight = 571
  ClientWidth = 703
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 703
    Height = 571
    Align = alClient
    TabOrder = 0
    object LblTitulo: TLabel
      Left = 1
      Top = 1
      Width = 701
      Height = 24
      Align = alTop
      Alignment = taCenter
      Caption = 'Cadastro de clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 181
    end
    object LblMskEdtCPF: TLabel
      Left = 9
      Top = 143
      Width = 30
      Height = 18
      Caption = 'CPF:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblMskEdtTel: TLabel
      Left = 9
      Top = 191
      Width = 62
      Height = 18
      Caption = 'Telefone:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblNome: TLabel
      Left = 9
      Top = 47
      Width = 44
      Height = 18
      Caption = 'Nome:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblIdentidade: TLabel
      Left = 9
      Top = 95
      Width = 74
      Height = 18
      Caption = 'Identidade:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblEmail: TLabel
      Left = 9
      Top = 240
      Width = 38
      Height = 18
      Caption = 'Email:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object MskEdtCPF: TMaskEdit
      Left = 89
      Top = 144
      Width = 114
      Height = 21
      EditMask = '999.999.999-99;0;_'
      MaxLength = 14
      TabOrder = 2
      Text = ''
      OnEnter = MskEdtCPFEnter
      OnExit = MskEdtCPFExit
    end
    object MskEdtTel: TMaskEdit
      Left = 90
      Top = 192
      Width = 115
      Height = 21
      EditMask = '!\(99\)9999-9999;0;_'
      MaxLength = 13
      TabOrder = 3
      Text = ''
      OnEnter = MskEdtTelEnter
      OnExit = MskEdtTelExit
    end
    object GrpBoxEndereco: TGroupBox
      Left = 25
      Top = 280
      Width = 656
      Height = 233
      Caption = 'Endere'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      object LblCep: TLabel
        Left = 13
        Top = 24
        Width = 30
        Height = 18
        Caption = 'CEP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblEstado: TLabel
        Left = 13
        Top = 136
        Width = 23
        Height = 18
        Caption = 'UF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblPais: TLabel
        Left = 150
        Top = 138
        Width = 30
        Height = 18
        Caption = 'Pa'#237's:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblLogradouro: TLabel
        Left = 141
        Top = 24
        Width = 78
        Height = 18
        Caption = 'Logradouro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblNumero: TLabel
        Left = 368
        Top = 24
        Width = 57
        Height = 18
        Caption = 'N'#250'mero:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblComplemento: TLabel
        Left = 13
        Top = 80
        Width = 95
        Height = 18
        Caption = 'Complemento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblBairro: TLabel
        Left = 225
        Top = 80
        Width = 42
        Height = 18
        Caption = 'Bairro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblCidade: TLabel
        Left = 400
        Top = 80
        Width = 48
        Height = 18
        Caption = 'Cidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object MskEdtCep: TMaskEdit
        Left = 49
        Top = 24
        Width = 67
        Height = 24
        EditMask = '99999-999;0;_'
        MaxLength = 9
        TabOrder = 0
        Text = ''
        OnEnter = MskEdtCepEnter
        OnExit = MskEdtCepExit
      end
      object EdtLogradouro: TEdit
        Left = 225
        Top = 24
        Width = 121
        Height = 24
        TabOrder = 1
      end
      object EdtNumero: TEdit
        Left = 431
        Top = 24
        Width = 121
        Height = 24
        NumbersOnly = True
        TabOrder = 2
      end
      object EdtComplemento: TEdit
        Left = 114
        Top = 78
        Width = 87
        Height = 24
        TabOrder = 3
      end
      object EdtBairro: TEdit
        Left = 273
        Top = 80
        Width = 121
        Height = 24
        TabOrder = 4
      end
      object EdtCidade: TEdit
        Left = 454
        Top = 80
        Width = 121
        Height = 24
        TabOrder = 5
      end
      object EdtUf: TEdit
        Left = 42
        Top = 133
        Width = 74
        Height = 24
        TabOrder = 6
      end
      object EdtPais: TEdit
        Left = 186
        Top = 133
        Width = 121
        Height = 24
        TabOrder = 7
      end
    end
    object EdtNome: TEdit
      Left = 90
      Top = 48
      Width = 210
      Height = 21
      TabOrder = 0
      OnEnter = EdtNomeEnter
      OnExit = EdtNomeExit
    end
    object EdtIdentidade: TEdit
      Left = 89
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 1
      OnChange = EdtIdentidadeChange
      OnEnter = EdtIdentidadeEnter
      OnExit = EdtIdentidadeExit
    end
    object EdtEmail: TEdit
      Left = 90
      Top = 237
      Width = 121
      Height = 21
      TabOrder = 4
      OnEnter = EdtEmailEnter
      OnExit = EdtEmailExit
    end
    object BtnSalvar: TBitBtn
      Left = 280
      Top = 519
      Width = 91
      Height = 34
      Caption = '&Salvar'
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
      TabOrder = 6
      OnClick = BtnSalvarClick
    end
  end
end
