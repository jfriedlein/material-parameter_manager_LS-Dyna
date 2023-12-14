       function char2int (str) RESULT(ASCII)
        implicit none
        character(len=16), intent(in) :: str
        integer i
        integer, dimension(16) :: ASCII
        forall(i=1:16) ASCII(i) = IACHAR(str(i:i))
        return
        end function char2int

       function int2char (ASCII) RESULT(str)
        implicit none
        integer, dimension(16), intent(in) :: ASCII
        character(len=16) :: str
        integer i
        forall(i=1:16) str(i:i) = ACHAR(ASCII(i))
        return
        end function int2char
