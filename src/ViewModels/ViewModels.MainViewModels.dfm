object MainViewModel: TMainViewModel
  Height = 300
  Width = 405
  PixelsPerInch = 96
  object BindSource: TPrototypeBindSource
    AutoActivate = True
    AutoEdit = False
    AutoPost = False
    FieldDefs = <
      item
        Name = 'URL'
        ReadOnly = False
      end
      item
        Name = 'Content'
        ReadOnly = False
      end>
    ScopeMappings = <>
    OnCreateAdapter = BindSourceCreateAdapter
    Left = 56
    Top = 16
  end
end
