# LBFraud-SDK-Android

## Setup

### Suported versions
| Platform | Suported versions |
| --- | --- |
| Android | 5.0.0+ |
    
<br>

### Add Ironchip Location Based Fraud SDK

<br>

#### Add our library in other projects

First, on the *setting.gradle* file, reference the remote repository where the library is located. 
``` gradle
dependencyResolutionManagement {
    ...

    repositories {
        maven {
            url "https://nexus6.kydom.net/repository/public-libraries/"
        }
        ...
    }
}
```

Then, inside the *gradle.build* file, add the dependency to the sdk.
``` gradle

dependencies {
    ...
    implementation "com.ironchip:lbfraudandroidsdk:1.0.0"
    ...
}

```

### Permissions
This library require the permissions:

``` xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />

<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.CHANGE_WIFI_STATE" />

<uses-permission android:name="android.permission.INTERNET" />
```


## Usage

```java
import com.ironchip.ironchiplbfraudandroidsdk.LBFraudAndroid;
...

// In order to use this library, the ACCESS_COARSE_LOCATION and ACCESS_FINE_LOCATION need to be granted.
LBFraudAndroid fraud = new LBFraudAndroid(getBaseContext(), "APIKEY");
// In case you desire to target a diferent enviroment:
// LBFraudAndroid fraud = new LBFraudAndroid(getBaseContext(), "APIKEY", host);

String transactionID = "random_identifier_generated"; // Transaction identifier request for fraud results
String userID = "john.doe@gmail.com"; // User identifier

Map<String, Object> extraData = new HashMap<>(); // Extra information for analysis
extraData.put("concept", "Book august");
extraData.put("amount", new Integer(30));
extraData.put("operation", "booking");

// The sendTransaction can be provided with 2 callbacks, one is performed when the transaction is finished
// and the other one is called in case an error did occure during the transaction process.
// In case of not wanting to make use of those callback feel free to use:
// sendTransaction(String transactionID, String userID, Map<String, Object> extraData)
// sendTransaction(String transactionID, String userID, Map<String, Object> extraData, Runnable onFinish)
// sendTransaction(String transactionID, String userID, Map<String, Object> extraData, ExceptionCallback exceptionCallback)
fraud.sendTransaction(transactionID, userID, extraData, () -> {
        // Add here any code you want to be executed after the transaction
        // has finished.
    }, exception -> {
        // Add here any code you want to perform in case of an error
        // during the transaction.
        // exception.printStackTrace()
});
// This method can also be provided with two aditional arguments. Those arguments set the maximum time that can lapse 
// since messurements from signal or gps location before becoming invalid. This values are se by default to the minimum 
// time recomended in order to ensure a proper functionality of the library, but can be increased to lower the battery consumption if desired.
// sendTransaction(String transactionID, String userID, Map<String, Object> extraData, Runnable onFinish, ExceptionCallback exceptionCallback, long gpsMaxValidTimeLapseMilliseconds, long wifiMaxValidTimeLapseMilliseconds)
```
