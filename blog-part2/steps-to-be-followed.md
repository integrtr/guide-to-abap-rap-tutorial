## Scenario

![2 1](https://user-images.githubusercontent.com/82094951/141241872-545a6474-8c35-4a82-829e-7f47aef2c705.jpg)

We have a hiring scenario where the HR has permissions to create an employee if she/he does not exist, or update the details for an employee already in their organization. HR Manager has permissions to set status of hired or updated employee as active or inactive. The latter will also be able to delete and update certain information of employees from records provided by HR.
Other than create, update and delete operation, we will also implement the following:
1. Determination - Based on the position of an employee, his/her salary will be added or updated
2. Validation - Check age of an employee based on their date of birth, it should be greater than or equal to 18 years.
3. Action - HR Manager can set an employee as active or inactive which corresponds to hire and retire respectively.

## Steps we'll cover in this part
1. **Creation of a package.**
2. **Creation of three tables namely Employee information, to store basic information about an employee; Employment information, to store employment components like date of joining and salary; and Position information, to store position related information (this will be used as Value help).**

Let us now begin with the development. For this, first step is to create a package. 
1. Create a package
- Open project explorer and right click on 'Favorite Packages'. Select New→ ABAP Package.
![2 2](https://user-images.githubusercontent.com/82094951/141242079-155c7779-940a-49e5-bcfa-d139f0a9439e.jpg)
- Provide Name and Description for it and mark 'Add to favorite packages'. This will keep your package on top where you can access it easily.

![2 3](https://user-images.githubusercontent.com/82094951/141242158-9640dc8f-6efb-48df-a300-e8a9ac259481.jpg)

- Click Next and give 'Software Component'. Go to the next step and create or select a transport request for the package and click on Finish. Your package will be created.
![2 4](https://user-images.githubusercontent.com/82094951/141242250-f95046ae-7628-4d19-a78d-4d554e6ee0db.jpg)

2. We will now create data element and database tables.

### Data element
To create the data element, right click on the package created and click on New→ Other ABAP Repository Object→ Data Element.
![2 5](https://user-images.githubusercontent.com/82094951/141242370-5ed860d6-049f-418e-94dc-8506932f57f9.jpg)

Provide name to it, ZRAP_E2E_ID and give a suitable description
![2 6](https://user-images.githubusercontent.com/82094951/141242520-32a75d51-a061-429a-9317-c9dc864e84cc.jpg)

Click on next and provide Transport Request to it and then click on finish. You will get a screen for providing data type information as shown below.
![2 7](https://user-images.githubusercontent.com/82094951/141242602-0860e2f1-5a25-42fb-b30c-a2178051c8b1.jpg)

Save and Activate.

**Employee Information Table**

This table will store details about an employee like employee ID, first and last name, date of birth, etc. 
1. To create this table, right click on the package created and click on New→ Other ABAP Repository Object→ Database Table.
![2 8](https://user-images.githubusercontent.com/82094951/141242665-ececd60c-e95b-4c4a-8b08-ae3b10ee3114.jpg)

2. Provide a name to it, ZRAP_E2E_AEMP and give suitable description. 
![2 9](https://user-images.githubusercontent.com/82094951/141242684-431da2b7-1a91-42d1-a19d-5a882490a6c6.jpg)

3. Click on Next and provide Transport Request to it and then click on Finish. You will get a predefined outline of code where you can enter the below code.

![2 10](https://user-images.githubusercontent.com/82094951/141242718-6072e6d3-8f62-424e-b42a-57ae01acb179.jpg)

**Employment Information Table**
This table will store details about employees employment information like salary, joining date, employment ID and so on.
1. To create this table, right click on the package created and click on New→ Other ABAP Repository Object→ Database Table.
![2 5](https://user-images.githubusercontent.com/82094951/141243106-5ace046c-3cd9-46f7-a951-0998b1e7d02f.jpg)


2. Provide a name to it, ZRAP_E2E_AEMPL and give suitable description.
![2 13 1](https://user-images.githubusercontent.com/82094951/141244431-7d5f5244-f60c-4288-bf54-9fd143e1a840.jpg)

3. Click on Next and provide Transport Request to it and then click on Finish. You will get a predefined outline of code where you can enter the below code.

![2 11](https://user-images.githubusercontent.com/82094951/141243832-21387ea7-5ded-4d1e-a2d3-97e5d8058f8d.jpg)

**Position Information Table**
This table will act as value help for other two tables created and will contain fields like Position ID, Salary, etc.
1. To create this table, right click on the package created and click on New→ Other ABAP Repository Object→ Database Table.
![2 5](https://user-images.githubusercontent.com/82094951/141243887-215b3285-f05d-4592-bb6b-7348666c4e3a.jpg)

2. Provide a name to it, ZRAP_E2E_APOS and give suitable description.
![2 14 1](https://user-images.githubusercontent.com/82094951/141244523-d5e515b5-bb98-4ab5-a3af-cd10146b0a39.jpg)

3. Click on Next and provide Transport Request to it and then click on Finish. You will get a predefined outline of code where you can enter the below code. 

![2 12](https://user-images.githubusercontent.com/82094951/141244136-91cf0adb-f801-47b6-bc51-9c5b670eec94.jpg)


Here we are, at the end of first two steps in the making of a hire-to-retire scenario.
