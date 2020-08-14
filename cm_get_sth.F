c ########################################################################################
      integer function cm_get_sth(nameX)
c
      implicit none
c
c     @note
c     When you change something, remember to change the length of the arrays ("dimension") as well as
c     the number of characters (len) if needed.
c
      character(len=16), intent(in) :: nameX
      character(len=16), dimension(7) :: list_name ! needs to contains 16 characters (filled by underscores)
      integer, dimension(7) :: list_index
      integer :: i
c
c 1. Parameter: First Lame parameter lame_lambda
      list_name(1) = 'lame_lambda_____'
      list_index(1) = 1
c 2. Parameter: Second Lame parameter lame_lambda
      list_name(2) = 'shearMod_mu_____'
      list_index(2) = 2
c 3. Parameter: Hardening modulus hardMod_K
      list_name(3) = 'hardMod_K_______'
      list_index(3) = 3
c 4. Parameter: Yield stress yieldStress
      list_name(4) = 'yieldStress_____'
      list_index(4) = 4
c 5. Parameter: Hardening stress hardStress_R_inf
      list_name(5) = 'hardStress_R_inf'
      list_index(5) = 5
c 6. Parameter: Exp. hardening modulues hardMod_K_exp
      list_name(6) = 'hardMod_K_exp___'
      list_index(6) = 6
c 7. Parameter: Hardening type hardening_type
      list_name(7) = 'hardening_type__'
      list_index(7) = 7
c      
      do i=1,maxval(list_index)
          ! Look for the nameX in the list of names to find the index 'i'
          if ( index(nameX,trim(list_name(i))) /= 0 ) then
              cm_get_sth = list_index(i)
              exit
          elseif ( i == maxval(list_index) ) then
              write(*,*) "cm_get_sth<< Could not find the nameX:", nameX
              pause
          endif
      enddo
c
      end function cm_get_sth