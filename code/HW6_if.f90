Program HW6
implicit none 
    real a 
    real b 
    real c 
    real x1
    real x2
!----------------------

    write( *,"('ax^2+bx+c=0 then a? b? c?')" )
    read(*,*)a, b, c 

    if ( (b**2.-4.*a*c).ge.0 ) then
        x1 = ( -b+(b**2.-4.*a*c)**(1./2.) ) / (2.*a) 
        x2 = ( -b-(b**2.-4.*a*c)**(1./2.) ) / (2.*a)
        write(*," ('(x1,x2)=(',f3.1,',',f4.1,')' )") x1, x2
    elseif ( (b**2.-4.*a*c).lt.0 ) then
        write( *,"('無實數解')" )
        stop 
    endif 

    if (x1.gt.0) then
        if (x2.gt.0) then
            write(*,"('第一象限')")
        endif 
        if (x2.lt.0) then
            write(*,"('第四象限')")
        endif
    elseif (x1.lt.0) then
        if (x2.gt.0) then
            write(*,"('第二象限')")
        endif 
        if (x2.lt.0) then
            write(*,"('第三象限')")
        endif
    endif 


    stop
    end program 