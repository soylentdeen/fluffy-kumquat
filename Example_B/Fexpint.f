      real*8 function expint_NR(x, n)
      INTEGER n, MAXIT
      REAL*8 x, EPS, FPMIN, EULER
      PARAMETER(MAXIT=100,EPS=1.e-7,FPMIN=1.e-30,
     .           EULER=.5772156649015328)

      INTEGER i, ii, nm1
      REAL a, b, c, d, del, fact, h, psi
      nm1=n-1
      if(n.lt.0.or.x.lt.0..or.(x.eq.0..and.(n.eq.0.or.n.eq.1)))then
          write(*,*) 'bad arguments in expint_NR', n, x
      else if(n.eq.0)then            ! Special Case
          expint_NR=exp(-x)/x
      else if(x.eq.0.)then           ! Another special case
          expint_NR=1./nm1
      else if(x.gt.1.) then          ! Lentz's algorithm
          b=x+n
          c=1./FPMIN
          d=1./b
          h=d
          do i=1,MAXIT
              a=-1*(nm1+1)
              b=b+2
              d=1./(a*d+b)
              c=b+a/c
              del=c*d
              h=h*del
              if(abs(del-1.).lt.EPS)then
                  expint_NR=h*exp(-x)
                  return
              endif
          enddo
          write(*,*) 'Continued Fraction failed in expint_NR'
      else
          if(nm1.ne.0)then
              expint_NR=1./nm1
          else
              expint_NR=-log(x)-EULER
          endif
          fact=1.
          do i=1,MAXIT
              fact=-fact*x/i
              if(i.ne.nm1)then
                  del=-fact/(i-nm1)
              else
                  psi=-EULER
                  do ii=1,nm1
                      psi=psi+1./ii
                  enddo
              endif
              expint_NR=expint_NR+del
              if(abs(del).lt.abs(expint_NR)*EPS) return
          enddo
          write(*,*) 'series failed in expint_NR'
      endif
      return
      END
