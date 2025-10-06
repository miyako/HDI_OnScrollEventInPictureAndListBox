//%attributes = {}
C_LONGINT:C283($scrollHeight; $scrollWidth)

$scrollHeight:=LISTBOX Get property:C917(*; "List Box1"; lk hor scrollbar height:K53:7)
$scrollWidth:=LISTBOX Get property:C917(*; "List Box1"; lk ver scrollbar width:K53:9)

OBJECT GET COORDINATES:C663(*; "Variable"; $left; $top; $right; $bottom)
imageHeight:=$bottom-$top-$scrollHeight
imageWidth:=$right-$left-$scrollWidth



OBJECT GET COORDINATES:C663(*; "Picture2"; $left; $top; $right; $bottom)

OBJECT SET COORDINATES:C1248(*; "Rectangle1"; $left+SetPositionH; $top+SetPositionV; $left+SetPositionH+imageWidth; $top+SetPositionV+imageHeight)

