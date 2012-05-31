#tag ClassProtected Class GroupObjInherits MusicObjImplements NoteListInterface	#tag Method, Flags = &h0		Sub Constructor()		  // Calling the overridden superclass constructor.		  Super.Constructor		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub DeselectObj()		  #if kLogMethods		    Log("GroupObj.DeselectObj")		  #endif		  		  if Selected = false then return		  Selected = false		  		  dim thisObject as integer = 0		  dim firstObject as integer = 0		  dim lastObject as integer = Ubound(Objects)		  		  for thisObject = firstObject to lastObject		    if Objects(thisObject) <> nil then		      		      dim theMusicObj as MusicObj = Objects(thisObject)		      		      if Objects(thisObject) IsA GroupObj then		        dim group as GroupObj = Objects(thisObject)		        group.DeSelectObj		      end if		      		      if Objects(thisObject) IsA ChordObj then		        dim chord as ChordObj = Objects(thisObject)		        chord.DeSelectObj		      end if		      		      if Objects(thisObject) IsA NoteObj then		        dim note as NoteObj = Objects(thisObject)		        note.DeselectObj		      end if		      		    end if		  next		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function GetBounds(GroupOutline as GroupOutlineObj) As GroupOutlineObj		  dim GroupOutlineReturn as GroupOutlineObj = GroupOutline		  		  dim thisObject as integer = 0		  dim firstObject as integer = 0		  dim lastObject as integer = Ubound(Objects)		  		  for thisObject = firstObject to lastObject		    if Objects(thisObject) <> nil then		      		      dim theMusicObj as MusicObj = Objects(thisObject)		      		      if Objects(thisObject) IsA GroupObj then		        dim group as GroupObj = Objects(thisObject)		        GroupOutlineReturn = group.GetBounds(GroupOutlineReturn)		      end if		      		      if Objects(thisObject) IsA ChordObj then		        dim chord as ChordObj = Objects(thisObject)		        dim thisNote as integer = 0		        dim firstNote as integer = 0		        dim lastNote as integer = Ubound(chord.Notes)		        for thisNote = firstNote to lastNote		          dim note as noteObj = chord.Notes(thisNote)		          GroupOutlineReturn = SetBounds(GroupOutlineReturn, Note)		        next		      end if		      		      if Objects(thisObject) IsA NoteObj then		        dim note as NoteObj = Objects(thisObject)		        GroupOutlineReturn = SetBounds(GroupOutlineReturn, Note)		      end if		      		    end if		  next		  		  return GroupOutlineReturn		End Function	#tag EndMethod	#tag Method, Flags = &h0		Function IsGroupWithinBounds(Beat1 as integer, Pitch1 as integer, Beat2 as integer, Pitch2 as integer) As Boolean		  dim o, c as integer		  dim objectCount as integer		  dim WithinBounds as boolean		  dim note as noteObj		  dim chord as chordOBj		  dim group as groupObj		  		  objectCount = Ubound(Objects)		  for o = objectCount DownTo 0		    if Objects(o) <> nil then		      if Objects(o) IsA NoteObj then		        note = Objects(o)		        WithinBounds = note.IsNoteWithinDragBounds(Beat1, Pitch1, Beat2, Pitch2)		        if WithinBounds = true then		          WindowMgr.CurrentEditor.NoteMgr.AddSelectionFromNote(Note)		        else		          WindowMgr.CurrentEditor.NoteMgr.RemoveSelection(Note)		        end if		      end if		    end if		    		    if Objects(o) IsA ChordObj then		      chord = Objects(o)		      dim chordNoteCount as integer = Ubound(chord.Notes)		      for c = chordNoteCount DownTo 0		        if Chord.Notes(c) <> nil then		          note = Chord.Notes(c)		          WithinBounds = note.IsNoteWithinDragBounds(Beat1, Pitch1, Beat2, Pitch2)		          if WithinBounds = true then		            WindowMgr.CurrentEditor.NoteMgr.AddSelectionFromNote(Note)		            exit		          else		            WindowMgr.CurrentEditor.NoteMgr.RemoveSelection(Note)		          end if		        end if		      next		    end if		    		    //this is where it gets tricky because the GroupObj can be nested.		    'if Objects(o) IsA GroupObj then		    'group = Objects(o)		    'group.IsGroupWithinBounds(Beat1, Pitch1, Beat2, Pitch2)		    'end if		  next		End Function	#tag EndMethod	#tag Method, Flags = &h21		Private Sub Log(theText as string)		  WindowLog.Log(theText)		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Sub ResetNoteList()		  // Part of the NoteListInterface interface.		  		  redim NoteList(-1)		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub SelectObj()		  if Selected = true then return		  Selected = true		  		  dim thisObject as integer = 0		  dim firstObject as integer = 0		  dim lastObject as integer = Ubound(Objects)		  		  for thisObject = firstObject to lastObject		    if Objects(thisObject) <> nil then		      		      if Objects(thisObject) IsA GroupObj then		        dim group as GroupObj = Objects(thisObject)		        group.SelectObj		      end if		      		      if Objects(thisObject) IsA ChordObj then		        dim chord as ChordObj = Objects(thisObject)		        chord.SelectObj		      end if		      		      if Objects(thisObject) IsA NoteObj then		        dim note as NoteObj = Objects(thisObject)		        note.SelectObj		      end if		      		    end if		  next		  		  		End Sub	#tag EndMethod	#tag Method, Flags = &h21		Private Function SetBounds(GroupOutline as GroupOutlineObj, Note as NoteObj) As GroupOutlineObj		  dim GroupOutlineReturn as GroupOutlineObj = GroupOutline		  		  if GroupOutlineReturn.outlineX1 = -1 then GroupOutlineReturn.outlineX1 = note.StartBeat		  if GroupOutlineReturn.outlineY1 = -1 then GroupOutlineReturn.outlineY1 = note.Pitch		  if GroupOutlineReturn.outlineX2 = -1 then GroupOutlineReturn.outlineX2 = note.StartBeat		  if GroupOutlineReturn.outlineY2 = -1 then GroupOutlineReturn.outlineY2 = note.Pitch		  		  GroupOutlineReturn.outlineX1 = min(GroupOutlineReturn.outlineX1, note.StartBeat)		  GroupOutlineReturn.outlineY1 = max(GroupOutlineReturn.outlineY1, note.Pitch)		  GroupOutlineReturn.outlineX2 = max(GroupOutlineReturn.outlineX2, note.StartBeat + note.Length)		  GroupOutlineReturn.outlineY2 = min(GroupOutlineReturn.outlineY2, note.Pitch)		  		  return GroupOutlineReturn		End Function	#tag EndMethod	#tag Method, Flags = &h0		Sub SetNoteList()		  // Part of the NoteListInterface interface.		  // called from EditMgrObj.MakeGroup		  		  ResetNoteList		  		  dim thisObject as integer = 0		  dim firstObject as integer = 0		  dim lastObject as integer = Ubound(Objects)		  		  for thisObject = firstObject to lastObject		    if Objects(thisObject) <> nil then		      		      if Objects(thisObject) IsA GroupObj then		        dim group as GroupObj = Objects(thisObject)		        		        dim thisGroupNote as integer = 0		        dim firstGroupNote as integer = 0		        dim lastGroupNote as integer = Ubound(group.NoteList)		        		        for thisGroupNote = firstGroupNote to lastGroupNote		          if group.NoteList(thisGroupNote) <> nil then		            dim theGroupNote as NoteObj = group.NoteList(thisGroupNote)		            NoteList.Append theGroupNote		          end if		        next		        		      end if		      		      if Objects(thisObject) IsA ChordObj then		        dim chord as ChordObj = Objects(thisObject)		        		        dim thisChordNote as integer = 0		        dim firstChordNote as integer = 0		        dim lastChordNote as integer = Ubound(Chord.NoteList)		        		        for thisChordNote = firstChordNote to lastChordNote		          if Chord.NoteList(thisChordNote) <> nil then		            dim theChordNote as NoteObj = Chord.NoteList(thisChordNote)		            NoteList.Append theChordNote		          end if		        next		        		      end if		      		      if Objects(thisObject) IsA NoteObj then		        dim note as NoteObj = Objects(thisObject)		        		        dim thisNoteNote as integer = 0		        dim firstNoteNote as integer = 0		        dim lastNoteNote as integer = Ubound(Note.NoteList)		        		        for thisNoteNote = firstNoteNote to lastNoteNote		          if Note.NoteList(thisNoteNote) <> nil then		            dim theNoteNote as NoteObj = Note.NoteList(thisNoteNote)		            NoteList.Append theNoteNote		          end if		        next		        		      end if		      		    end if		  next		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Sub UnGroupObj()		  // Part of the GroupInterfaceObj interface.		End Sub	#tag EndMethod	#tag Note, Name = Brainstorm		[ ] Groups are really only there to make sure that everything that needs to be selected will be with one click. That's it.				The Group and UnGroup commands are fairly straightforward.				SelectObjects needs to go up the group hierarchy, get the topmost group, and add all linked objects to the selection array in the hierarchy.		To do this, NoteMgrObj.AddSelectionFromNote needs to check if the object's Group variable is nil. if it isn't, it will call SelectObjects for that group.		SelectObjects needs to get the topmost group, and work down from there.				DeselectObjects needs to do the same thing: get the topmost parent and work down from there.				Because we want to show groups in the editor, we need to get the topmost group, calculate the outermost bounds for all objects, and then draw the outline.	#tag EndNote	#tag Property, Flags = &h0		Objects(-1) As Variant	#tag EndProperty	#tag ViewBehavior		#tag ViewProperty			Name="Description"			Group="Behavior"			Type="String"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Hidden"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="ID"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="-2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Label"			Group="Behavior"			Type="String"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Length"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Locked"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="OldLength"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="OldPitch"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="OldStartBeat"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Pitch"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Selected"			Group="Behavior"			InitialValue="0"			Type="Boolean"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="StartBeat"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Velocity"			Group="Behavior"			InitialValue="60"			Type="Integer"			InheritedFrom="MusicObj"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass