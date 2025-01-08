unit uFrameStock;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Mask,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.UI.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Phys,
  FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait;

type
  TframeStock = class(TFrame)
    pnlAddClient: TPanel;
    pnlMargins: TPanel;
    pnlTitle: TPanel;
    pnlLbls: TPanel;
    lblFull: TLabel;
    pnlEdts: TPanel;
    pnlEdtStock: TPanel;
    edtStock: TEdit;
    lblProduct: TLabel;
    lblTitle: TLabel;
    btnVenda: TButton;
    pnlCombo: TPanel;
    combo: TComboBox;
    pnlLbls2: TPanel;
    lblPrice: TLabel;
    lblIDProd: TLabel;
    pnlEdts2: TPanel;
    pnlPrice: TPanel;
    edtPrice: TEdit;
    pnlEdtID: TPanel;
    edtID: TEdit;
    procedure btnVendaClick(Sender: TObject);
    procedure comboChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  uDM,
  uVenda;

procedure TframeStock.btnVendaClick(Sender: TObject);
begin
  frmVenda.Show;
end;

procedure TframeStock.comboChange(Sender: TObject);
var
  qry: TFDQuery;
  produtoId: Integer;
  totalEstoque, prodEstoque, precoEstoque: Double;
begin

  if combo.ItemIndex = -1 then
    Exit;

  qry := TFDQuery.Create(nil);
  qry.Connection := DM.ConnDbERP;

  try

    if combo.ItemIndex = 0 then
    begin

      edtID.Text := 'Nulo';

      qry.SQL.Text := 'SELECT SUM(qntd_estoque) AS total_estoque FROM produtos;';

      qry.Open;

      if not qry.IsEmpty then
      begin

        totalEstoque := qry.FieldByName('total_estoque').AsFloat;
        edtStock.Text := FormatFloat('###,###,###,###', totalEstoque);

        qry.Close;

        qry.SQL.Text := 'SELECT SUM(preco_unitario) AS total_preco FROM produtos';
        qry.Open;

        if not qry.IsEmpty then
        begin
          precoEstoque := qry.FieldByName('total_preco').AsCurrency;
          edtPrice.Text := 'R$ ' + precoEstoque.ToString + ',00';
        end;

      end;

    end
    else
    begin

      produtoId := Integer(combo.Items.Objects[combo.ItemIndex]);

      qry.SQL.Text := 'SELECT qntd_estoque, preco_unitario FROM produtos ' + 'WHERE id_produto = :produto_id';
      qry.ParamByName('produto_id').AsInteger := produtoId;

      qry.Open;

      //if not TryStrToInt(edtAmount.Text, qntd_estoque) then
      //raise Exception.Create('Estoque inválido!');


      if not qry.IsEmpty then
      begin
        // Pega a quantidade do produto
        prodEstoque := qry.FieldByName('qntd_estoque').AsFloat;
        precoEstoque := qry.FieldByName('preco_unitario').AsCurrency;
        edtPrice.Text := 'R$ ' + precoEstoque.ToString + ',00';
        edtStock.Text := FormatFloat('###,###,###,###', prodEstoque);
      end
      else
      begin
        edtStock.Text := '0';
        edtPrice.Text := '0';
      end;

    end;

  finally

    FreeAndNil(qry);

  end;
end;

end.

