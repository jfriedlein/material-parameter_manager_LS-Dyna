      function cm_get_sth_Vx(nameX, cm_version) RESULT(index_pair)
c
      implicit none
c
      !
      character(len=16), intent(in) :: nameX
      integer, intent(in) :: cm_version
      integer, dimension(2) :: index_pair
      ! list of material parameters names, e.g. "bulkMod_kappa___" for the bulk modulus
      ! @note needs to contains 16 characters (filled by underscores)
      character(len=16), dimension(:,:), allocatable :: list_name
      integer :: i, j, n_entries_per_row, n_rows
c
      select case( cm_version )
         case( 0 ) 
            index_pair = cm_get_sth(nameX)
         case( 1 )
            index_pair = cm_get_sth_V01(nameX)
      !    case( 2 )
      !       index_pair = cm_get_sth_V02(nameX)
      !    case( 3 )
      !       index_pair = cm_get_sth_V03(nameX)                  
         case default
            write( *, * ) "cm_get_sth<< 
     &Undefined cm_version (",cm_version,")"
            call cstop("E r r o r   T e r m i n a t i o n")
      end select 
c
c @todo Centralise the "do i=1,n_entries" and everything that is equal for all versions     
c @todo Can we implement this object-oriented and reuse for instance alpha for all hsv-variants?
c
      end function cm_get_sth_Vx