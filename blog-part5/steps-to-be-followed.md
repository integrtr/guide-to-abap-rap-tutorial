## The remaining steps to be covered for hiring scenario will be covered here:
**6. Creation of Behavior implementation for writing the business logic related to action such as validation, action and determination.**

**7. Creation of binding definition along with service binding for defining the entities to expose and protocol used by the service respectively. Example- OData V2 - UI, OData V2 - WebAPI etc.**

**8. Publish the service.**

Let's get started with step 6.

### Creation of Behavior implementation for writing the business logic related to action such as validation, action and determination.
After defining the behavior of service in the behavior definition, we need to implement business logic to make those behaviors work. This can be done by creating the class zbp_i_rap_e2e_aemp that was defined in behavior definition in the previous part.
In order to create the mentioned class, click on the bulb like button on the left side of the statement in line.
![5 1](https://user-images.githubusercontent.com/82094951/143825602-7bee3e85-2b8d-45f5-8639-c519054380cc.jpg)

Click on "Create behavior implementation" in the **Quick Assist View window**.
![5 2](https://user-images.githubusercontent.com/82094951/143825681-a418ac4a-5e4e-40da-ba7b-442952adc900.jpg)

Fill in the description and save the behavior class in TR.
![5 3](https://user-images.githubusercontent.com/82094951/143825993-3cec846b-139e-44d9-a49f-f6c2ef784bf5.jpg)

After creating the class, you will get a class with boiler plate code containing class definition and implementation for different entities being exposed. This is the place where we will further write the business logic.
![5 4](https://user-images.githubusercontent.com/82094951/143826194-b7b5b446-c21b-4a37-a435-a3edfd76b3e8.jpg)

Let's now look at the business logic for child class LHC_EMPLOYEE which corresponds to the Employee entity.

**LHC_EMPLOYEE**

This class is created specifically for the employee Entity. It will validate an employee's age, hire and retire an employee, assign ID to that employee. Use the code provided below, but don't activate the object.

![5 5](https://user-images.githubusercontent.com/82094951/143826465-7f5b3afc-c067-455d-bf2e-491b773a059e.jpg)
![5 6](https://user-images.githubusercontent.com/82094951/143826498-9f9fa2ed-ac57-48fa-b7f6-69fe85a84bbc.jpg)
![5 7](https://user-images.githubusercontent.com/82094951/143826512-5c9a08a4-264e-44bb-9b3e-61cd456cabdf.jpg)
![5 8](https://user-images.githubusercontent.com/82094951/143826524-3336c42c-e57e-4e26-a712-8ec50444633b.jpg)

**LHC_EMPLOYEMENT**

Similar to employee entity, this class is created specifically for the employment Entity. It will allow us to write the business logic for determination of checkPositionAssigned which will check if an employee is assigned a position or not, and determination of assignAdditionalInfo to assign employee with additional information.

![5 9](https://user-images.githubusercontent.com/82094951/143826656-8b981649-d29b-49cb-84bd-1fbf53a27bf1.jpg)

Now that we have implemented the methods for all the business logic, we will also be implementing additional resources which are required to raise error messages. For this we will be implementing the **class ZCM_RAP_E2E and Message class ZRAP_E2E_MSG**.

**Message Class - ZRAP_E2E_MSG**

To create a message class, **right click your Package->New->other ABAP Repository Object->Texts->Message Class**.

![5 10](https://user-images.githubusercontent.com/82094951/143826980-43b1ccc8-6072-437a-99cb-a16ddf2c770f.jpg)

Provide message class name and description and assign a transport request and choose Finish.
![5 11](https://user-images.githubusercontent.com/82094951/143827029-16b08600-b0b8-4261-ac5b-84084dcad68f.jpg)

Now we have created the message class, let's add some message text along with the message ID.
![5 12](https://user-images.githubusercontent.com/82094951/143827097-901a4a11-4277-4552-91b4-dd015b855a2c.jpg)

**Class for Exception - ZCM_RAP_E2E**

The class ZCM_RAP_E2E is added as an exception class. To create a exception class, **right click your Package->New->ABAP Class**.
Provide name and description and provide CX_STATIC_CHECK as super class and add IF_ABAP_BEHV_MESSAGE as interfaces.

![5 13](https://user-images.githubusercontent.com/82094951/143827500-5345d1ae-deb7-4c18-aa97-17d9b8c6ac28.jpg)

Assign a transport request and choose Finish. Add the code provided below.
![5 14](https://user-images.githubusercontent.com/82094951/143827586-ce73330c-3e5f-414a-a0ea-56fb2d137047.jpg)
![5 15](https://user-images.githubusercontent.com/82094951/143827612-fcda5c1f-2db7-43e3-bab2-4a98a096238c.jpg)

Now, we will be creating a simple class ZCL_GENERATE_E2E_DATA for populating the table ZRAP_E2E_APOS.
![5 16](https://user-images.githubusercontent.com/82094951/143829563-a9d2f10d-de74-40f7-b62a-73f7e065394a.jpg)

### Step 7: Creation of binding definition along with service binding for defining the entities to expose and protocol used by the service respectively. Example- OData V2 - UI, OData V2 - WebAPI etc.
**Service Definition**
Service definition tells us which entity needs to be exposed. It is a projection of the data model and the related behavior to be exposed. To create a service definition, **right click your Package->New->other ABAP Repository Object->Business Service->Service Definition**.

![5 17](https://user-images.githubusercontent.com/82094951/143832649-558d07a9-16f6-43ec-85e8-1040c4ad98a3.jpg)

Provide a name and description for it and select the 'Exposed Entity' by clicking on 'Browse'. Once this is done, **click on Next→ Finish**. Here, we are selecting the consumption view for Manager HR.
![5 18](https://user-images.githubusercontent.com/82094951/143832718-72202586-6311-469f-a1d0-9806f19fb87b.jpg)

Now that we have implemented the methods for all the business logic, we will implement additional resources which are required to raise error messages. For this we will be implementing the class ZCM_RAP_E2E and Message class ZRAP_E2E_MSG.

![5 19](https://user-images.githubusercontent.com/82094951/143832857-bf3fa2ec-a4cd-403e-85cc-e6a23f25a0c1.jpg)

In the same way, service definition for manager can also be created.
![5 21](https://user-images.githubusercontent.com/82094951/143833385-07184e5a-5aaa-4795-ad40-c5c47415ed16.jpg)
![5 20](https://user-images.githubusercontent.com/82094951/143833396-c7732f32-14e6-4764-8e90-bc5fe8c01786.jpg)

Once you've created the service definition, you also need to bind it and for this task, we will implement Service Binding.
For this, **right click on 'Business Services' folder** under which you just created service definition and **click on New>Service Binding**.

![5 22](https://user-images.githubusercontent.com/82094951/143839484-f35703ad-2d30-4c1e-9361-ee27c309979b.jpg)

After this, provide the name and description for this service binding. The next part here is to choose the Binding Type and Service Definition for which Service Binding is being created. So, we choose **'OData V2 - UI'** as the binding type and since we are creating this binding for ZUI_RAP_E2E_AEMP_M service definition, hence we select the same from the **'Browse' option**.

![5 23](https://user-images.githubusercontent.com/82094951/143839592-ba685f38-002c-48e3-a503-20dba618ae86.jpg)

**Click on Next and choose the appropriate transport request and click on Finish**. You will see a screen stating that the Service Binding is made.

### Step 8: Publish the service

Now you need to activate it and then click on 'Publish local service endpoint' to publish it. This will allow you to see the preview of the OData V2 - UI service in the form of a fiori UI.

![5 24](https://user-images.githubusercontent.com/82094951/143839938-d5364584-a299-4c05-8dd6-c0cbf3060eb9.jpg)

After it is published, you will be able to see its components and **by selecting the component and clicking on 'Preview'**, you'll be taken to the UI for that selected element.

![5 25](https://user-images.githubusercontent.com/82094951/143840022-b5bf30ef-f7a6-4d48-ae28-da6d54b30a20.jpg)

Likewise, you need to create one more service binding for the HR service.

![5 28](https://user-images.githubusercontent.com/82094951/144221413-6044c062-e649-4c78-8315-f097198bc35c.jpg)

Now, publish this service binding and you'll be able to see the Preview button getting enabled.

![5 29](https://user-images.githubusercontent.com/82094951/144221571-fbe5fd89-1be3-40dd-822b-629e5bc77ebd.jpg)


### Final outcome for HR
![5 30](https://user-images.githubusercontent.com/82094951/144222704-865cd7c3-6323-4fca-be66-2bc963f6d4f1.gif)

### Final outcome for HR Manager
![5 31](https://user-images.githubusercontent.com/82094951/144222795-73e0ec7d-1a75-439c-b7f2-62de1a780f37.gif)
