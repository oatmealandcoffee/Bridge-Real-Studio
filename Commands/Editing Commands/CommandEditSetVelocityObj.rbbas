#tag ClassProtected Class CommandEditSetVelocityObjInherits CommandMusicObjectStateObjImplements Command	#tag Method, Flags = &h0		Sub Constructor()		  // Calling the overridden superclass constructor.		  // Note that this may need modifications if there are multiple constructor choices.		  // Possible constructor calls:		  // Constructor(mParentWindow as WindowEditor) -- From CommandMusicObjectStateObj		  // Constructor() -- From CommandObj		  Super.Constructor		  		End Sub	#tag EndMethod	#tag Method, Flags = &h0		Function Name() As String		  // Part of the Command interface.		  		  #if DebugBuild		    return "CommandEditSetVelocityObj"		  #else		    return "Change Velocity"		  #endif		  		  		  		End Function	#tag EndMethod	#tag ViewBehavior		#tag ViewProperty			Name="Description"			Group="Behavior"			Type="String"			InheritedFrom="CommandObj"		#tag EndViewProperty		#tag ViewProperty			Name="Index"			Visible=true			Group="ID"			InitialValue="2147483648"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Label"			Group="Behavior"			Type="String"			InheritedFrom="CommandObj"		#tag EndViewProperty		#tag ViewProperty			Name="Left"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="MusicObjCount"			Group="Behavior"			InitialValue="0"			Type="Integer"			InheritedFrom="CommandObj"		#tag EndViewProperty		#tag ViewProperty			Name="Name"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Super"			Visible=true			Group="ID"			InheritedFrom="Object"		#tag EndViewProperty		#tag ViewProperty			Name="Top"			Visible=true			Group="Position"			InitialValue="0"			InheritedFrom="Object"		#tag EndViewProperty	#tag EndViewBehaviorEnd Class#tag EndClass