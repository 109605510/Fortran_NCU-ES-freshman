Program HW5
implicit none
    integer :: num, a
    real :: b
!------------------

    num = 510
    a = 7
    b = 7

    write(*,*)num/a
    write(*,*)num/b

    write(*,'(I10)') num/a
    write(*,'(F5.2)') num/b

    stop
    end program