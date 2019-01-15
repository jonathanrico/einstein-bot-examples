public with sharing class TrustInstanceStatusResult {

    private String key;
    private String location;
    private String environment;
    private String releaseVersion;
    private String releaseNumber;
    private String status;
    private Boolean isActive;

    public TrustInstanceStatusResult(String key, String location, String environment, String releaseVersion, String releaseNumber, String status, Boolean isActive) {
        this.key = key;
        this.location = location;
        this.environment = environment;
        this.releaseVersion = releaseVersion;
        this.releaseNumber = releaseNumber;
        this.status = status;
        this.isActive = isActive;
    }

    public String getKey(){
        return this.key;
    }

    public String getLocation(){
        return this.location;
    }

    public String getEnvironment(){
        return this.environment;
    }

    public String getReleaseVersion(){
        return this.releaseVersion;
    }

    public String getReleaseNumber(){
        return this.releaseNumber;
    }

    public String getStatus(){
        return this.status;
    }

    public Boolean getIsActive(){
        return this.isActive;
    }

    public String getSummary(){
        List<String> summaryRows = new List<String>();
        summaryRows.add('Instance : '+this.key);
        summaryRows.add('Status : '+this.status);
        summaryRows.add('Location : '+this.location);
        summaryRows.add('Environment : '+this.environment);
        summaryRows.add('Release Version : '+this.releaseVersion);
        summaryRows.add('Release Number : '+this.releaseNumber);
        summaryRows.add('Is Active : '+(this.isActive ? 'Yes' : 'No'));
        return String.join(summaryRows, '\n');
    }
    
}