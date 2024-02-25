# Saudi Train Ticket

![Metro](https://github.com/AlJawharhALOtaibi/SaudiTrain/assets/121889997/eeda35d0-b7a9-48be-abc4-e23d080a0830)

## Overview

The Train Ticket Scheduling Backend Service is a vital component of a train ticketing system, responsible for managing the backend operations related to ticket scheduling and management. Built using modern technologies such as Xcode, Vapor, Fluent, Postman, and PostgreSQL, it offers robust functionality for handling passengers, tickets, and train schedules.

Overall, the Train Ticket Scheduling Backend Service plays a critical role in ensuring the smooth operation of the train ticketing system, enabling seamless communication between the frontend interfaces and underlying data storage systems while delivering a seamless and efficient user experience for passengers and operators alike.

## Features

Key features of the Train Ticket Scheduling Backend Service include:

1. **Passenger Management:** CRUD operations for managing passenger information.
2. **Ticket Management:** Creation, retrieval, and deletion of ticket records.
3. **Train Schedule Management:** Handling train schedules, including CRUD operations for defining timing, routes, and availability.

## Tools 🛠️

Thank you for downloading the following tools:

1. **Vapor**:
   - Description: Vapor is a server-side Swift web framework that enables developers to create high-performance web applications and APIs.
   - Website: [Vapor](https://vapor.codes/)

2. **Postman**:
   - Description: Postman is a widely-used API development tool designed for testing, documenting, and managing APIs.
   - Website: [Postman](https://www.postman.com/)

3. **Postico**:
   - Description: Postico is a user-friendly PostgreSQL client specifically built for macOS, providing a visual interface for managing and interacting with PostgreSQL databases.
   - Website: [Postico](https://eggerapps.at/postico/)

4. **Postgres**:
   - Description: Postgres is an open-source relational database management system known for its advanced features and scalability, ideal for handling complex data storage and retrieval requirements.
   - Website: [PostgreSQL](https://www.postgresql.org/)

# Usage

The project provides the following tables and their endpoints:


### Passengers Table

| Column Name   | Type    | 
| ------------- | ------- |
| PassengerName | String  |
| id            | UUID    |

-  Where id is the PRIMARY KEY
  
| Request Method	 | Route | Action |
|----------|----------|----------|
| Get | /passengers| Returns a list of all passenger data |
| Get | /passengers/:id | Returns a list of all passenger data by ID |
| POST | /passengers| Creates a new passenger |
| DELET | /passengers/:id| Deletes an existing passenger data by ID. |
| PUT | /passengers/:id| Update passenger data by ID. |


### Ticket Table

| Column Name   | Type    | 
| ------------- | ------- |
| id            | UUID    |
| TicketNumber  | String  |
| PassengerID   | UUID    |
| PassengerName | String  |
| SeatNumber    | String  |

- Where id is the PRIMARY KEY and the PassengerID is FOREIGN KEY
  
 | Request Method	 | Route | Action |
|----------|----------|----------|
| POST | /ticket| Creates a new ticket |
| Get | /ticket| Returns a list of all ticket data |
| Get | /ticket/:id | Returns a list of all ticket data by ID |
| DELET | /ticket/:id| Deletes an existing ticket data by ID. |
| PUT | /ticket/:id| Update ticket data by ID. |

### Train SchedulesTable

| Column Name   | Type    | 
| ------------- | ------- |
| id            | UUID    |
| ScheduleID  | int  |
| TrainNumber   | string    |
| ArrivalStation | string  |
| ArrivalDate    | datetime  |
- Where ScheduleID is the PRIMARY KEY
  
| Request Method	 | Route | Action |
|----------|----------|----------|
| Get | /train_schedule| Returns a list of all train Schedule data |
| Get | /train_schedule/:id | Returns a list of all train Schedule data by ID |
| DELET | /train_schedule/:id| Deletes an existing train Schedule data by ID. |
| PUT | /train_schedule/:id| Update train Schedule data by ID. |

All endpoints support JSON encoding and decoding of each Itinerary and Pilgrim items. To create, delete, or update on itinerary’s type, send a JSON payload in the request body.
Example :
## Credits
The project was created by:
- Rozana Alzhrani
- AlJawharh AlOtaibi
  
 @2024
 

