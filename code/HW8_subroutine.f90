Program HW8
implicit none
    integer i
    integer n
    integer a(100)
    integer big, small
!-----------------------------

    write(*,*) '要比幾個整數？'
    read(*,*) n

    write(*,*) '輸入要比的數字'
    do i=1,n
    read(*,*) a(i)
    enddo

    call comparison( n,a,big,small )

    write(*,*)big
    write(*,*)small

    stop
    end program



    subroutine comparison( n,a,big,small )

    implicit none 
    integer i, n
    integer a(100)
    integer big, small
    !-----------------------------
    big = -1E+06
    small = +1E+06
    do i=1,n
    if ( a(i) .gt. big ) then
        big = a(i)
    endif
    if ( a(i) .lt. small ) then
        small = a(i)
    endif
    enddo

    return
    end subroutine