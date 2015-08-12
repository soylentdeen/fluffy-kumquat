      subroutine test

cf2py intent(callback, hide) fred 

cf2py intent(callback, hide) bambam
      
      external fred
      external bambam

      integer n

      n = 4

      write (*,*) "Yabba Dabba Doo!"

      call fred
      call bambam(n)

      end
