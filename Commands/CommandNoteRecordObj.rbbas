#tag ClassProtected Class CommandNoteRecordObjInherits CommandRecordObjImplements CommandRecordInterface	#tag Method, Flags = &h0		Sub ApplyState()		  //This code is taken from the Constructor event		  		  Note.Chord = me.Chord //OBJECT		  'Note.DeselectObj = me.DeselectObj //Method		  Note.Group = me.Group //OBJECT		  Note.Hidden = me.Hidden		  Note.ID = me.ID //For File saving and opening only		  Note.Label = me.Label		  Note.Length = me.Length		  Note.Locked = me.Locked		  Note.Name = me.Name		  Note.NextNote = me.NextNote //OBJECT		  Note.OldLength = me.OldLength //managed in Mouse actions		  Note.OldPitch = me.OldPitch //managed in Mouse actions		  Note.OldStartBeat = me.OldStartBeat //managed in Mouse actions		  Note.Pitch = me.Pitch		  Note.PreviousNote = me.PreviousNote //OBJECT		  'Note.Selected = me.Selected		  'Note.SelectObj = me.SelectObj //Method		  Note.StartBeat = me.StartBeat		  Note.Track = me.Track //OBJECT		  Note.Velocity = me.Velocity		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub Constructor(mObject as MusicObj)		  // Part of the CommandRecordInterface interface.		  		  // Calling the overridden superclass constructor.		  Super.Constructor		  		  Note = NoteObj(mObject)		  RecordedObject = mObject		  		  //the following is copied from ParentWindow.NoteMgr.CloneObj(MusicObj) as MusicObj		  		  me.Chord = Note.Chord //OBJECT		  'me.DeselectObj = Note.DeselectObj //Method		  me.Group = Note.Group //OBJECT		  me.Hidden = Note.Hidden		  me.ID = Note.ID //For File saving and opening only		  me.Label = Note.Label		  me.Length = Note.Length		  me.Locked = Note.Locked		  me.Name = Note.Name		  me.NextNote = Note.NextNote //OBJECT		  me.OldLength = Note.OldLength //managed in Mouse actions		  me.OldPitch = Note.OldPitch //managed in Mouse actions		  me.OldStartBeat = Note.OldStartBeat //managed in Mouse actions		  me.Pitch = Note.Pitch		  me.PreviousNote = Note.PreviousNote //OBJECT		  'me.Selected = Note.Selected //managed in the command		  'me.SelectObj = Note.SelectObj //Method		  me.StartBeat = Note.StartBeat		  me.Track = Note.Track //OBJECT		  me.Velocity = Note.Velocity		  		  		End Sub	#tag EndMethod	#tag Property, Flags = &h1		Protected Chord As ChordObj	#tag EndProperty	#tag Property, Flags = &h1		Protected NextNote As NoteObj	#tag EndProperty	#tag Property, Flags = &h0		Note As NoteObj	#tag EndProperty	#tag Property, Flags = &h1		Protected OldPitch As Integer	#tag EndProperty	#tag Property, Flags = &h1		Protected Pitch As Integer	#tag EndProperty	#tag Property, Flags = &h1		Protected PreviousNote As NoteObj	#tag EndProperty	#tag ViewBehavior		#tag ViewProperty			Name="Description"			Group="Behavior"			Type="String"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Hidden"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="ID"			Group="Behavior"			InitialValue="0"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Label"			Group="Behavior"			Type="String"			EditorType="MultiLineEditor"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Length"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Locked"			Group="Behavior"			InitialValue="0"			Type="Boolean"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="OldLength"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="OldPitch"			Group="Behavior"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="OldStartBeat"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Pitch"			Group="Behavior"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Selected"			Group="Behavior"			InitialValue="0"			Type="Boolean"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="StartBeat"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Velocity"			Group="Behavior"			InitialValue="60"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass