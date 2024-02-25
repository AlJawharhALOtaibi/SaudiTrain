# Train Ticket Scheduling Backend Service Powered by Vapor, Fluent, Postman, Postico, and PostgreSQL

![Metro](https://github.com/AlJawharhALOtaibi/SaudiTrain/assets/121889997/eeda35d0-b7a9-48be-abc4-e23d080a0830)

### Overview

The Train Ticket Scheduling Backend Service is an integral part of a sophisticated train ticketing system. It efficiently manages backend operations related to ticket scheduling and management, employing technologies like Xcode, Vapor, Fluent, Postman, and PostgreSQL. This service ensures seamless communication between frontend interfaces and underlying data storage systems, providing a smooth user experience for passengers and operators.

### App Statment: Train Ticket Scheduling Backend Service.

## Key Features

### Passenger Management:
- Fetch all Passengers
- Delete Passenger by ID
- Create Passengers 
- Read Passengers by ID
- Update Passengers by ID
- Fetch Passengers by ID

### Ticket Management:
- Fetch all Tickets
- Fetch Ticket by Ticket Number
- Delete Ticket by Ticket Number
- Read Ticket by Ticket Number

### Train Schedule Management:
- Create Train Schedule by ID
- Read Train Schedule by ID
- Delete Train Schedule by ID
- Update Train Schedule by ID
- Fetch all Train Schedules
- Fetch Train Schedule by ID


## Functionality: Endpoint Catalog for Passenger, Ticket, and Train Schedules:

The service offers various tables and endpoints for smooth functionality:

### Passengers Table

| Column Name   | Type    | 
| ------------- | ------- |
| PassengerName | String  |
| id            | UUID    |

- Where id is the PRIMARY KEY
  
| Request Method	 | Route | Action |
|----------|----------|----------|
| GET | /passengers| Returns a list of all passenger data |
| GET | /passengers/:id | Returns passenger data by ID |
| POST | /passengers| Creates a new passenger |
| DELETE | /passengers/:id| Deletes passenger data by ID |
| PUT | /passengers/:id| Updates passenger data by ID |

### Ticket Table

| Column Name   | Type    | 
| ------------- | ------- |
| id            | UUID    |
| TicketNumber  | String  |
| PassengerID   | UUID    |
| PassengerName | String  |
| SeatNumber    | String  |

- Where id is the PRIMARY KEY and PassengerID is FOREIGN KEY
  
| Request Method	 | Route | Action |
|----------|----------|----------|
| POST | /ticket| Creates a new ticket |
| GET | /ticket| Returns a list of all ticket data |
| GET | /ticket/:id | Returns ticket data by ID |
| DELETE | /ticket/:id| Deletes ticket data by ID |
| PUT | /ticket/:id| Updates ticket data by ID |

### Train Schedules Table

| Column Name   | Type    | 
| ------------- | ------- |
| id            | UUID    |
| ScheduleID    | int     |
| TrainNumber   | string  |
| ArrivalStation| string  |
| ArrivalDate   | datetime|

- Where ScheduleID is the PRIMARY KEY
  
| Request Method	 | Route | Action |
|----------|----------|----------|
| GET | /train_schedule| Returns a list of all train Schedule data |
| GET | /train_schedule/:id | Returns train Schedule data by ID |
| DELETE | /train_schedule/:id| Deletes train Schedule data by ID |
| PUT | /train_schedule/:id| Updates train Schedule data by ID |

All endpoints support JSON encoding and decoding of each itinerary and pilgrim items. To create, delete, or update on the itinerary’s type, send a JSON payload in the request body.


## Project Milestones:

1. **Comprehend the system and construct an Entity-Relationship (ER) diagram:**
 ![Untitled Diagram drawio-2](https://github.com/AlJawharhALOtaibi/SaudiTrain/assets/87391133/2e653ad4-bd1d-46c9-bf4c-c17b06218f8c)

2. **Creating Database using Postgres:**
   - Execute the following command: `CREATE DATABASE sauditrain;`
   ![Database Creation](https://github.com/AlJawharhALOtaibi/SaudiTrain/assets/87391133/2acfeb3f-a304-4fb0-87ed-e31813785b81)

3. **Creating Project in Xcode using Vapor:**
   - Generate the project with: `vapor new SaudiTrain`
   - Linking to the Database through the **configure** page:
     ![Database Linking](https://github.com/AlJawharhALOtaibi/SaudiTrain/assets/87391133/dd2e8582-f114-41ab-b41b-109b3fe4fa0c)
   - Build required tables as **Models**. In our case, we have three tables.
   
4. **Implementing Item Addition in Tables:**
   - Create `prepare` and `revert` or each table.

5. **Implementing Item Addition via Postman:**
   - Use **Postman** as a networking tool to add items. 
   - Generate controllers to enable functionality, creating root and APIs for each.
 
6. **Visualizing Database with Added Items:**
   - Utilize **Postico** to visualize the database with the added items. <img width="939" alt="image" src="https://github.com/AlJawharhALOtaibi/SaudiTrain/assets/87391133/ae34bb2b-82e2-46f6-984b-e1b695b434c6">


### Credits
The project was created with the collaboration of @Rosie2378.
