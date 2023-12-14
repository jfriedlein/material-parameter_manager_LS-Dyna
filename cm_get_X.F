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
      return
      end function cm_get
c
c ########################################################################################
c
      real*8 function cm_get_pair(nameX, cm_all)
      ! @note We always return a real*8 value, because "cm" is of this type.
      !       To ensure that the value is an integer, transform the result manually.
c
      !implicit none
c
      character(len=16), intent(in) :: nameX
      real*8, dimension (2,*), intent(in) :: cm_all
      integer, dimension(2) :: index_val
      integer :: cm_version
c
      cm_version = int( cm_all( 1,2 ) )
c
      if ( cm_version>0 .and. cm_version<=10 ) then
         call cmManager_name2iX (char2int(nameX),cm_version,index_val)
      ! @todo This is dangerous, because cm_all(1,2) previously was the shearMod
      !       In case shearMod is e.g. 5.5 then this would be cm_version=5, but should be the old cm_get_sth
      else
         index_val(:) = cm_get_sth(nameX)
      endif
c      
      cm_get_pair = cm_all( index_val(1) , index_val(2) )
c
      return
      end function cm_get_pair
c
c ########################################################################################
c
      !@todo-check Is this function used somewhere?
      subroutine cm_get_pair_SR (nameX, cm_all, cm_val)
c
      !implicit none
c
      character(len=16), intent(in) :: nameX
      real*8, dimension (2,*), intent(in) :: cm_all
      real*8 cm_val
      integer, dimension(2) :: index_val
c
      index_val(:) = cm_get_sth(nameX)
c
      cm_val = cm_all(index_val(1),index_val(2))
c
      end subroutine cm_get_pair_SR
