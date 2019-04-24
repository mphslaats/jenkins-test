# Jenkins Test
The Jenkins Test application is an application to test Jenkins pipelines with a simple Java Maven project.

## Installation
This application runs on Payara.

### Payara
Payara can be downloaded [here](https://www.payara.fish/software/downloads/). After downloading Payara you have to extract it and add it to your preferred IDE.  

#### Known issues  
Payara has a known issue with it's threads, more information can be found [here](https://github.com/payara/Payara/issues/3495).  
To resolve this issue, you have to add run the following command in the `glassfish/bin` folder of payara:
```bash
./asadmin set-payara-executor-service-configuration --threadpoolexecutorqueuesize 1000
```

You can also set it manually by editing the `domain.xml` in your desired domain:
```xml
<config name="server-config">
	...		
    <payara-executor-service-configuration thread-pool-executor-queue-size="1000"></payara-executor-service-configuration>
```

## Setup
This application requires a properties file, this properties file includes the sensitive information like passwords etc.  
Rename `src/main/resources/FillMe.properties` to `src/main/resources/helloworld.properties`, open it and fill add your configuration.  
```properties
# NOTE: Debug purposes
skipTests: false

# Payara
payara.hostname:
payara.username:
payara.password:

# urls
baseurl: http://example.com
contextroot: helloworld
```

## Usage
Whenever you run this application, the following end-points become available:
* `<Your URL>/helloworld`: Contains a Hello World end point to show the application is working.