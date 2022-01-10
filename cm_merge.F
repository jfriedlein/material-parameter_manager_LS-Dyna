
      subroutine cm_merge ( cm, cma, cm_all )
c
       implicit none
c
       real*8, dimension(*), intent(in) :: cm, cma
       real*8, dimension(2,48), intent(out) :: cm_all
c
       cm_all(1,1:48) = cm(1:48)
       cm_all(2,1:48) = cma(1:48)
c
      end subroutine
