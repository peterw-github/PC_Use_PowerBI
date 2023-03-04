# PC Usage Dashboard
I've created a live dashboard, that features basic hardware utilisation data of my PC, in real time.


<br>
<br>
<br>




## Walkthrough

I collected data on both CPU utilisation, and Memory utilisation, for my computer, via a PowerShell script. As the script runs, it stores the current datetime, as 
well as CPU & Memory usage, inside a payload, which is then transmitted to a dataset on PowerBI's web application, via their API. A transmission occurs every few 
seconds, and the dashboard built off of that dataset, is continuously updated in real time, to reflect the current status of my PC (or at least to the nearest
few seconds).

<br>
<br>
<br>


## Dashboard
A video of the dashboard working in real time, is available here: <br><br>
[<img alt="YouTube Walkthrough" width="700" height=400 src="./Images&Video/Video_PreviewImage.PNG" />](https://youtu.be/KLuV2aJx-sc)

<br>

A preview of the report, that the dashboard relied on for elements, is here: <br><br>
![Image Of PC Usage Report](https://github.com/peterw-github/PC_Use_PowerBI/blob/main/Images%26Video/PC_Usage_Report.JPG)

The file of the report, is available here: <br>
https://github.com/peterw-github/PC_Use_PowerBI/blob/main/PC_Usage_Report.pbix
