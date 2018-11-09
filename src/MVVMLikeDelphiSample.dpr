program MVVMLikeDelphiSample;

uses
  System.StartUpCopy,
  FMX.Forms,
  Views.MainViews in 'Views\Views.MainViews.pas' {MainForm},
  ViewModels.MainViewModels in 'ViewModels\ViewModels.MainViewModels.pas' {MainViewModel: TDataModule},
  DataObjects.WebInfos in 'DataObjects\DataObjects.WebInfos.pas',
  Models.DataCommunicationModels in 'Models\Models.DataCommunicationModels.pas';

{$R *.res}

var
  MainForm: TMainForm;

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
