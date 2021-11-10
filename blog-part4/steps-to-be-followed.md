## This blog part will be covering step 5 which is given below:
**5. Creation of metadata extension for UI elements and Creation of Behavior definition and projection for defining the action possible on the service. Example- Create, Update, Delete, determination etc.**

5.1 Metadata Extension for ZC_RAP_E2E_AEMP
#### Pre-requisite: A pre-requisite for extending a CDS entity with metadata extensions is that the annotation Metadata.allowExtensions with the default value true is specified in the DDL source code of the CDS entity.

Right click on the package created by you in first step and go to New → Other repository objects. Search and select 'Metadata Extension'.
![4 1](https://user-images.githubusercontent.com/82094951/141056865-563ba43c-54e6-45ad-ba6b-bb9e73d6fa2c.jpg)


Give suitable name and description for it and click on Next, choose the Transport Request and click on Finish.
###Important: The names of metadata extensions are the same as their related CDS entities.
![4 2](https://user-images.githubusercontent.com/82094951/141063229-3be789c5-8c76-4566-9c73-4d1b5bf0b00a.jpg)

Metadata extension tells the about the layout, positioning, and more UI related information for the fields to be displayed.
Once you get the layout, add the below code to it.
![4 3](https://user-images.githubusercontent.com/82094951/141063270-81c8f8aa-da0e-4eba-bbb2-b031afa7b746.jpg)
![4 4](https://user-images.githubusercontent.com/82094951/141063286-c6de7f5a-ffe3-4e5c-87d1-781354570cdb.jpg)


5.2 Metadata Extension for ZC_RAP_E2E_AEMPL
![4 5](https://user-images.githubusercontent.com/82094951/141063319-e421f199-e40b-4c90-b2a5-2cb4c73e4c4a.jpg)

5.3 Metadata Extension for ZC_RAP_E2E_AEMP_M
![4 6](https://user-images.githubusercontent.com/82094951/141063384-ff3f4990-7f1d-4b95-8df6-68e980310b0f.jpg)
![4 7](https://user-images.githubusercontent.com/82094951/141063403-1b5d35b8-61fe-4266-ae49-3f04f2474bf2.jpg)


5.4 Metadata Extension for ZC_RAP_E2E_AEMPL_M
![4 8](https://user-images.githubusercontent.com/82094951/141064478-b5028a67-5244-43c1-abfb-7afc33e15330.jpg)

### With this, we have completed the creation of metadata extension and now we can proceed towards the creation of Behavior Definition
#### Note that Behavior definition will be created for the root CDS interface view and behavior projection will be created for the root CDS projection view.

As always, the first part of this step is to go to New → Other repository objects. After this, search for 'Behavior Definition' and give appropriate description for it. Then, click on browse to look for the 'Root Entity'.
![4 9](https://user-images.githubusercontent.com/82094951/141064660-a74b7c9a-da66-4094-bfee-b48d0a5f2a5c.jpg)

After selecting the root CDS interface view, the implementation type will automatically become Managed.
![4 10](https://user-images.githubusercontent.com/82094951/141064720-9e751ce2-3005-4a03-a165-da4c72d2de5d.jpg)

Since the type of implementation is managed, we have to mention it in the first line. This will allow RAP to take care of the create, update and delete operation. Here class **zbp_i_rap_e2e_aemp** is the class in which we will be defining the business logic of all the behavior we are implementing ourselves such as action, determination, validation. 

> Note: This class ZBP_I_RAP_E2E_AEMP will be created in the next part of our blog series.

For the Employee interface view, we are defining two action, one validation and one determination behavior. 
**Action**
1. hireEmployee - to set the status of an employee as active
2. retireEmployee - to set the status of an employee as inactive

**Validation**
1. validateAge - to check the age of an employee using the field DateOfBirth during the save sequence of the create operation.

**Determination**
1. assignIDs - to generate EmployeeID during the create operation for an employee.

Determination on save - The determination is executed during the save sequence at the end of a transaction, when changes from the transactional buffer are persistent on the database.
![4 11](https://user-images.githubusercontent.com/82094951/141064796-e6a5f9d3-7410-42b1-b58c-fae2b472c1e4.jpg)

For the employment interface view, we are defining two determination

**Determination**
1. checkPositonAssigned - to check if any position is assigned to the employee already during create operation and if a position is already assigned then creation new employment for the same employee will throw an error.
2. assignAdditionalInfo - to automatically assign the salary to the employee depending on the PositionID.
![add_info](https://user-images.githubusercontent.com/82094951/141065437-5a03c070-1d41-4695-bb6e-fcc97a52908f.jpg)

5.6 Creation of behavior projection
Once the behavior definition for the root interface view of the composition model is defined, we can move forward with the creation of behavior projection.
Behavior projection will be created using the root CDS projection view of the composition model. In our case we have two root CDS projection view, so we will be creating two behavior projection.  
![4 12](https://user-images.githubusercontent.com/82094951/141065555-68a294ba-da48-4f38-83f5-bae8aa5c37e6.jpg)

After selecting the root CDS projection view, the implementation type will automatically become Projection.
![4 13](https://user-images.githubusercontent.com/82094951/141065602-f8809fe8-1559-49b9-9bcc-b4395f5243aa.jpg)
![4 14](https://user-images.githubusercontent.com/82094951/141065668-a0bf57a8-a34c-4daa-871f-ea7dd6ba1fb0.jpg)


