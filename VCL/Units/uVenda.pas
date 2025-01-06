unit uVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Types, System.ImageList, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ImgList, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmVenda = class(TForm)
    pnlClient: TPanel;
    pnlMargins: TPanel;
    pnlTop: TPanel;
    lblCodProd: TLabel;
    lblIDProduct: TLabel;
    lblNameProd: TLabel;
    pnlBtns: TPanel;
    pnlEdts: TPanel;
    pnlLbls: TPanel;
    pnlDate: TPanel;
    pnlEdts2: TPanel;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pnlQuite: TPanel;
    edtCodProd: TEdit;
    edtNameProd: TEdit;
    edtPrice: TEdit;
    lblAmount: TLabel;
    edtDate: TEdit;
    btnSale: TButton;
    btnExlude: TButton;
    grid: TDBGrid;
    ds: TDataSource;
    vendas: TFDTable;
    pnlAmount: TPanel;
    edtAmount: TEdit;
    lblDate: TLabel;
    pnlDiscount: TPanel;
    edtDiscount: TEdit;
    lblDiscount: TLabel;
    pnlName: TPanel;
    edtName: TEdit;
    lblName: TLabel;
    check: TCheckBox;
    vendasnome_vendedor: TWideStringField;
    vendasnome_prod_vendido: TWideStringField;
    vendasid_prod_vendido: TIntegerField;
    vendasdata_venda: TDateField;
    vendaspreco_prod: TCurrencyField;
    vendasqntd_vendida: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure btnSaleClick(Sender: TObject);
    procedure btnExludeClick(Sender: TObject);
    procedure checkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVenda: TfrmVenda;

implementation

uses
  uDM;

{$R *.dfm}

procedure TfrmVenda.FormCreate(Sender: TObject);
begin
  edtDate.Text := DateToStr(Now);
end;

procedure TfrmVenda.btnExludeClick(Sender: TObject);
begin

  if not grid.DataSource.DataSet.IsEmpty then
  grid.DataSource.DataSet.Delete;

end;

procedure TfrmVenda.btnSaleClick(Sender: TObject);
var
  pId:
  Integer;
  pNomeProd:
  String;
  qry:
  TFDQuery;
begin

  qry := TFDQuery.Create(nil);
  pNomeProd := edtNameProd.Text;

  if DM.ConnDbERP.Connected = True then
  begin
    qry.Connection := DM.ConnDbERP;
  end;

  if Trim(edtCodProd.Text) = EmptyStr then
  begin
    FreeAndNil(qry);
    Exit;
  end
  else
    pId := StrToInt(edtCodProd.Text);

  try

    if not (Trim(edtCodProd.Text) = EmptyStr) then
    begin

      qry.Close;

      qry.SQL.Text :=

      'SELECT id_prod_vendido, nome_prod_vendido FROM vendas WHERE ' +
      'id_prod_vendido = :pId AND nome_prod_vendido = :pNomeProd;';

      qry.ParamByName('pNomeProd').AsString := pNomeProd;
      qry.ParamByName('pId').AsInteger := pId;

      qry.Open;

      if qry.IsEmpty then
      begin

        if not (Trim(edtNameProd.Text) = EmptyStr) then
        begin

          qry.Close;

          qry.SQL.Text :=

          'SELECT id_produto, nome_produto FROM produtos WHERE id_produto = :pId ' +
          'AND nome_produto = :pNomeProd;';

          qry.ParamByName('pNomeProd').AsString := pNomeProd;
          qry.ParamByName('pId').AsInteger := pId;

          qry.Open;

          if qry.IsEmpty then
          begin
            ShowMessage('Produto n�o existe');
          end;

        end;

      end
      else
      begin

        ShowMessage('Produto j� existe, deseja edita-lo?');

      end;

    end;

  finally


    FreeAndNil(qry);

  end;

end;

procedure TfrmVenda.checkClick(Sender: TObject);
begin

  if check.Checked then
  begin
    edtDate.Text := DateToStr(Now);
  end
  else
    edtDate.Text := '';

end;

//procedure TfrmVenda.btnMinClick(Sender: TObject);
//begin
//  Self.WindowState := TWindowState.wsMinimized;
//end;

//
//rocedure TfrmVenda.btnMaxClick(Sender: TObject);
//begin
//
//  if Self.WindowState = TWindowState.wsNormal then
//  begin
//    Self.WindowState := TWindowState.wsMaximized;
//  end
//  else
//    Self.WindowState := TWindowState.wsNormal;
//
//end;
//
//procedure TfrmVenda.btnCloseClick(Sender: TObject);
//begin
//  Close;
//end;

end.
