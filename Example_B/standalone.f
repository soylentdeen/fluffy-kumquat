      program standalone
      implicit real*8 (a-h,o-z)
      real*8 x, moog, numrec
      x = 6.663e-6
      moog = expint(x, 2)
c      numrec = expint_NR(x, 2)
      write (*,*) x
      write (*,*) moog
c      write (*,*) numrec
      write (*,*) expint(x,2)
      end
