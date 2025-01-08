unit uVenda;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Types,
  System.ImageList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.ImgList,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Grids,
  Vcl.DBGrids;

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
    checkDiscount: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnSaleClick(Sender: TObject);
    procedure btnExludeClick(Sender: TObject);
    procedure checkClick(Sender: TObject);
    procedure checkDiscountClick(Sender: TObject);
    procedure edtCodProdExit(Sender: TObject);
    procedure gridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtCodProdChange(Sender: TObject);
    procedure gridMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure edtPriceClick(Sender: TObject);
    procedure edtPriceEnter(Sender: TObject);
    procedure edtPriceChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

  edtPrice.Text := 'R$ ';
  edtPrice.SelStart := Length(edtPrice.Text);
  edtDiscount.Enabled := False;
  edtDate.Text := DateToStr(Now);

end;

procedure TfrmVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if edtPrice.SelStart < 4 then
  begin
    if (Key = VK_BACK) or (Key = VK_DELETE) then
    begin
      Key := 0;
    end;
  end;

end;

procedure TfrmVenda.gridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  if gdSelected in State then
  begin
    (Sender as TDBGrid).Canvas.Brush.Color := clSilver;
    (Sender as TDBGrid).Canvas.FillRect(Rect);

    (Sender as TDBGrid).Canvas.Font.Color := clBlack;
    (Sender as TDBGrid).Canvas.Font.Style := [fsBold];

    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end
  else
    (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmVenda.gridMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var
  pId: Integer;
  pNomeProd,
  pNomeVend:
  String;
begin

  Handled := False;

//  pId := grid.DataSource.DataSet.FieldByName('id_produto').AsInteger;
//  pNomeVend := grid.DataSource.DataSet.FieldByName('nome_vendedor').AsString;
//  pNomeProd := grid.DataSource.DataSet.FieldByName('nome_prod_vendido').AsString;
//
//  edtCodProd.Text := IntToStr(pId);
//  edtName.Text := pNomeVend;
//  edtNameProd.Text := pNomeProd;

end;

procedure TfrmVenda.btnExludeClick(Sender: TObject);
begin

  if not grid.DataSource.DataSet.IsEmpty then
    grid.DataSource.DataSet.Delete;

end;

procedure TfrmVenda.btnSaleClick(Sender: TObject);
var
  pId: Integer;
  pNomeProd: string;
  qry: TFDQuery;
begin

  if DM.ConnDbERP.Connected = True then
  begin

    qry := TFDQuery.Create(nil);
    qry.Connection := DM.ConnDbERP;

  end
  else
    ShowMessage('Erro de conexão!');

  try

    if not (Trim(edtCodProd.Text) = EmptyStr) then
    begin

      pNomeProd := edtNameProd.Text;
      pId := StrToInt(edtCodProd.Text);

      qry.SQL.Text :=

      'SELECT id_prod_vendido, nome_prod_vendido FROM vendas WHERE ' + 'id_' +
      'prod_vendido = :pId AND nome_prod_vendido = :pNomeProd;';

      qry.ParamByName('pNomeProd').AsString := pNomeProd;
      qry.ParamByName('pId').AsInteger := pId;

      qry.Open;

      if qry.IsEmpty then
      begin

        if not (Trim(edtNameProd.Text) = EmptyStr) then
        begin

          qry.Close;

          qry.SQL.Text :=

          'SELECT id_produto, nome_produto FROM produtos WHERE id_produto = ' +
          ':pId AND nome_produto = :pNomeProd;';

          qry.ParamByName('pNomeProd').AsString := pNomeProd;
          qry.ParamByName('pId').AsInteger := pId;

          qry.Open;

          if not qry.IsEmpty then
          begin

          end;

        end;

      end
      else
      begin

        ShowMessage('Produto já existe, deseja edita-lo?');


      end;

    end;

  finally

    FreeAndNil(qry);

  end;

end;

procedure TfrmVenda.checkDiscountClick(Sender: TObject);
begin

  if checkDiscount.Checked = True then
  begin
    edtDiscount.Color := $00E6E6E6;
    edtDiscount.Enabled := False;
  end
  else
  begin
    edtDiscount.Color := clWindow;
    edtDiscount.Enabled := True;
  end;

end;

procedure TfrmVenda.edtCodProdChange(Sender: TObject);
var
  qry: TFDQuery;
  pId: Integer;
begin

  if Trim(edtCodProd.Text) = EmptyStr then
    Exit;

  if edtCodProd.Text = IntToStr(edtCodProd.MaxLength) then
    SystemParametersInfo(SPI_SETBEEP, 0, nil, SPIF_SENDWININICHANGE);

  try

    pId := StrToInt(edtCodProd.Text);
    qry := TFDQuery.Create(nil);

    if DM.ConnDbERP.Connected = True then
    begin
      qry.Connection := DM.ConnDbERP;
    end
    else
      ShowMessage('Erro com a conexão!');

    qry.SQL.Text := 'SELECT nome_vendedor, nome_prod_vendido, preco_prod FROM' +
    ' vendas WHERE id_prod_vendido = :pId';

    qry.ParamByName('pId').AsInteger := pId;

    qry.Open;

    if not qry.IsEmpty then
    begin

      edtName.Text := qry.FieldByName('nome_vendedor').AsString;
      edtNameProd.Text := qry.FieldByName('nome_prod_vendido').AsString;
      edtPrice.Text := IntToStr(qry.FieldByName('preco_prod').AsInteger);

    end
    else
    begin

      edtName.Text := EmptyStr;
      edtNameProd.Text := EmptyStr;
      edtPrice.Text := EmptyStr;

    end;

  finally

    FreeAndNil(qry);

  end;

end;

procedure TfrmVenda.edtCodProdExit(Sender: TObject);
var
  qry: TFDQuery;
  pId: Integer;
begin

  if Trim(edtCodProd.Text) = EmptyStr then
    Exit;

  try

    pId := StrToInt(edtCodProd.Text);
    qry := TFDQuery.Create(nil);

    if DM.ConnDbERP.Connected = True then
    begin
      qry.Connection := DM.ConnDbERP;
    end
    else
      ShowMessage('Erro com a conexão!');

    qry.SQL.Text := 'SELECT nome_vendedor, nome_prod_vendido, preco_prod FROM' +
    ' vendas WHERE id_prod_vendido = :pId';

    qry.ParamByName('pId').AsInteger := pId;

    qry.Open;

    if not qry.IsEmpty then
    begin

      edtName.Text := qry.FieldByName('nome_vendedor').AsString;
      edtNameProd.Text := qry.FieldByName('nome_prod_vendido').AsString;
      edtPrice.Text := IntToStr(qry.FieldByName('preco_prod').AsInteger);

    end
    else
    begin

      edtName.Text := EmptyStr;
      edtNameProd.Text := EmptyStr;
      edtPrice.Text := EmptyStr;

    end;

  finally

    FreeAndNil(qry);

  end;

end;

procedure TfrmVenda.edtPriceChange(Sender: TObject);
begin

  if Trim(edtPrice.Text) = EmptyStr then
  begin
    edtPrice.Text := 'R$ ';
    edtPrice.SelStart := Length(edtPrice.Text);
  end;

end;

procedure TfrmVenda.edtPriceClick(Sender: TObject);
begin

  if edtPrice.Text = 'R$ ' then
    edtPrice.SelStart := Length(edtPrice.Text);

  if Trim(edtPrice.Text) = EmptyStr then
  begin
    edtPrice.Text := 'R$ ';
    edtPrice.SelStart := Length(edtPrice.Text);
  end;

end;

procedure TfrmVenda.edtPriceEnter(Sender: TObject);
begin

  if edtPrice.Text = 'R$ ' then
    edtPrice.SelStart := Length(edtPrice.Text);

  if Trim(edtPrice.Text) = EmptyStr then
  begin
    edtPrice.Text := 'R$ ';
    edtPrice.SelStart := Length(edtPrice.Text);
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

end.

