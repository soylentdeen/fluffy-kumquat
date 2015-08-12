      subroutine barney

cf2py intent(callback, hide) fred 

cf2py intent(callback, hide) bambam

      external fred
      external bambam

      
      write (*,*) "barney"

      call test

      end
