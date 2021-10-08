c ########################################################################################
      double precision function cm_get(nameX, cm)
c
      !implicit none
c
      character(len=16), intent(in) :: nameX
      real, dimension (*) :: cm
      integer :: index
c
      index = cm_get_sth(nameX)
c
      cm_get = cm(index)
c
      end function cm_get
