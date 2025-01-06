unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    DriverPG: TFDPhysPgDriverLink;
    ConnDbERP: TFDConnection;
    clientes: TFDTable;
    endereco: TFDTable;
    produtos: TFDTable;
    dtSrc: TDataSource;
    dtSrc2: TDataSource;
    dtSrc3: TDataSource;
    endereconome_cliente_identify: TIntegerField;
    enderecopais_cliente: TWideStringField;
    enderecoestado_cliente: TWideStringField;
    enderecocidade_cliente: TWideStringField;
    enderecobairro_cliente: TWideStringField;
    produtosid_produto: TIntegerField;
    produtosnome_produto: TWideStringField;
    produtospreco_unitario: TCurrencyField;
    produtosqntd_estoque: TIntegerField;
    clientesid_cliente: TIntegerField;
    clientesnome_cliente: TWideStringField;
    clientescpf_cliente: TWideStringField;
    clientescelular_cliente: TWideStringField;
    clientesdata_adicionado: TDateField;
    vendas: TFDTable;
    vendasnome_vendedor: TWideStringField;
    vendasnome_prod_vendido: TWideStringField;
    vendasid_prod_vendido: TIntegerField;
    vendasdata_venda: TDateField;
    vendaspreco_prod: TCurrencyField;
    vendasqntd_vendida: TIntegerField;
    dtSrc4: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses
  Vcl.Forms, Vcl.Dialogs, dlgConfirm, uMain;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
var
  Path: String;
begin

  try

    DriverPG.VendorLib := ExtractFilePath(Application.ExeName) + '\dlls32\libpq.dll';

    if not (ConnDbERP = nil) and ConnDbERP.Connected = False then
    begin

      ConnDbERP.Connected := True;

      Path := 'C:\Users\User\Documents\Embarcadero\Studio\Projects\ERPsystem-main'
      + '\VCL\Src\32px\Online_32px.png';

      if clientes.Active = False then
      begin
        clientes.Connection := ConnDbERP;
        clientes.Active := True;
      end;
      if endereco.Active = False then
      begin
        endereco.Connection := ConnDbERP;
        endereco.Active := True;
      end;
      if produtos.Active = False then
      begin
        produtos.Connection := ConnDbERP;
        produtos.Active := True;
      end;

      if FileExists(Path) then
        frmMain.imgConn.Picture.LoadFromFile(Path);

    end
    else if not (ConnDbERP = nil) and ConnDbERP.Connected = True then
    begin

      Path := 'C:\Users\User\Documents\Embarcadero\Studio\Projects\ERPsystem-main'
      + '\VCL\Src\32px\Online_32px.png';

      if clientes.Active = False then
      begin
        clientes.Connection := ConnDbERP;
        clientes.Active := True;
      end;
      if endereco.Active = False then
      begin
        endereco.Connection := ConnDbERP;
        endereco.Active := True;
      end;
      if produtos.Active = False then
      begin
        produtos.Connection := ConnDbERP;
        produtos.Active := True;
      end;

      if FileExists(Path) then
        frmMain.imgConn.Picture.LoadFromFile(Path);

    end;

  except

    on E: Exception do
    begin
      Exception.Create('Falha na Conexão com o Banco!');
      Path := 'C:\Users\User\Documents\Embarcadero\Studio\Projects\ERPsystem-main'
      + '\VCL\Src\32px\Offline_32px.png';

      if FileExists(Path) then
        frmMain.imgConn.Picture.LoadFromFile(Path);

    end;

  end;

end;

end.

