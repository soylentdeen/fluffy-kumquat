      subroutine test

cf2py intent(callback, hide) fred 

cf2py intent(callback, hide) bambam
      
      external fred
      external bambam

      integer n

      n = 4

      write (*,*) "Yabba Dabba Doo! In Subroutine TEST"

      write (*,*) "Calling Fred:"
      call fred
      write (*,*) "Calling Bambam:"
      call bambam(n)

      end
