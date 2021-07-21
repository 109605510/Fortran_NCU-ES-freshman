Program HW7
implicit none
    integer i, n
    integer a(8), b
    integer greater_num, lower_num
!-------------------------------------

    read(*,*) n

    do i=1,n
    read(*,*)a(i)
    enddo

    b = a(1)
    do i=1,n
    if ( b .gt. a(i) ) then
        greater_num = b
    else
        greater_num = a(i)
        b = a(i)
    endif
    enddo
    write(*,"('Max=',i2)")greater_num

    b = a(1)
    do i=1,n
    if ( b .lt. a(i) ) then
        lower_num = b
    else
        lower_num = a(i)
        b = a(i)
    endif
    enddo
    write(*,"('Min=',i2)")lower_num

    stop
    end program