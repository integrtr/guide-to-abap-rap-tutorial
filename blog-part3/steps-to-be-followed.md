## Steps to be covered here
3. **Creation of a CDS interface view for creating a basic view without any extensive information which can be used by various services.**
4. **reation of a CDS Projection view exposing a subset element of CDS interface view. It is service agnostic.**

#### Note: There will be three interface views, one for each table, and two projection views, one for the HR and other for HR Manager.

Let us now begin the development of the aforementioned steps.

3. Creation of CDS interface views

3.1. Interface View for table ZRAP_E2E_AEMP

Right click on the package created and go to New → Other ABAP Repository Object
![3 1](https://user-images.githubusercontent.com/82094951/141247457-3affb7b0-7f47-4042-bddc-84be129a6110.jpg)

Look for Core Data Services and choose Data Definition. Click on Next
![3 2](https://user-images.githubusercontent.com/82094951/141247493-516a24dd-5f97-4daf-afa5-542f0ae2e843.jpg)

Give appropriate name and description for the interface view and click on Next → Finish.
![3 3](https://user-images.githubusercontent.com/82094951/141247519-84d82a5a-5583-4b63-8dd0-45b27dbefe52.jpg)

You will get an outline for this interface view and can enter the below code for it.
![3 4](https://user-images.githubusercontent.com/82094951/141247622-555978ba-f303-4f7e-aa8f-a01d50b51036.jpg)


3.2. Interface View for table ZRAP_E2E_AEMPL

Follow first two steps as it is and then enter as below:

Give appropriate name and description for the interface view and click on Next → Finish.
![3 10](https://user-images.githubusercontent.com/82094951/141248186-8939eae9-0b77-4168-a184-90c638eef7d8.jpg)

You will get an outline for this interface view and can enter the below code for it.
![3 11](https://user-images.githubusercontent.com/82094951/141248284-e12e60fe-df32-4ea3-b436-2818ccc87f48.jpg)

3.3 Interface view for table ZRAP_E2E_APOS

Give appropriate name and description for the interface view and click on Next → Finish.
![3 12](https://user-images.githubusercontent.com/82094951/141248419-806d692c-172f-4214-ae1f-ba8c452f5bc5.jpg)


You will get an outline for this interface view and can enter the below code for it.
![3 13](https://user-images.githubusercontent.com/82094951/141248494-39a5b857-2ef5-44b5-8db3-55add3d4488f.jpg)


4. For the projection view for interface ZI_RAP_E2E_AEMP. 

Look for Core Data Services and choose Data Definition. Click on Next

4.1 Give appropriate name and description for the projection view and click on Next
![3 14](https://user-images.githubusercontent.com/82094951/141249059-2e517c00-fff4-482a-94f7-7e2c3463d866.jpg)

Select a TR and go to the next step and choose 'Define Projection View' → Finish
![3 15](https://user-images.githubusercontent.com/82094951/141249205-4d5c0129-96c1-4e84-9551-bbf338008e1b.jpg)

For the final part, add the below code for projection view
![3 16](https://user-images.githubusercontent.com/82094951/141249293-5d44d9dc-95e4-4851-8bf6-5627c31acad0.jpg)

4.2 First two steps again remain the same. Follow the below steps for creation of second projection view which is for interface ZI_RAP_E2E_AEMPL. 

Give appropriate name and description for the projection view and click on next.
![3 17](https://user-images.githubusercontent.com/82094951/141249431-228639c6-340f-4fd6-aa7e-0cae1c3aa1b2.jpg)


You will get an outline for this interface view and can enter the below code for it.
![3 18](https://user-images.githubusercontent.com/82094951/141249519-a427a96d-6766-477b-9fdc-f771329b9b45.jpg)

