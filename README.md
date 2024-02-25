## Train Ticket Scheduling Backend Service

![Metro](https://github.com/AlJawharhALOtaibi/SaudiTrain/assets/121889997/eeda35d0-b7a9-48be-abc4-e23d080a0830)

### Overview

The Train Ticket Scheduling Backend Service is an essential element of a train ticketing system, responsible for managing backend operations related to ticket scheduling and management. Utilizing modern technologies such as Xcode, Vapor, Fluent, Postman, and PostgreSQL, it provides robust functionality for handling passengers, tickets, and train schedules.

The Train Ticket Scheduling Backend Service plays a critical role in ensuring the smooth operation of the train ticketing system. It facilitates seamless communication between frontend interfaces and underlying data storage systems, delivering an efficient user experience for both passengers and operators.

### Features

Key features of the Train Ticket Scheduling Backend Service include:

1. **Passenger Management:**
   - Fetch all Passengers
   - Delete Passenger by ID
   - Create Passengers 
   - Read Passengers by ID
   - Update Passengers by ID
   - Fetch Passengers by ID

2. **Ticket Management:**
   - Fetch all Tickets
   - Fetch Ticket by Ticket Number
   - Delete Ticket by Ticket Number
   - Read Ticket by Ticket Number

3. **Train Schedule Management:**
   - Create Train Schedule by ID
   - Read Train Schedule by ID
   - Delete Train Schedule by ID
   - Update Train Schedule by ID
   - Fetch all Train Schedules
   - Fetch Train Schedule by ID

### Tools

Thank you for utilizing the following tools:

1. **Vapor**:
   - Description: Vapor is a server-side Swift web framework enabling developers to create high-performance web applications and APIs.
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

### Usage

![Untitled Diagram drawio-2](https://github.com/AlJawharhALOtaibi/SaudiTrain/assets/87391133/2e653ad4-bd1d-46c9-bf4c-c17b06218f8c)

The project offers the following tables and their respective endpoints:

#### Passengers Table

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

#### Ticket Table

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

#### Train Schedules Table

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

### Credits

The project was created with the collaboration of @Rosie2378.
