program ProjectERP;

uses
  Vcl.Forms,
  System.Hash,
  uMain in '..\Units\uMain.pas' {frmMain},
  uDM in '..\Units\DB\uDM.pas' {DM: TDataModule},
  uFrameAddProduct in '..\Units\Frames\uFrameAddProduct.pas' {frameAddProduct: TFrame},
  uFrameStock in '..\Units\Frames\uFrameStock.pas' {frameStock: TFrame},
  uFrameAddClient in '..\Units\Frames\uFrameAddClient.pas' {frameAddClient: TFrame},
  uConf in '..\Units\uConf.pas' {frmDB},
  dlgConfirm in '..\Units\Dlg\dlgConfirm.pas' {dlgConfirmDelete},
  uVenda in '..\Units\uVenda.pas' {frmVenda},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmVenda, frmVenda);
  Application.CreateForm(TfrmDB, frmDB);
  Application.CreateForm(TdlgConfirmDelete, dlgConfirmDelete);
  reportMemoryLeaksOnShutdown := True;
  Application.Run;
end.
