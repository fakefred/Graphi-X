VERSION 5.00
Begin VB.Form Graph 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Graphi X (Not Registered)"
   ClientHeight    =   4080
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MousePointer    =   2  'Cross
   ScaleHeight     =   4080
   ScaleWidth      =   4560
   StartUpPosition =   3  '´°¿ÚÈ±Ê¡
   Begin VB.TextBox regcode 
      Height          =   375
      IMEMode         =   3  'DISABLE
      Left            =   3360
      MaxLength       =   4
      MousePointer    =   3  'I-Beam
      PasswordChar    =   "*"
      TabIndex        =   5
      Top             =   3240
      Width           =   1095
   End
   Begin VB.CommandButton reg 
      Caption         =   "Register"
      Enabled         =   0   'False
      Height          =   255
      Left            =   3360
      TabIndex        =   4
      Top             =   3720
      Width           =   1095
   End
   Begin VB.Frame graph_settings 
      Caption         =   "Graph settings"
      Height          =   855
      Left            =   120
      TabIndex        =   0
      Top             =   3120
      Width           =   3135
      Begin VB.TextBox add 
         Height          =   375
         Left            =   1680
         MousePointer    =   3  'I-Beam
         TabIndex        =   6
         Text            =   "0"
         Top             =   240
         Width           =   495
      End
      Begin VB.CommandButton showgraph 
         Caption         =   "Show"
         Enabled         =   0   'False
         Height          =   375
         Left            =   2400
         TabIndex        =   3
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox grd 
         Height          =   375
         Left            =   480
         MousePointer    =   3  'I-Beam
         TabIndex        =   2
         Text            =   "1"
         Top             =   240
         Width           =   495
      End
      Begin VB.Label setlabel 
         Caption         =   "y =        x +"
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Top             =   360
         Width           =   2175
      End
   End
   Begin VB.Line Line2 
      X1              =   2280
      X2              =   2280
      Y1              =   0
      Y2              =   3000
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   4560
      Y1              =   1560
      Y2              =   1560
   End
End
Attribute VB_Name = "Graph"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Open "graphix-reg.dll" For Input As #2
Input #2, regstatus
Close #2
If regstatus = "!$!%(@^%#%*(&(#@#*$^@^$##*#@&(%)@**$!(&!^(#((#&%!)" Then
Graph.Enabled = True
Graph.Caption = "Graphi X Pro"
showgraph.Enabled = True
reg.Enabled = False
regcode.Text = ""
End If
End Sub

Private Sub reg_Click()
If regcode.Text = "3620" Then
Open "graphix-reg.dll" For Output As #1
Print #1, "!$!%(@^%#%*(&(#@#*$^@^$##*#@&(%)@**$!(&!^(#((#&%!)"
Close #1
Graph.Enabled = True
Graph.Caption = "Graphi X Pro"
showgraph.Enabled = True
reg.Enabled = False
regcode.Text = ""
Else
MsgBox "The code you entered does not match your version!"
End If
End Sub

Private Sub regcode_Change()
If Val(regcode.Text) > 1000 Then reg.Enabled = True Else reg.Enabled = False
End Sub

Private Sub showgraph_Click()
Dim g, a
g = Val(grd.Text) 'which stands for gradient
a = Val(add.Text)
For vx = -10000 To 10000
PSet (vx + 2280, 3000 - g * vx - 1440 - a), vbBlue
Next vx
End Sub
