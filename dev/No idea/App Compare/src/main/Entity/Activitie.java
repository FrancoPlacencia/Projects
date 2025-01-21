package Entity;

public class Activitie {
    private String activityId;
    private String activityStatus;
    private String activityType;
    private StringBuilder activityXml;
    private String approvalId;
    private String days;
    private String description;
    private String descriptionId;
    private String displayColor;
    private String dueDate;
	private String forceCompletionOnSlaExpire;
	private String hours;
	private String linearResponseSla;
    private String minutes;
    private String multitask;
    private String name;
    private String processId;
    private String responseEscalate;
    private String skipSla;
    private String slid;
    private String statusId;

    @Override
    public String toString() {
        return "-- SQL [" + name + "]\n" +
                activityXml + "\n";
    }

    public String toString2() {
        return "Activitie{" +
                "activityId='" + activityId + '\'' +
                ", activityStatus='" + activityStatus + '\'' +
                ", activityType='" + activityType + '\'' +
                ", activityXml='" + activityXml + '\'' +
                ", approvalId='" + approvalId + '\'' +
                ", days='" + days + '\'' +
                ", description='" + description + '\'' +
                ", descriptionId='" + descriptionId + '\'' +
                ", displayColor='" + displayColor + '\'' +
                ", dueDate='" + dueDate + '\'' +
                ", forceCompletionOnSlaExpire='" + forceCompletionOnSlaExpire + '\'' +
                ", hours='" + hours + '\'' +
                ", linearResponseSla='" + linearResponseSla + '\'' +
                ", minutes='" + minutes + '\'' +
                ", multitask='" + multitask + '\'' +
                ", name='" + name + '\'' +
                ", processId='" + processId + '\'' +
                ", responseEscalate='" + responseEscalate + '\'' +
                ", skipSla='" + skipSla + '\'' +
                ", slid='" + slid + '\'' +
                ", statusId='" + statusId + '\'' +
                '}';
    }

    public String getActivityId() {
        return activityId;
    }

    public void setActivityId(String activityId) {
        this.activityId = activityId;
    }

    public String getActivityStatus() {
        return activityStatus;
    }

    public void setActivityStatus(String activityStatus) {
        this.activityStatus = activityStatus;
    }

    public String getActivityType() {
        return activityType;
    }

    public void setActivityType(String activityType) {
        this.activityType = activityType;
    }

    public StringBuilder getActivityXml() {
        return activityXml;
    }

    public void setActivityXml(StringBuilder activityXml) {
        this.activityXml = activityXml;
                //.replaceAll("<\\?xml version=\"1.0\" encoding=\"ISO-8859-1\"\\?><Params><sql value=\"", "");
    }

    public String getApprovalId() {
        return approvalId;
    }

    public void setApprovalId(String approvalId) {
        this.approvalId = approvalId;
    }

    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDescriptionId() {
        return descriptionId;
    }

    public void setDescriptionId(String descriptionId) {
        this.descriptionId = descriptionId;
    }

    public String getDisplayColor() {
        return displayColor;
    }

    public void setDisplayColor(String displayColor) {
        this.displayColor = displayColor;
    }

    public String getDueDate() {
        return dueDate;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    public String getForceCompletionOnSlaExpire() {
        return forceCompletionOnSlaExpire;
    }

    public void setForceCompletionOnSlaExpire(String forceCompletionOnSlaExpire) {
        this.forceCompletionOnSlaExpire = forceCompletionOnSlaExpire;
    }

    public String getHours() {
        return hours;
    }

    public void setHours(String hours) {
        this.hours = hours;
    }

    public String getLinearResponseSla() {
        return linearResponseSla;
    }

    public void setLinearResponseSla(String linearResponseSla) {
        this.linearResponseSla = linearResponseSla;
    }

    public String getMinutes() {
        return minutes;
    }

    public void setMinutes(String minutes) {
        this.minutes = minutes;
    }

    public String getMultitask() {
        return multitask;
    }

    public void setMultitask(String multitask) {
        this.multitask = multitask;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProcessId() {
        return processId;
    }

    public void setProcessId(String processId) {
        this.processId = processId;
    }

    public String getResponseEscalate() {
        return responseEscalate;
    }

    public void setResponseEscalate(String responseEscalate) {
        this.responseEscalate = responseEscalate;
    }

    public String getSkipSla() {
        return skipSla;
    }

    public void setSkipSla(String skipSla) {
        this.skipSla = skipSla;
    }

    public String getSlid() {
        return slid;
    }

    public void setSlid(String slid) {
        this.slid = slid;
    }

    public String getStatusId() {
        return statusId;
    }

    public void setStatusId(String statusId) {
        this.statusId = statusId;
    }
}
