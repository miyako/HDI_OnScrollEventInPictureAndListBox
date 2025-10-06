
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		
		//List Box page
		C_TEXT:C284($nameCol)
		C_TEXT:C284($nameHeader)
		_O_C_INTEGER:C282($nbCol)
		_O_C_INTEGER:C282($nbElem)
		_O_C_INTEGER:C282($last)
		C_POINTER:C301(ColPtr)
		C_POINTER:C301(headprt)
		SetListBoxPosH:=1
		SetListBoxPosV:=1
		$nbCol:=20
		$nbElem:=200
		
		For ($i; 1; $nbCol)
			$nameCol:="Column"+String:C10($i)
			$nameHeader:="Header"+String:C10($i)
			$last:=LISTBOX Get number of columns:C831(*; "List Box")+1
			
			//Add Column
			C_POINTER:C301($NilPtr)
			LISTBOX INSERT COLUMN:C829(*; "List Box"; $last; $nameCol; $NilPtr; $nameHeader; $NilPtr)
			ColPtr:=OBJECT Get pointer:C1124(Object named:K67:5; $nameCol)
			ARRAY TEXT:C222(ColPtr->; $nbElem)
			
			//Definition of header
			headprt:=OBJECT Get pointer:C1124(Object named:K67:5; $nameHeader)
			OBJECT SET TITLE:C194(headprt->; $nameHeader)
			
			//FillColumn
			For ($j; 1; $nbElem)
				If ($i=1)
					ColPtr->{$j}:=String:C10($j)
				Else 
					ColPtr->{$j}:=String:C10(Random:C100%10)
				End if 
			End for 
			
		End for 
		
		//Picture page
		
		//Size
		
		SetPositionH:=0
		SetPositionV:=0
		
		$path:=Get 4D folder:C485(Current resources folder:K5:16)+"Picture.png"
		READ PICTURE FILE:C678($path; vPicture)
		
End case 

