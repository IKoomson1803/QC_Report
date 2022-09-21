 <% If Not rsChecklistBanijayRights.BOF = True And Not rsChecklistBanijayRights.EOF = True Then %>
      <% If Not IsNull(rsChecklistBanijayRights.Fields("ChecklistCompleted"))  And rsChecklistBanijayRights.Fields("ChecklistCompleted") = true Then %> 
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
 <%

      End If 	 
   End If 
	  
   If Not rsChecklistBanijayRights Is Nothing Then
     rsChecklistBanijayRights.Close
	 set rsChecklistBanijayRights = Nothing
	End If 
  %>	  