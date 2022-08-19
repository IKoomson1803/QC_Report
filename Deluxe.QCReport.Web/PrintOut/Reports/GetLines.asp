<%
Dim sDesc, nWidth, nHeight, constCellHeight
Dim nTemp, nLength, chrTemp

Function GetLines(sDesc)
nHeight = 10
constCellHeight = 3

if isnull(sDesc) then 
  'skip record  	
else
	nWidth = 0
	For nLength = 1 to Len(sDesc)

		if nWidth > 400 then 
			nHeight = nHeight + 10
			nWidth = 0
		end if

	chrTemp = mid(sDesc,nLength,1)

	Select Case chrTemp
		case "A"
			nTemp = 5
		case "a"
			nTemp = 5
		case "B"
			nTemp = 4
		case "b"
			nTemp = 4
		case "C"
			nTemp = 6
		case "c"
			nTemp = 5
		case "D"
			nTemp = 4
		case "d"
			nTemp = 4
		case "E"
			nTemp = 3
		case "e"
			nTemp = 4
		case "F"
			nTemp = 2
		case "f"
			nTemp = 3
		case "G"
			nTemp = 6
		case "g"
			nTemp = 5
		case "H"
			nTemp = 4
		case "h"
			nTemp = 3
		case "I"
			nTemp = 4
		case "i"
			nTemp = 2
		case "J"
			nTemp = 3
		case "j"
			nTemp = 3
		case "K"
			nTemp = 5
		case "k"
			nTemp = 2
		case "L"
			nTemp = 4
		case "l"
			nTemp = 2
		case "M"
			nTemp = 6
		case "m"
			nTemp = 6
		case "N"
			nTemp = 4
		case "n"
			nTemp = 3
		case "O"
			nTemp = 6
		case "o"
			nTemp = 4
		case "P"
			nTemp = 4
		case "p"
			nTemp = 4
		case "Q"
			nTemp = 6
		case "q"
			nTemp = 5
		case "R"
			nTemp = 3
		case "r"
			nTemp = 3
		case "S"
			nTemp = 6
		case "s"
			nTemp = 4
		case "T"
			nTemp = 6
		case "t"
			nTemp = 3
		case "U"
			nTemp = 5
		case "u"
			nTemp = 4
		case "V"
			nTemp = 5
		case "v"
			nTemp = 4
		case "W"
			nTemp = 7
		case "w"
			nTemp = 7
		case "X"
			nTemp = 5
		case "x"
			nTemp = 4
		case "Y"
			nTemp = 5
		case "y"
			nTemp = 4
		case "Z"
			nTemp = 6
		case "z"
			nTemp = 4
		case "1"
			nTemp = 4
		case "2"
			nTemp = 4
		case "3"
			nTemp = 4
		case "4"
			nTemp = 4
		case "5"
			nTemp = 4
		case "6"
			nTemp = 5
		case "7"
			nTemp = 4
		case "8"
			nTemp = 2
		case "9"
			nTemp = 4
		case "0"
			nTemp = 5
		case "?"
			nTemp = 4
		case "!"
			nTemp = 3
		case "&"
			nTemp = 6
		case " "
			nTemp = 3
		case "."
			nTemp = 2 
		case ","
			nTemp = 3
		case "*"
			nTemp = 2
		case "/"
			nTemp = 3
	End Select
	'Response.write (chrTemp & " " & ntemp & "  ")
	
	nWidth = nWidth + nTemp
	next
	
	'Response.Write nwidth
end if
getLines = nHeight + constCellHeight
end function
%>