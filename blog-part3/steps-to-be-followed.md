## Steps to be covered here
3. **Creation of a CDS interface view for creating a basic view without any extensive information which can be used by various services.**
4. **reation of a CDS Projection view exposing a subset element of CDS interface view. It is service agnostic.**

#### Note: There will be three interface views, one for each table, and two projection views, one for the HR and other for HR Manager.

Let us now begin the development of the aforementioned steps.

3. Creation of CDS interface views

3.1. Interface View for table ZRAP_E2E_AEMP

Right click on the package created and go to New → Other ABAP Repository Object
![step1](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b0959e5f-2566-4954-8e3e-66837b4eacb9/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211026T055052Z&X-Amz-Expires=86400&X-Amz-Signature=7831dc647ddf19a84180e5920af1323d719dd7711110157a77d2a90f9c4a5d95&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

Look for Core Data Services and choose Data Definition. Click on Next
![cds-dd](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/515da790-54ac-42b7-934b-3ea8e42c4772/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211026T055200Z&X-Amz-Expires=86400&X-Amz-Signature=2c9a890992b88db60529450d54b09a955a93848f1518cb3da4f112dc3c88cf48&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

Give appropriate name and description for the interface view and click on Next → Finish.
![name](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/8802f373-d553-414f-891e-302019ffeb3e/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211026T055314Z&X-Amz-Expires=86400&X-Amz-Signature=424f19428c95ff62c541a7df9d6cdcc16efb4bfb6332a34c769b05c4e5b48c13&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

You will get an outline for this interface view and can enter the below code for it.
![code](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/4d613195-4751-4e47-9d1e-b9a957aa74fe/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211026T055419Z&X-Amz-Expires=86400&X-Amz-Signature=7046757818d6e90aad31cf2ffcc1f1492c2481711752caa5f4d16c851b8ca0ae&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)


3.2. Interface View for table ZRAP_E2E_AEMPL

Follow first two steps as it is and then enter as below:

Give appropriate name and description for the interface view and click on Next → Finish.
![interface_name](https://user-images.githubusercontent.com/82094951/138819894-9802de3b-69f6-448f-b8de-b4aad27021db.png)

You will get an outline for this interface view and can enter the below code for it.
![Interface_ZRAP_E2E_AEMPL](https://user-images.githubusercontent.com/82094951/138818699-de241a52-b618-4e42-aed2-f955855d11cc.png)

3.3 Interface view for table ZRAP_E2E_APOS

Give appropriate name and description for the interface view and click on Next → Finish.
![interface_name3](https://user-images.githubusercontent.com/82094951/138820095-4e44fe7e-66b9-48b3-9820-5398d7309d25.png)


You will get an outline for this interface view and can enter the below code for it.
![interface_ZRAP_E2E_APOS](https://user-images.githubusercontent.com/82094951/138819492-a4aaae52-4f0a-48c3-afc3-fc1ab751e687.png)


4. Right click on the package created and go to New → Other ABAP Repository Object
 
This is the projection view for interface ZI_RAP_E2E_AEMP

![step1](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/b0959e5f-2566-4954-8e3e-66837b4eacb9/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211026T055052Z&X-Amz-Expires=86400&X-Amz-Signature=7831dc647ddf19a84180e5920af1323d719dd7711110157a77d2a90f9c4a5d95&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

Look for Core Data Services and choose Data Definition. Click on Next
![cds-dd](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/515da790-54ac-42b7-934b-3ea8e42c4772/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211026T055200Z&X-Amz-Expires=86400&X-Amz-Signature=2c9a890992b88db60529450d54b09a955a93848f1518cb3da4f112dc3c88cf48&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)


4.1 Give appropriate name and description for the projection view and click on Next
![pv_name](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/aa05d7a8-5cec-4828-8b84-f4df4a8a04e5/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211026T063435Z&X-Amz-Expires=86400&X-Amz-Signature=235db673cfec119bc310050595e54eab9f248a674f2f18d5a392d9b71bf55087&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

Select a TR and go to the next step and choose 'Define Projection View' → Finish
![outline](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/3fe3bd78-96cd-4594-adfa-a11650b1056e/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211026T063442Z&X-Amz-Expires=86400&X-Amz-Signature=e8bf1e5f103b0b6e78c5833c17357056082dbe09748b8bff48b664ed2fc7f673&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)

For the final part, add the below code for projection view
![code](https://s3.us-west-2.amazonaws.com/secure.notion-static.com/09492785-42ec-4a1a-8ebd-ec63c60ba38a/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20211026%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20211026T063447Z&X-Amz-Expires=86400&X-Amz-Signature=e4091e8b60fc4a1656f959e80489db73043e1fb2fe60b3f45b7971d4c33d78cb&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22)


4.2 First two steps again remain the same. Follow the below steps for creation of second projection view which is for interface ZI_RAP_E2E_AEMPL. 

Give appropriate name and description for the projection view and click on next.
![proj_name](https://user-images.githubusercontent.com/82094951/138823033-7d7229ca-e7ab-47cd-8599-1dfd797417b1.png)


You will get an outline for this interface view and can enter the below code for it.
![proj_AEMPL](https://user-images.githubusercontent.com/82094951/138822551-4111e5b7-fba5-4d2e-ae9f-7ebb75e6c311.png)

