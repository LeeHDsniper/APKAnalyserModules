.class public final Lcom/adobe/creativesdk/aviary/internal/cds/CdsService;
.super Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;
.source "CdsService.java"


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 35
    const-string v0, "CdsService"

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;-><init>(Ljava/lang/String;)V

    .line 36
    return-void
.end method


# virtual methods
.method public bridge synthetic getThreadPool()Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;
    .registers 2

    .prologue
    .line 33
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->getThreadPool()Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic onCreate()V
    .registers 1

    .prologue
    .line 33
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsServiceAbstract;->onCreate()V

    return-void
.end method

.method protected sendDeveloperError(I)V
    .registers 16
    .param p1, "errorCode"    # I

    .prologue
    const/4 v13, 0x0

    .line 40
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v10, "sendDeveloperError: %d"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v13

    invoke-interface {v7, v10, v11}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 41
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/CdsService;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    .line 42
    .local v2, "context":Landroid/content/Context;
    const/4 v4, 0x0

    .line 43
    .local v4, "errorTitle":Ljava/lang/String;
    const/4 v3, 0x0

    .line 45
    .local v3, "errorMessage":Ljava/lang/String;
    const/16 v7, 0x193

    if-ne p1, v7, :cond_1f

    .line 46
    const-string v4, "Invalid API Key and Secret."

    .line 47
    const-string v3, "Please check to make sure you have correctly entered your API key and secret."

    .line 50
    :cond_1f
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_2b

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_44

    .line 51
    :cond_2b
    sget-object v7, Lcom/adobe/creativesdk/aviary/internal/cds/CdsService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Ops. Something went wrong. We received an errorCode: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v10}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 69
    :goto_43
    return-void

    .line 55
    :cond_44
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, "\n"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->printDeveloperError(Ljava/lang/String;)V

    .line 59
    new-instance v5, Landroid/content/Intent;

    const-string v7, "aviary.intent.action.ALERT"

    invoke-direct {v5, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 60
    .local v5, "intent1":Landroid/content/Intent;
    const-string v7, "android.intent.extra.TITLE"

    invoke-virtual {v5, v7, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 61
    const-string v7, "android.intent.extra.TEXT"

    invoke-virtual {v5, v7, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 63
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 64
    .local v1, "cal":Ljava/util/Calendar;
    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v8

    .line 65
    .local v8, "tim1":J
    new-instance v7, Ljava/util/Date;

    const-wide/16 v10, 0x7d0

    add-long/2addr v10, v8

    invoke-direct {v7, v10, v11}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v7}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 66
    const/high16 v7, 0x8000000

    invoke-static {v2, v13, v5, v7}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    .line 67
    .local v6, "sender":Landroid/app/PendingIntent;
    const-string v7, "alarm"

    invoke-virtual {v2, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 68
    .local v0, "am":Landroid/app/AlarmManager;
    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v10

    invoke-virtual {v0, v13, v10, v11, v6}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    goto :goto_43
.end method
