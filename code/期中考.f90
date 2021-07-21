implicit none
    integer i, n

    integer num(100)
    real height(100), weight(100) ,BMI(100)

    character*80 input_file_name
!-----------------------------------

    write(*,*)'Input file name:'
    read(*,*) input_file_name      !data2.txt

    write(*,*)'Input the amount of points of the file:' 
    read(*,*) n

    open(8,file=input_file_name,status='OLD')

    write(*,"('體重不正常人員   /   BMI   /    體態   /  回復正常變量 ：')")

    do i=1,n
        read(8,*) num(i), height(i), weight(i)
        BMI(i) = weight(i) / (height(i)/100.)**2.
        if (BMI(i)>=24 .or. BMI(i)<18.5) then
            if (24<=BMI(i) .and. BMI(i)<27) then
                print*, num(i), BMI(i), '過重   ', 24.0*(height(i)/100.)**2.-weight(i)
            elseif (27<=BMI(i) .and. BMI(i)<30) then
                print*, num(i), BMI(i), '輕肥   ', 24.0*(height(i)/100.)**2.-weight(i)
            elseif (30<=BMI(i) .and. BMI(i)<35) then
                print*, num(i), BMI(i), '中肥   ', 24.0*(height(i)/100.)**2.-weight(i)
            elseif (35<=BMI(i)) then
                print*, num(i), BMI(i), '重肥   ', 24.0*(height(i)/100.)**2.-weight(i)
            elseif (BMI(i)<18.5) then
                print*, num(i), BMI(i), '過輕   ', 18.5*(height(i)/100.)**2.-weight(i)
            endif
        endif
    enddo 

    close(8)

    stop
    end 