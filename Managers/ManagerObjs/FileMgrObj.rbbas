#tag ClassProtected Class FileMgrObjInherits ManagerObj	#tag Method, Flags = &h0		Sub ExportToMIDI()		  dim MIDIExport as MIDIExport_GarageBand_Obj = new MIDIExport_GarageBand_Obj		  		  MIDIExport.ParentWindow = me.ParentWindow		  MIDIExport.ExportToMIDI		End Sub	#tag EndMethod	#tag Method, Flags = &h1		Protected Sub ImportMIDI()		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub Open()		  dim NativeImport as NativeImportObj = New NativeImportObj		  		  if NativeImport <> nil then		    		    NativeImport.ParentWindow = me.ParentWindow		    NativeImport.TheFile = NativeFile		    NativeImport.Open		    		    me.ParentWindow.WindowNeedsSaving = false		    		  end if		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub RevertToSaved()		  if NativeFile = nil then return		  		  'Do you want to revert to the most recently saved version of the document [insert file name}		  'Your current changes will be lost.		  'Cancel    Revert(default)		  		  dim NativeImport as NativeImportObj = new NativeImportObj		  		  NativeImport.ParentWindow = me.ParentWindow		  NativeImport.TheFile = NativeFile		  NativeImport.Open		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub Save()		  if ParentWindow.WindowNeedsSaving then		    dim NativeExport as NativeExportObj = new NativeExportObj		    		    if NativeFile = nil then		      NativeFile = FileLib.ModalSaveAsDialog(ParentWindow, FileTypes1.TextXml, ParentWindow.Name + "." + FileLib.kFileExtension_Native) //file type, name; need to make as modal		    end if		    		    NativeExport.ParentWindow = me.ParentWindow		    NativeExport.File = NativeFile		    NativeExport.Save		    		    ParentWindow.WindowNeedsSaving = false		  end if		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub SaveAll()		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub SaveAs()		  dim NativeExport as NativeExportObj = new NativeExportObj		  		  NativeFile = nil		  		  NativeFile = FileLib.ModalSaveAsDialog(ParentWindow, FileTypes1.TextXml, ParentWindow.Name + "." + FileLib.kFileExtension_Native)		  		  if NativeFile <> nil then		    NativeExport.ParentWindow = me.ParentWindow		    NativeExport.File = NativeFile		    NativeExport.Save		    		    ParentWindow.WindowNeedsSaving = false		  end if		End Sub	#tag EndMethod	#tag Property, Flags = &h0		Editor_ScrollX As Integer	#tag EndProperty	#tag Property, Flags = &h0		Editor_ScrollY As Integer	#tag EndProperty	#tag Property, Flags = &h0		Editor_SnapToValue As Integer	#tag EndProperty	#tag Property, Flags = &h0		Editor_ZoomX As Integer	#tag EndProperty	#tag Property, Flags = &h0		Editor_ZoomY As Integer	#tag EndProperty	#tag Property, Flags = &h0		MIDIFile As FolderItem	#tag EndProperty	#tag Property, Flags = &h0		NativeFile As FolderItem	#tag EndProperty	#tag ViewBehavior		#tag ViewProperty			Name="Editor_ScrollX"			Group="Behavior"			InitialValue="0"			Type="Integer"		#tag EndViewProperty		#tag ViewProperty			Name="Editor_ScrollY"			Group="Behavior"			InitialValue="0"			Type="Integer"		#tag EndViewProperty		#tag ViewProperty			Name="Editor_SnapToValue"			Group="Behavior"			InitialValue="0"			Type="Integer"		#tag EndViewProperty		#tag ViewProperty			Name="Editor_ZoomX"			Group="Behavior"			InitialValue="0"			Type="Integer"		#tag EndViewProperty		#tag ViewProperty			Name="Editor_ZoomY"			Group="Behavior"			InitialValue="0"			Type="Integer"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass