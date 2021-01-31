object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Tag your photo'
  ClientHeight = 501
  ClientWidth = 501
  Color = clMenu
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object memTagList: TMemo
    Left = 24
    Top = 24
    Width = 273
    Height = 297
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
    OnChange = memTagListChange
  end
  object leSeparator: TLabeledEdit
    Left = 368
    Top = 300
    Width = 111
    Height = 21
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'Separator'
    LabelPosition = lpLeft
    TabOrder = 1
    OnChange = memTagListChange
  end
  object paPreview: TPanel
    Left = 24
    Top = 352
    Width = 455
    Height = 129
    Color = clNavy
    ParentBackground = False
    TabOrder = 2
    object laPreview: TLabel
      Left = 201
      Top = 6
      Width = 52
      Height = 13
      Caption = 'Vorschau'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAqua
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object memPreview: TMemo
      Left = 16
      Top = 25
      Width = 425
      Height = 49
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object bbCopyCommaSeparated: TBitBtn
      Left = 112
      Top = 88
      Width = 227
      Height = 25
      Caption = 'Vorschau in Zwischenablage kopieren'
      DoubleBuffered = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF444444444FFFFFFF4FFFFFFF4FFFFFFF4F000
        00F4F0000004FFFFFFF4F0FFFFF4F00000F4F0F00004FFFFFFF4F0FFFFF4F00F
        4444F0F00004FFFF4F4FF0FFFFF4FFFF44FFF0F00F0444444FFFF0FFFF0F0FFF
        FFFFF0FFFF00FFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = bCopyCommaSeparatedClick
    end
  end
  object gbUmlaut: TGroupBox
    Left = 303
    Top = 232
    Width = 176
    Height = 49
    TabOrder = 3
    object cbChangeUmlaute: TCheckBox
      Left = 16
      Top = 0
      Width = 97
      Height = 17
      Caption = 'Umlaute '#228'ndern'
      TabOrder = 0
      OnClick = memTagListChange
    end
    object cbAddUmlautWord: TCheckBox
      Left = 16
      Top = 29
      Width = 137
      Height = 12
      Caption = 'Beide Worte ausgeben'
      TabOrder = 1
      OnClick = memTagListChange
    end
  end
  object gbTagList: TGroupBox
    Left = 303
    Top = 24
    Width = 185
    Height = 97
    Caption = 'Schlagwortliste'
    TabOrder = 4
    object bbLoadTagList: TBitBtn
      Left = 11
      Top = 24
      Width = 78
      Height = 25
      Action = acLoadTagList
      Caption = 'Laden'
      DoubleBuffered = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF00000000000FFFFF003333333330FFFF0B0333333333
        0FFF0FB03333333330FF0BFB03333333330F0FBFB000000000000BFBFBFBFB0F
        FFFF0FBFBFBFBF0FFFFF0BFB0000000FFFFFF000FFFFFFFF000FFFFFFFFFFFFF
        F00FFFFFFFFF0FFF0F0FFFFFFFFFF000FFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object bbSaveTagList: TBitBtn
      Left = 11
      Top = 55
      Width = 78
      Height = 25
      Action = acSaveTagList
      Caption = 'Speichern'
      DoubleBuffered = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFF0000000000000FF033000000FF030FF033000000FF030FF033000000FF
        030FF03300000000030FF03333333333330FF03300000000330FF030FFFFFFFF
        030FF030FFFFFFFF030FF030FFFFFFFF030FF030FFFFFFFF030FF030FFFFFFFF
        000FF030FFFFFFFF0F0FF00000000000000FFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object bbClearTagList: TBitBtn
      Left = 98
      Top = 24
      Width = 76
      Height = 25
      Action = acClearTagList
      Caption = 'L'#246'schen'
      DoubleBuffered = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F0000F000FFF
        FFFF00000000FFF0FFFF00FF000FF0FFFFFF00FFF00FFFFFFFFFF00FF00F00FF
        FFFFFF00F0F0110FFFFFFFFF0F099910FFFFF00FFF0999910FFFF00F0FF09990
        30FFFF00F0FF090B030FFFFFFFFFF0B0B030FFFF0FFFFF0B0B33FFFFFFFFFFF0
        BBB3FFF0FFFFFFFF0BBBFFFFFFFFFFFFF0BBFFFFFFFFFFFFFF0B}
      ParentDoubleBuffered = False
      TabOrder = 2
    end
    object bbAppendTagList: TBitBtn
      Left = 98
      Top = 55
      Width = 76
      Height = 25
      Action = acAppendTagList
      Caption = 'Anf'#252'gen'
      DoubleBuffered = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF4FFFFFFF
        FFFFFFFF44FFFFFFFFFFFF44444FFFFFFFFFF4FF44FFFFFFFFFFF4FF4FFF0000
        0000F4FFFFFFFFFFFFFFF4FFFFFFFF000000F4FFFFFFFFFFFFFFF4FFFFFFFF00
        0000F4FFFFFFFFFFFFFFF4FFFFFFFF000000F4FFFFFFFFFFFFFFF4FFFFFF0000
        0000F4FFFFFFFFFFFFFFFF44444FFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 327
    Top = 150
    Width = 142
    Height = 51
    BevelOuter = bvLowered
    TabOrder = 5
    object Image1: TImage
      Left = 6
      Top = 8
      Width = 31
      Height = 33
      Picture.Data = {
        055449636F6E0000010001002020100000000000E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF00BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
        BBBBBBBBBBBBBBBBB00000000000000BBBBBBBBBBBBBBBBB0000000000000000
        BBBBBBBBBBBBBBBB0000000000000000BBBBBBBBBBBBBBBBB00000000000000B
        BBBBBBBBBBBBBBBBBBBBBB0000BBBBBBBBBBBBBBBBBBBBBBBBBBBB0000BBBBBB
        BBBBBBBBBBBBBBBBBBBBBB0000BBBBBBBBBBBBBBBBBBBBBBBBBBBB0000BBBBBB
        BBBBBBBBBBBBBBBBBBBBBB0000BBBBBBBBBBBBBBBBBBBBBBBBBBBB0000BBBBBB
        BBBBBBBBBBBBBBBBBBBBBB0000BBBBBBBBBBBBBBBBBBBBBBBBBBBB0000BBBBBB
        BBBBBBBBBBBBBBBBBBBBBB0000BBBBBBBBBBBBBBBBBBBBBBBBBBBB0000BBBBBB
        BBBBBBBBBBBBBBBBBBBBBB000000000000BBBBBBBBBBBBBBBBBBBB0000000000
        000BBBBBBBBBB00BBBBBBB00000000000000BBBBBBBB0000BBBBBB0000000000
        0000BBBBBBBB0000BBBBBB0000BBBBBB0000BBBBBBBB0000BBBBBB0000BBBBBB
        0000BBBBBBBB0000BBBBBB0000BBBBBB0000BBBBBBBB0000BBBBBB0000BBBBBB
        0000BBBBBBBB0000BBBBBB0000BBBBBB0000BBBBBBBB0000BBBBBB0000BBBBBB
        0000BBBBBBBB000000000000000000000000BBBBBBBB00000000000000000000
        0000BBBBBBBB000000000000000000000000BBBBBBBB00000000000000000000
        0000BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
        BBBBBBBB00000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000}
    end
    object laAppName: TLabel
      Left = 43
      Top = 10
      Width = 86
      Height = 13
      Caption = 'Tag your Photo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object laVersion: TLabel
      Left = 43
      Top = 27
      Width = 62
      Height = 13
      Caption = 'Version 1.0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'tl'
    Filter = 'Schlagwortlisten (*.taglist)|*.taglist|Alle Dateien (*.*)|*.*'
    Left = 96
    Top = 65528
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'tl'
    Filter = 'Schlagwortlisten (*.taglist)|*.taglist|Alle Dateien (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 160
    Top = 65528
  end
  object ActionList1: TActionList
    Left = 32
    Top = 65528
    object acLoadTagList: TAction
      Category = 'TagList'
      Caption = 'Laden'
      OnExecute = acLoadTagListExecute
    end
    object acSaveTagList: TAction
      Category = 'TagList'
      Caption = 'Speichern'
      OnExecute = acSaveTagListExecute
    end
    object acClearTagList: TAction
      Category = 'TagList'
      Caption = 'L'#246'schen'
      OnExecute = acClearTagListExecute
    end
    object acAppendTagList: TAction
      Category = 'TagList'
      Caption = 'Anf'#252'gen'
      OnExecute = acAppendTagListExecute
    end
  end
end
