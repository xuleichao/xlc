VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Sheet1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True


Public Sub �滻����()
Dim i As Integer
Dim j As Integer
i = 2691
'j = 1
Do While Range("A" & i).Value = ""
    Range("A" & i).Value = Range("B" & i).Value
    i = i + 6
   ' j = j + 1
Loop
End Sub

Public Sub ȥ������()
Dim i As Integer
i = 2691
Do While Range("A" & i).Value = "����"
    Range("A" & i).EntireRow.Delete
    i = i + 1
Loop
End Sub

Public Sub ��������()
Dim i As Integer
Dim j As Integer


For i = 1 To 2239
    For j = 1 To 6
        Cells(1 + i, j).Value = Cells(6 * i + j, 1).Value
    Next
Next
End Sub

Public Sub �ж���()

End Sub