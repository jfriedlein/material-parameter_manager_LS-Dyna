c ########################################################################################
      real*8 function cm_get(nameX, cm)
c
      !implicit none
c
      character(len=16), intent(in) :: nameX
      real*8, dimension (*) :: cm
      integer :: index_val
c
      write(*,*) "cm_get<< deprecated"
      stop
      !index_val = cm_get_sth(nameX)
c
      cm_get = cm(index_val)
c
      end function cm_get

c ########################################################################################

      real*8 function cm_get_pair(nameX, cm_all)
c
      !implicit none
c
      character(len=16), intent(in) :: nameX
      real*8, dimension (2,*), intent(in) :: cm_all
      integer, dimension(2) :: index_val
c
      index_val(:) = cm_get_sth(nameX)
c
      cm_get_pair = cm_all(index_val(1),index_val(2))
c
      end function cm_get_pair
