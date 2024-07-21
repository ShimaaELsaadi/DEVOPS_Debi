#! /bin/bash
#script to add tickets and check if it closed or not
file1="events_tickets.txt"
file2="ticket_status.txt"
file3="Events_status.txt"
#--------------------------function to add new event------------------------------------------#
adding() {
    #read event info from user
     read -p "Enter the incident number: " in 
    read -p "Enter the event id: " id 

    # Append incident number to events_tickets.txt and ticket_status.txt
    echo "$in" >> events_tickets.txt
    echo "$in" >> ticket_status.txt

    # Write id to the 2nd column in file1 for the matching incident number
    awk -v incident="$in" -v event_id="$id" '
    BEGIN { FS = "[ \t]+"; OFS = "  " }
    $1 == incident { $2 = event_id }
    { print }
    ' "$file1"> tmpfile1 && mv tmpfile1 "$file1"

    # Write "opened" to the 2nd column in file2 for the matching incident number
    awk -v incident="$in" -v status="opened" '
    BEGIN { FS = "[ \t]+"; OFS = "  " }
    $1 == incident { $2 = status }
    { print }
    ' "$file2" > tmpfile2 && mv tmpfile2 "$file2"
    echo "success"
}
#------------------------------check if event closed or not and take action-------------------------------------------#
checking(){
    #read the incident number of event
    read -p "Enter the incident number: " in
     c="closed"

    # Search file2 for matching rows
    awk -v col1="$in" -v col2="$c"  '
    BEGIN { FS = "[ \t]+" }
    $1 == col1 && $2 == col2 {
        print $0  
        # Search file1 for matching incident number
        command = "awk -v col1=" col1 " \047BEGIN { FS = \"[ \\t]+\" } $1 == col1 { print $2 }\047 '$file1'"
        command | getline id
        close(command)

        # Write the ID to Events_status.txt
        print id >> "Events_status.txt"

        # write closed to 2nd column at  Events_status.txt
        command = "awk -v data=\"closed\" \047BEGIN { FS = \"  \\t \"; OFS = FS } { lines[NR] = $0 } END { for (i = 1; i < NR; i++) print lines[i]; split(lines[NR], a); a[2] = a[2] \" \" data; for (i = 1; i <= length(a); i++) printf \"%s%s\", a[i], (i == length(a) ? ORS : OFS) }\047 '$file3' > tmpfile3 && mv tmpfile3 '$file3'"
        system(command)
    }
    $1 == col1 && $2 == "opened" {
         print $0
    }

    ' "$file2"
}

show_closed(){
  awk -v col2="closed"  '
    BEGIN { FS = "[ \t]+" }
    $2 == col2 {
     print $0
     } ' "$file2"
}

show_opened(){
    awk -v col2="opened"  '
    BEGIN { FS = "[ \t]+" }
    $2 == col2 {
     print $0
     } ' "$file2"

}

echo "Welcom to Close symptom events"
PS3="Enter a number: "

select ev  in add check Show_all_closed show_all_Opened close
do
 case $ev in

  add)
	  adding
    ;;

  check)
        checking
    ;;
  Show_all_closed)
	  show_closed
	;;
  show_all_Opened)
	show_opened
	;;
    close)
    echo "Closed...."
    break
    ;;
   *)
	   echo "Not Valid"
esac
done

