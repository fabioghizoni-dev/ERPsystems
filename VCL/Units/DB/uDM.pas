unit uDM;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Data.DB;

type
  TDM = class(TDataModule)
    DriverPG: TFDPhysPgDriverLink;
    ConnDbERP: TFDConnection;
    clientes: TFDTable;
    produtos: TFDTable;
    dtSrc: TDataSource;
    dtSrc2: TDataSource;
    dtSrc3: TDataSource;
    produtosid_produto: TIntegerField;
    produtosnome_produto: TWideStringField;
    produtospreco_unitario: TCurrencyField;
    produtosqntd_estoque: TIntegerField;
    vendas: TFDTable;
    vendasnome_vendedor: TWideStringField;
    vendasnome_prod_vendido: TWideStringField;
    vendasid_prod_vendido: TIntegerField;
    vendasdata_venda: TDateField;
    vendaspreco_prod: TCurrencyField;
    vendasqntd_vendida: TIntegerField;
    dtSrc4: TDataSource;
    clientesid_cliente: TIntegerField;
    clientesnome_cliente: TWideStringField;
    clientescpf_cliente: TWideStringField;
    clientescelular_cliente: TWideStringField;
    clientesdata_adicionado: TDateField;
    endereco: TFDTable;
    enderecopais_cliente: TWideStringField;
    enderecoestado_cliente: TWideStringField;
    enderecocidade_cliente: TWideStringField;
    enderecobairro_cliente: TWideStringField;
    enderecoid_cliente_end: TIntegerField;
    endereconome_cliente: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure Datasets(DataSet: TFDTable; Connection: TFDConnection);
    procedure LoadImage(const Path: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses
  Vcl.Forms,
  Vcl.Dialogs,
  dlgConfirm,
  uMain;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
const
  LibpqPath = 'dlls32\libpq.dll';
var
  Path, OnImagePath, OffImagePath: String;
begin
  try
    // Caminho base do execut�vel
    Path := ExtractFileDir(Application.ExeName);
    Path := ExtractFileDir(Path);

    // Caminho das imagens
    OffImagePath := ExtractFileDir(Path);
    OnImagePath := ExtractFileDir(Path);

    // DriverPG 32x
    DriverPG.VendorLib := ExtractFilePath(Application.ExeName) + LibpqPath;

    // Conecta ao banco de dados
    if not Assigned(ConnDbERP) then
      raise Exception.Create('Objeto '+ ConnDbERP.Name +' n�o est� inicializado.');

    if not ConnDbERP.Connected then
      ConnDbERP.Connected := True;

    // Ativa os datasets
    Datasets(clientes, ConnDbERP);
    Datasets(endereco, ConnDbERP);
    Datasets(produtos, ConnDbERP);

    // Online
    LoadImage(OnImagePath + '\Src\32px\Online_32px.png');

  except
    on E: Exception do
    begin
      ShowMessage('Falha na Conex�o com o Banco: ' + E.Message);

      // Offline
      LoadImage(OffImagePath + '\Src\32px\Offline_32px.png');
    end;
  end;
end;

procedure TDM.Datasets(DataSet: TFDTable; Connection: TFDConnection);
begin
  if not DataSet.Active then
  begin
    DataSet.Connection := Connection;
    DataSet.Active := True;
  end;
end;

procedure TDM.LoadImage(const Path: string);
begin
  if FileExists(Path) then
    frmMain.imgConn.Picture.LoadFromFile(Path);
end;

end.

