#tag WindowBegin Window WindowSaveConfirmation   BackColor       =   16777215   Backdrop        =   ""   CloseButton     =   False   Composite       =   False   Frame           =   8   FullScreen      =   False   HasBackColor    =   False   Height          =   122   ImplicitInstance=   True   LiveResize      =   False   MacProcID       =   0   MaxHeight       =   122   MaximizeButton  =   False   MaxWidth        =   474   MenuBar         =   1179086674   MenuBarVisible  =   True   MinHeight       =   122   MinimizeButton  =   False   MinWidth        =   474   Placement       =   0   Resizeable      =   False   Title           =   "Save Confirmation"   Visible         =   True   Width           =   474   Begin PushButton SaveButton      AutoDeactivate  =   True      Bold            =   ""      Cancel          =   ""      Caption         =   "Save"      Default         =   True      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   383      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   True      LockRight       =   ""      LockTop         =   True      Scope           =   0      TabIndex        =   0      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   0      Top             =   82      Underline       =   ""      Visible         =   True      Width           =   71   End   Begin PushButton CancelButton      AutoDeactivate  =   True      Bold            =   ""      Cancel          =   ""      Caption         =   "Cancel"      Default         =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   300      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   True      LockRight       =   ""      LockTop         =   True      Scope           =   0      TabIndex        =   1      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   0      Top             =   82      Underline       =   ""      Visible         =   True      Width           =   71   End   Begin PushButton DoNotSaveButton      AutoDeactivate  =   True      Bold            =   ""      Cancel          =   ""      Caption         =   "Don't Save"      Default         =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   113      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   True      LockRight       =   ""      LockTop         =   True      Scope           =   0      TabIndex        =   2      TabPanelIndex   =   0      TabStop         =   True      TextFont        =   "System"      TextSize        =   0      Top             =   82      Underline       =   ""      Visible         =   True      Width           =   95   End   Begin Label Message_ST      AutoDeactivate  =   True      Bold            =   True      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   40      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   107      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   True      LockRight       =   ""      LockTop         =   True      Multiline       =   True      Scope           =   0      TabIndex        =   3      TabPanelIndex   =   0      TabStop         =   True      Text            =   "Do you want to save the changes you made in the document Untitled 1?"      TextAlign       =   0      TextColor       =   0      TextFont        =   "System"      TextSize        =   0      Top             =   14      Underline       =   ""      Visible         =   True      Width           =   341   End   Begin Label StaticText1      AutoDeactivate  =   True      Bold            =   ""      DataField       =   ""      DataSource      =   ""      Enabled         =   True      Height          =   20      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Italic          =   ""      Left            =   107      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   True      LockRight       =   ""      LockTop         =   True      Multiline       =   ""      Scope           =   0      TabIndex        =   4      TabPanelIndex   =   0      TabStop         =   True      Text            =   "Your changes will be lost of you don't save them."      TextAlign       =   0      TextColor       =   0      TextFont        =   "System"      TextSize        =   11      Top             =   51      Underline       =   ""      Visible         =   True      Width           =   341   End   Begin Canvas Canvas1      AcceptFocus     =   ""      AcceptTabs      =   ""      AutoDeactivate  =   True      Backdrop        =   ""      Enabled         =   True      EraseBackground =   True      Height          =   40      HelpTag         =   ""      Index           =   -2147483648      InitialParent   =   ""      Left            =   40      LockBottom      =   ""      LockedInPosition=   False      LockLeft        =   True      LockRight       =   ""      LockTop         =   True      Scope           =   0      TabIndex        =   5      TabPanelIndex   =   0      TabStop         =   True      Top             =   40      UseFocusRing    =   True      Visible         =   True      Width           =   40   EndEnd#tag EndWindow#tag WindowCode	#tag Event		Function KeyDown(Key As String) As Boolean		  If Keyboard.AsyncOSKey Then		    select case Key		    case "S"		      Save		    case "D"		      DoNotSave		    case "."		      Cancel		    end select		  End If		  		  Return True		End Function	#tag EndEvent	#tag Method, Flags = &h21		Private Sub Cancel()		  self.Close		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub DoNotSave()		  self.Close		  WindowMgr.EditorCloseConfirmed(WindowMgr.CurrentEditor)		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub Save()		  self.Close		  WindowMgr.CurrentEditor.FileMgr.Save		  WindowMgr.EditorCloseConfirmed(WindowMgr.CurrentEditor)		  		End Sub	#tag EndMethod#tag EndWindowCode#tag Events SaveButton	#tag Event		Sub Action()		  Save		End Sub	#tag EndEvent#tag EndEvents#tag Events CancelButton	#tag Event		Sub Action()		  Cancel		End Sub	#tag EndEvent#tag EndEvents#tag Events DoNotSaveButton	#tag Event		Sub Action()		  DoNotSave		End Sub	#tag EndEvent#tag EndEvents#tag Events Canvas1	#tag Event		Sub Paint(g As Graphics)		  //i don't like this icon one bit. Maybe there is a declare I can use.		  		  //the reason why we're doing it this way is because the MessageDialog class doesn't allow for shortcut keys for the buttons.		  //need to put in a feature requst for that.		  		  g.DrawCautionIcon(0, 0)		End Sub	#tag EndEvent#tag EndEvents