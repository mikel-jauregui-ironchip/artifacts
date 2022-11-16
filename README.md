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
        maven { url 'https://jitpack.io' }
        ...
    }
}
```

Then, inside the *gradle.build* file, add the dependency to the sdk.
``` gradle

dependencies {
    ...
    implementation 'com.github.mikel-jauregui-ironchip:artifacts:1.2.0'
    ...
}

```

### Permissions
This library require the permissions:

``` xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

<uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
<uses-permission android:name="android.permission.CHANGE_WIFI_STATE" />

<uses-permission android:name="android.permission.INTERNET" />
```


## Usage

```java
import com.ironchip.ironchiplbfraudandroidsdk.LBFraudAndroid;
...

// Replace APIKEY with the desired generated api key.
LBFraudAndroid fraud = new LBFraudAndroid(this, "APIKEY");
// In case you desire to target a diferent enviroment:
// LBFraudAndroid fraud = new LBFraudAndroid(this, "APIKEY", host);

String transactionID = "random_identifier_generated"; // Transaction identifier request for fraud results
String userID = "john.doe@gmail.com"; // User identifier

Map<String, Object> extraData = new HashMap<>(); // Extra information for analysis
extraData.put("concept", "Book august");
extraData.put("amount", new Integer(30));
extraData.put("operation", "booking");

// The sendTransaction can be provided with 2 callbacks, one is executed when the transaction is finished
// and the other one is called in case an error did occure during the transaction process.
fraud.sendTransaction(transactionID, userID, extraData, () -> {
        // Add here any code you want to be executed after the transaction
        // has finished.
    }, exception -> {
        // Add here any code you want to perform in case of an error
        // during the transaction.
        // exception.printStackTrace()
});
```
