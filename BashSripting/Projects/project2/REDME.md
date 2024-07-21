# Close Symptom Events

## Project Overview

This project involves creating a shell script to manage monitoring tool events based on incident statuses. The script checks if an incident is closed or open and updates the event status accordingly.

## Files

- `ticket_status`: Contains incident numbers and their statuses.
- `events_tickets.txt`: Contains event IDs and their associated incident numbers.
- `events_status.txt`: Output file that logs closed events.

## Usage

1. Create the `ticket_status` and `events_tickets.txt` files.
2. Run the `script.sh` script.
3. Enter the incident number when prompted.
4. The script will update the `events_status.txt` file if the incident is closed.

## Example
1. `ticket_status.txt`
- INC0000401355  opened
- INC0000401340  closed
- INC0000401356  closed
2. `events_tickets.txt`
   - NC0000401355          6192fd9a-9b03-71ec-01b9-0a4e23470000 
   - INC0000401340         6192fd9a-9b03-71ec-01b9-0a4e23454213
3. `Output(Events_status.tx)`
6192fd9a-9b03-71ec-01b9-0a4e23454213    closed
