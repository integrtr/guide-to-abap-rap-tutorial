## Scenario

![scenario](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/a4ee3ebf-6913-42ad-85a5-ce5f72f7ce68/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211018%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211018T054527Z&X-Amz-Expires=86400&X-Amz-Signature=a4647cc564713271dfd4b9bc28ffb71a78a514b46e19098473c0665904e74c4d&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

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
![package](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/73cb665a-4d0e-4547-b467-4ab63c7293e1/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211014T102517Z&X-Amz-Expires=86400&X-Amz-Signature=aadde76175ccb9a9a0c3b49677c5191a94b060cea742f14f12498de07849825e&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

- Provide Name and Description for it and mark 'Add to favorite packages'. This will keep your package on top where you can access it easily.

![package-name](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/10452796-922d-4cc3-ba3d-13413db15be3/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211014T102653Z&X-Amz-Expires=86400&X-Amz-Signature=2f9cde22b87d5941f8d6d6adc68a5b1164b70219e99a33f2af86ecad11855df1&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

- Click Next and give 'Software Component'. Go to the next step and create or select a transport request for the package and click on Finish. Your package will be created.
![TR](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b34370e6-d7f0-4f9e-b85f-1a4c8e409429/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211014T102750Z&X-Amz-Expires=86400&X-Amz-Signature=ba10156aa79e128b99de0a77892083610f0e6b86142e1615f1420af6176d9a61&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)


2. We will now create data element and database tables.

### Data element
To create the data element, right click on the package created and click on New→ Other ABAP Repository Object→ Data Element.
![create-table](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b0959e5f-2566-4954-8e3e-66837b4eacb9/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211014T103313Z&X-Amz-Expires=86400&X-Amz-Signature=ce25f1b546f061be026211462a39d911703fec935113b421bf3e885d3273637b&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

Provide name to it, ZRAP_E2E_ID and give a suitable description
![data-element](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/99c6f4c8-c982-4173-9530-d594bd95e128/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211019%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211019T062211Z&X-Amz-Expires=86400&X-Amz-Signature=f42c222d9d3a2638683a2ef47b3b40b56ebb304564553b79ca1744f7a05f73e1&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

Click on next and provide Transport Request to it and then click on finish. You will get a screen for providing data type information as shown below
![element-info](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/e47acbc5-802b-4593-98d9-eadfbb84e052/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211019%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211019T062834Z&X-Amz-Expires=86400&X-Amz-Signature=414346d5b879d5de9c44e2ef4fccee71eb2121c1ec851cb015655f08013a9074&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

Save and Activate.

**Employee Information Table**

This table will store details about an employee like employee ID, first and last name, date of birth, etc. 
1. To create this table, right click on the package created and click on New→ Other ABAP Repository Object→ Database Table.
![create-table](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b0959e5f-2566-4954-8e3e-66837b4eacb9/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211014T103313Z&X-Amz-Expires=86400&X-Amz-Signature=ce25f1b546f061be026211462a39d911703fec935113b421bf3e885d3273637b&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

2. Provide a name to it, ZRAP_E2E_AEMP and give suitable description. 
![table-name](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b5f92640-4584-4901-a687-dec4e6539ae7/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211014T103526Z&X-Amz-Expires=86400&X-Amz-Signature=a4ebc0fc76bf134b41184b2db684ae94bc206cb59dfbf4fccedfd9213f12adbc&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

3. Click on Next and provide Transport Request to it and then click on Finish. You will get a predefined outline of code where you can enter the below code.
 
![table-fields](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/cbf87c97-75ec-48e1-8343-b6a0edb55dd7/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211014T103322Z&X-Amz-Expires=86400&X-Amz-Signature=a72149cab2ef8baa42f97b6e345c1c4c238bc2af65b5daee6f59d3429b93d7f1&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)


**Employment Information Table**
This table will store details about employees emplyment information like salary, joining date, employment ID and so on.
1. To create this table, right click on the package created and click on New→ Other ABAP Repository Object→ Database Table.

![create-table](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b0959e5f-2566-4954-8e3e-66837b4eacb9/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211014T103313Z&X-Amz-Expires=86400&X-Amz-Signature=ce25f1b546f061be026211462a39d911703fec935113b421bf3e885d3273637b&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

2. Provide a name to it, ZRAP_E2E_AEMPL and give suitable description.

![table-name2](https://user-images.githubusercontent.com/82094951/137674359-41161d4a-05bf-4606-a442-ec9e16023078.png)


3. Click on Next and provide Transport Request to it and then click on Finish. You will get a predefined outline of code where you can enter the below code.

![table-fields](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b7735a65-3162-4ff1-9d83-29d873ec5c6e/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211014T104423Z&X-Amz-Expires=86400&X-Amz-Signature=001c9af15168606b882dba072c789d635898773d803f367fef9c9d03784655ef&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)


**Position Information Table**
This table will act as value help for other two tables created and will contain fields like Position ID, Salary, etc.
1. To create this table, right click on the package created and click on New→ Other ABAP Repository Object→ Database Table.

![create-table](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b0959e5f-2566-4954-8e3e-66837b4eacb9/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211014T103313Z&X-Amz-Expires=86400&X-Amz-Signature=ce25f1b546f061be026211462a39d911703fec935113b421bf3e885d3273637b&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

2. Provide a name to it, ZRAP_E2E_APOS and give suitable description.

![table-name3](https://user-images.githubusercontent.com/82094951/137674647-59ec37eb-c9b6-45c1-b040-f6f3bc304a75.png)

3. Click on Next and provide Transport Request to it and then click on Finish. You will get a predefined outline of code where you can enter the below code. 

![table-fields](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/9768851b-e53b-4224-9f7a-3aa4307c07ad/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211014%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211014T104638Z&X-Amz-Expires=86400&X-Amz-Signature=d2967823045cb8d22b68dfc5639f68fb78c734c8b097603c3f929a48752064f0&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)


Here we are, at the end of first two steps in the making of a hire-to-retire scenario.
