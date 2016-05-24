.class public abstract Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;
.super Ljava/lang/Object;
.source "AdobePushNotification.java"


# instance fields
.field private adobeID:Ljava/lang/String;

.field private displayName:Ljava/lang/String;

.field private firstName:Ljava/lang/String;

.field private formattingData:J

.field private formattingNeeded:Z

.field private lastName:Ljava/lang/String;

.field private lastTimeStamp:J

.field private local_state:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

.field private needToRecalculate:Z

.field private notificationID:Ljava/lang/String;

.field private notificationType:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

.field private region:Ljava/lang/String;

.field private resourceName:Ljava/lang/String;

.field private resourceURL:Ljava/lang/String;

.field private server_state:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

.field private timeRemainingForNextChange:J

.field private timeStampMessage:I

.field private timestamp:J


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->needToRecalculate:Z

    return-void
.end method

.method private getDiffInMinutes(J)J
    .registers 8
    .param p1, "newTimeStamp"    # J

    .prologue
    .line 43
    iget-wide v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->lastTimeStamp:J

    sub-long v0, p1, v2

    .line 44
    .local v0, "diffInMiutes":J
    const-wide/32 v2, 0xea60

    div-long/2addr v0, v2

    .line 45
    return-wide v0
.end method

.method private setTimeStampString(J)V
    .registers 16
    .param p1, "timeNow"    # J

    .prologue
    .line 61
    iput-wide p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->lastTimeStamp:J

    .line 62
    iget-wide v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->lastTimeStamp:J

    iget-wide v10, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timestamp:J

    sub-long/2addr v8, v10

    const-wide/32 v10, 0xea60

    div-long v0, v8, v10

    .line 63
    .local v0, "ageInMinutes":J
    const-wide/16 v8, 0x1

    cmp-long v8, v0, v8

    if-gtz v8, :cond_21

    .line 64
    sget v8, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_notification_activity_timestamp_less_than_minute:I

    iput v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timeStampMessage:I

    .line 65
    const-wide/16 v8, 0x1

    iput-wide v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timeRemainingForNextChange:J

    .line 66
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->formattingNeeded:Z

    .line 67
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->needToRecalculate:Z

    .line 111
    :goto_20
    return-void

    .line 68
    :cond_21
    const-wide/16 v8, 0x3c

    cmp-long v8, v0, v8

    if-gez v8, :cond_39

    .line 69
    sget v8, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_notification_activity_timestamp_minute:I

    iput v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timeStampMessage:I

    .line 70
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->formattingNeeded:Z

    .line 71
    iput-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->formattingData:J

    .line 72
    const-wide/16 v8, 0x3c

    sub-long/2addr v8, v0

    iput-wide v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timeRemainingForNextChange:J

    .line 73
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->needToRecalculate:Z

    goto :goto_20

    .line 74
    :cond_39
    const-wide/16 v8, 0x78

    cmp-long v8, v0, v8

    if-gez v8, :cond_4f

    .line 75
    sget v8, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_notification_activity_timestamp_hour_single:I

    iput v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timeStampMessage:I

    .line 76
    const-wide/16 v8, 0x78

    sub-long/2addr v8, v0

    iput-wide v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timeRemainingForNextChange:J

    .line 77
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->formattingNeeded:Z

    .line 78
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->needToRecalculate:Z

    goto :goto_20

    .line 80
    :cond_4f
    const-wide/16 v8, 0x3c

    div-long v4, v0, v8

    .line 81
    .local v4, "hours":J
    const-wide/16 v8, 0x18

    div-long v2, v4, v8

    .line 82
    .local v2, "days":J
    const-wide/16 v8, 0x16d

    div-long v6, v2, v8

    .line 83
    .local v6, "years":J
    const-wide/16 v8, 0x18

    cmp-long v8, v4, v8

    if-gez v8, :cond_77

    .line 84
    sget v8, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_notification_activity_timestamp_hours_multiple:I

    iput v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timeStampMessage:I

    .line 85
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->formattingNeeded:Z

    .line 86
    iput-wide v4, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->formattingData:J

    .line 87
    const-wide/16 v8, 0x3c

    const-wide/16 v10, 0x1

    add-long/2addr v10, v4

    mul-long/2addr v8, v10

    sub-long/2addr v8, v0

    iput-wide v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timeRemainingForNextChange:J

    .line 88
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->needToRecalculate:Z

    goto :goto_20

    .line 89
    :cond_77
    const-wide/16 v8, 0x2

    cmp-long v8, v2, v8

    if-gez v8, :cond_88

    .line 90
    sget v8, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_notification_activity_timestamp_day_single:I

    iput v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timeStampMessage:I

    .line 91
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->formattingNeeded:Z

    .line 92
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->needToRecalculate:Z

    goto :goto_20

    .line 93
    :cond_88
    const-wide/16 v8, 0x16d

    cmp-long v8, v2, v8

    if-gez v8, :cond_9b

    .line 94
    sget v8, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_notification_activity_timestamp_days_multiple:I

    iput v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timeStampMessage:I

    .line 95
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->formattingNeeded:Z

    .line 96
    iput-wide v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->formattingData:J

    .line 97
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->needToRecalculate:Z

    goto :goto_20

    .line 98
    :cond_9b
    const-wide/16 v8, 0x2

    cmp-long v8, v6, v8

    if-gez v8, :cond_ad

    .line 99
    sget v8, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_notification_activity_timestamp_year_single:I

    iput v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timeStampMessage:I

    .line 100
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->formattingNeeded:Z

    .line 101
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->needToRecalculate:Z

    goto/16 :goto_20

    .line 103
    :cond_ad
    sget v8, Lcom/adobe/creativesdk/foundation/assets/R$string;->adobe_notification_activity_timestamp_year_multiple:I

    iput v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timeStampMessage:I

    .line 104
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->formattingNeeded:Z

    .line 105
    iput-wide v6, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->formattingData:J

    .line 106
    const/4 v8, 0x0

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->needToRecalculate:Z

    goto/16 :goto_20
.end method


# virtual methods
.method public getAdobeID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 154
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->adobeID:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 202
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getFirstName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->firstName:Ljava/lang/String;

    return-object v0
.end method

.method public getLastName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->lastName:Ljava/lang/String;

    return-object v0
.end method

.method public getLocalState()Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;
    .registers 2

    .prologue
    .line 162
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->local_state:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    return-object v0
.end method

.method public getNotificationID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 186
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->notificationID:Ljava/lang/String;

    return-object v0
.end method

.method public getNotificationType()Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->notificationType:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    return-object v0
.end method

.method public getRegion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 218
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->region:Ljava/lang/String;

    return-object v0
.end method

.method public getResourceName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 33
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->resourceName:Ljava/lang/String;

    return-object v0
.end method

.method public getResourceURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 210
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->resourceURL:Ljava/lang/String;

    return-object v0
.end method

.method public getTimestamp()J
    .registers 3

    .prologue
    .line 178
    iget-wide v0, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timestamp:J

    return-wide v0
.end method

.method public recalculateTimeStampMessage(J)V
    .registers 8
    .param p1, "timeNow"    # J

    .prologue
    .line 37
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->getDiffInMinutes(J)J

    move-result-wide v0

    .line 38
    .local v0, "timeExpired":J
    iget-boolean v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->needToRecalculate:Z

    const/4 v3, 0x1

    if-ne v2, v3, :cond_12

    iget-wide v2, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timeRemainingForNextChange:J

    cmp-long v2, v0, v2

    if-lez v2, :cond_12

    .line 39
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->setTimeStampString(J)V

    .line 40
    :cond_12
    return-void
.end method

.method public setAdobeID(Ljava/lang/String;)V
    .registers 2
    .param p1, "avatarAdobeID"    # Ljava/lang/String;

    .prologue
    .line 158
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->adobeID:Ljava/lang/String;

    .line 159
    return-void
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .registers 2
    .param p1, "displayName"    # Ljava/lang/String;

    .prologue
    .line 206
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->displayName:Ljava/lang/String;

    .line 207
    return-void
.end method

.method public setFirstName(Ljava/lang/String;)V
    .registers 2
    .param p1, "firstName"    # Ljava/lang/String;

    .prologue
    .line 142
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->firstName:Ljava/lang/String;

    .line 143
    return-void
.end method

.method public setLastName(Ljava/lang/String;)V
    .registers 2
    .param p1, "lastName"    # Ljava/lang/String;

    .prologue
    .line 150
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->lastName:Ljava/lang/String;

    .line 151
    return-void
.end method

.method public setLocalState(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;)V
    .registers 2
    .param p1, "state"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    .prologue
    .line 166
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->local_state:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    .line 167
    return-void
.end method

.method public setNotificationID(Ljava/lang/String;)V
    .registers 2
    .param p1, "notificationID"    # Ljava/lang/String;

    .prologue
    .line 190
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->notificationID:Ljava/lang/String;

    .line 191
    return-void
.end method

.method public setNotificationType(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;)V
    .registers 2
    .param p1, "notificationType"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    .prologue
    .line 134
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->notificationType:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationSubType;

    .line 135
    return-void
.end method

.method public setRegion(Ljava/lang/String;)V
    .registers 2
    .param p1, "region"    # Ljava/lang/String;

    .prologue
    .line 222
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->region:Ljava/lang/String;

    .line 223
    return-void
.end method

.method public setResourceName(Ljava/lang/String;)V
    .registers 2
    .param p1, "resourceName"    # Ljava/lang/String;

    .prologue
    .line 126
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->resourceName:Ljava/lang/String;

    .line 127
    return-void
.end method

.method public setResourceURL(Ljava/lang/String;)V
    .registers 2
    .param p1, "resourceURL"    # Ljava/lang/String;

    .prologue
    .line 214
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->resourceURL:Ljava/lang/String;

    .line 215
    return-void
.end method

.method public setServerState(Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;)V
    .registers 2
    .param p1, "state"    # Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    .prologue
    .line 170
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->server_state:Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotificationState;

    .line 171
    return-void
.end method

.method public setTimestamp(J)V
    .registers 4
    .param p1, "timestamp"    # J

    .prologue
    .line 182
    iput-wide p1, p0, Lcom/adobe/creativesdk/foundation/internal/PushNotification/model/AdobePushNotification;->timestamp:J

    .line 183
    return-void
.end method
