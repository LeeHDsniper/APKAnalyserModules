.class Lcom/localytics/android/AmpUploadHandler;
.super Lcom/localytics/android/UploadHandler;
.source "AmpUploadHandler.java"


# static fields
.field private static final PROJECTION_AMP_RULE_RECORD:[Ljava/lang/String;

.field private static final SELECTION_UPDATE_AMP_RULE:Ljava/lang/String;


# instance fields
.field private mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 50
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "version"

    aput-object v1, v0, v2

    sput-object v0, Lcom/localytics/android/AmpUploadHandler;->PROJECTION_AMP_RULE_RECORD:[Ljava/lang/String;

    .line 56
    const-string v0, "%s = ?"

    new-array v1, v2, [Ljava/lang/Object;

    const-string v2, "_id"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/AmpUploadHandler;->SELECTION_UPDATE_AMP_RULE:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;Landroid/os/Looper;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "sessionHandler"    # Landroid/os/Handler;
    .param p3, "apiKey"    # Ljava/lang/String;
    .param p4, "installId"    # Ljava/lang/String;
    .param p5, "looper"    # Landroid/os/Looper;

    .prologue
    .line 85
    invoke-direct/range {p0 .. p5}, Lcom/localytics/android/UploadHandler;-><init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;Ljava/lang/String;Landroid/os/Looper;)V

    .line 86
    return-void
.end method

.method static synthetic access$000()[Ljava/lang/String;
    .registers 1

    .prologue
    .line 35
    sget-object v0, Lcom/localytics/android/AmpUploadHandler;->PROJECTION_AMP_RULE_RECORD:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/localytics/android/AmpUploadHandler;Ljava/util/Map;)Landroid/content/ContentValues;
    .registers 3
    .param p0, "x0"    # Lcom/localytics/android/AmpUploadHandler;
    .param p1, "x1"    # Ljava/util/Map;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lcom/localytics/android/AmpUploadHandler;->parseAmpMessage(Ljava/util/Map;)Landroid/content/ContentValues;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .registers 1

    .prologue
    .line 35
    sget-object v0, Lcom/localytics/android/AmpUploadHandler;->SELECTION_UPDATE_AMP_RULE:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/localytics/android/AmpUploadHandler;JLjava/util/List;)V
    .registers 5
    .param p0, "x0"    # Lcom/localytics/android/AmpUploadHandler;
    .param p1, "x1"    # J
    .param p3, "x2"    # Ljava/util/List;

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Lcom/localytics/android/AmpUploadHandler;->saveAmpConditions(JLjava/util/List;)V

    return-void
.end method

.method static synthetic access$400(Lcom/localytics/android/AmpUploadHandler;JLjava/util/List;)V
    .registers 5
    .param p0, "x0"    # Lcom/localytics/android/AmpUploadHandler;
    .param p1, "x1"    # J
    .param p3, "x2"    # Ljava/util/List;

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Lcom/localytics/android/AmpUploadHandler;->bindRuleToEvents(JLjava/util/List;)V

    return-void
.end method

.method private bindRuleToEvents(JLjava/util/List;)V
    .registers 15
    .param p1, "ruleId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "eventNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 197
    iget-object v3, p0, Lcom/localytics/android/AmpUploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v4, "amp_ruleevent"

    const-string v5, "%s = ?"

    new-array v6, v9, [Ljava/lang/Object;

    const-string v7, "rule_id_ref"

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v3, v4, v5, v6}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 200
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_21
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_48

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 202
    .local v0, "eventName":Ljava/lang/String;
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 203
    .local v2, "values":Landroid/content/ContentValues;
    const-string v3, "event_name"

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    const-string v3, "rule_id_ref"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 205
    iget-object v3, p0, Lcom/localytics/android/AmpUploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v4, "amp_ruleevent"

    invoke-virtual {v3, v4, v2}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    goto :goto_21

    .line 207
    .end local v0    # "eventName":Ljava/lang/String;
    .end local v2    # "values":Landroid/content/ContentValues;
    :cond_48
    return-void
.end method

.method private enterWakeLock()V
    .registers 5

    .prologue
    .line 90
    iget-object v2, p0, Lcom/localytics/android/AmpUploadHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 91
    .local v0, "packageManager":Landroid/content/pm/PackageManager;
    const-string v2, "android.permission.WAKE_LOCK"

    iget-object v3, p0, Lcom/localytics/android/AmpUploadHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_4c

    .line 94
    iget-object v2, p0, Lcom/localytics/android/AmpUploadHandler;->mContext:Landroid/content/Context;

    const-string v3, "power"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/PowerManager;

    .line 95
    .local v1, "pm":Landroid/os/PowerManager;
    const/4 v2, 0x1

    const-string v3, "UPLOAD_WAKE_LOCK"

    invoke-virtual {v1, v2, v3}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    iput-object v2, p0, Lcom/localytics/android/AmpUploadHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 96
    iget-object v2, p0, Lcom/localytics/android/AmpUploadHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 97
    iget-object v2, p0, Lcom/localytics/android/AmpUploadHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v2

    if-nez v2, :cond_40

    .line 99
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_3f

    .line 101
    const-string v2, "Localytics"

    const-string v3, "Localytics library failed to get wake lock"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .end local v1    # "pm":Landroid/os/PowerManager;
    :cond_3f
    :goto_3f
    return-void

    .line 104
    .restart local v1    # "pm":Landroid/os/PowerManager;
    :cond_40
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_3f

    .line 106
    const-string v2, "Localytics"

    const-string v3, "Wake lock acquired."

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3f

    .line 109
    .end local v1    # "pm":Landroid/os/PowerManager;
    :cond_4c
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_3f

    .line 111
    const-string v2, "Localytics"

    const-string v3, "android.permission.WAKE_LOCK is missing from the Manifest file."

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3f
.end method

.method private exitWakeLock()V
    .registers 4

    .prologue
    .line 117
    iget-object v1, p0, Lcom/localytics/android/AmpUploadHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 118
    .local v0, "packageManager":Landroid/content/pm/PackageManager;
    const-string v1, "android.permission.WAKE_LOCK"

    iget-object v2, p0, Lcom/localytics/android/AmpUploadHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->checkPermission(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_4c

    .line 120
    iget-object v1, p0, Lcom/localytics/android/AmpUploadHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-nez v1, :cond_27

    .line 122
    sget-boolean v1, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v1, :cond_27

    .line 124
    const-string v1, "Localytics"

    const-string v2, "Wake lock will be released but not held when should be."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    :cond_27
    iget-object v1, p0, Lcom/localytics/android/AmpUploadHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 131
    iget-object v1, p0, Lcom/localytics/android/AmpUploadHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-eqz v1, :cond_40

    .line 133
    sget-boolean v1, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v1, :cond_3f

    .line 135
    const-string v1, "Localytics"

    const-string v2, "Wake lock was not released when it should have been."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    :cond_3f
    :goto_3f
    return-void

    .line 138
    :cond_40
    sget-boolean v1, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v1, :cond_3f

    .line 140
    const-string v1, "Localytics"

    const-string v2, "Wake lock released."

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3f

    .line 143
    :cond_4c
    sget-boolean v1, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v1, :cond_3f

    .line 145
    const-string v1, "Localytics"

    const-string v2, "android.permission.WAKE_LOCK is missing from the Manifest file."

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3f
.end method

.method private parseAmpMessage(Ljava/util/Map;)Landroid/content/ContentValues;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Landroid/content/ContentValues;"
        }
    .end annotation

    .prologue
    .line 429
    .local p1, "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 431
    .local v2, "values":Landroid/content/ContentValues;
    const-string v3, "campaign_id"

    const-string v4, "campaign_id"

    invoke-static {p1, v4}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 432
    const-string v3, "expiration"

    const-string v4, "expiration"

    invoke-static {p1, v4}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 433
    const-string v3, "display_seconds"

    const-string v4, "display_seconds"

    invoke-static {p1, v4}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 434
    const-string v3, "display_session"

    const-string v4, "display_session"

    invoke-static {p1, v4}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 435
    const-string v3, "version"

    const-string v4, "version"

    invoke-static {p1, v4}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 436
    const-string v3, "phone_location"

    const-string v4, "phone_location"

    invoke-static {p1, v4}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    const-string v3, "phone_size"

    invoke-static {p1, v3}, Lcom/localytics/android/JsonHelper;->getSafeMapFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 438
    .local v0, "phoneSize":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "phone_size_width"

    const-string v4, "width"

    invoke-static {v0, v4}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 439
    const-string v3, "phone_size_height"

    const-string v4, "height"

    invoke-static {v0, v4}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 440
    const-string v3, "tablet_size"

    invoke-static {p1, v3}, Lcom/localytics/android/JsonHelper;->getSafeMapFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    .line 441
    .local v1, "tabletSize":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "tablet_location"

    const-string v4, "tablet_location"

    invoke-static {p1, v4}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 442
    const-string v3, "tablet_size_width"

    const-string v4, "width"

    invoke-static {v1, v4}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 443
    const-string v3, "tablet_size_height"

    const-string v4, "height"

    invoke-static {v1, v4}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 444
    const-string v3, "time_to_display"

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 445
    const-string v3, "internet_required"

    const-string v4, "internet_required"

    invoke-static {p1, v4}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 446
    const-string v3, "ab_test"

    const-string v4, "ab_test"

    invoke-static {p1, v4}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 447
    const-string v3, "rule_name"

    const-string v4, "rule_name"

    invoke-static {p1, v4}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 448
    const-string v3, "location"

    const-string v4, "location"

    invoke-static {p1, v4}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 449
    const-string v3, "devices"

    const-string v4, "devices"

    invoke-static {p1, v4}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 451
    return-object v2
.end method

.method private removeDeactivatedAMPMessages(Ljava/util/List;)V
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 218
    .local p1, "ampMessages":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 221
    .local v10, "campaignIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map;

    .line 223
    .local v7, "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v0, "campaign_id"

    invoke-static {v7, v0}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 227
    .end local v7    # "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_23
    new-instance v8, Ljava/util/Vector;

    invoke-direct {v8}, Ljava/util/Vector;-><init>()V

    .line 228
    .local v8, "ampMessageMaps":Ljava/util/Vector;, "Ljava/util/Vector<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v13, 0x0

    .line 231
    .local v13, "rulesCursor":Landroid/database/Cursor;
    :try_start_29
    iget-object v0, p0, Lcom/localytics/android/AmpUploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "amp_rules"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 233
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_36
    invoke-interface {v13}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ge v11, v0, :cond_19e

    .line 235
    invoke-interface {v13, v11}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 239
    const-string v0, "campaign_id"

    invoke-interface {v13, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v13, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 240
    .local v9, "campaignId":I
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v10, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_56

    .line 233
    :goto_53
    add-int/lit8 v11, v11, 0x1

    goto :goto_36

    .line 245
    :cond_56
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 247
    .local v6, "ampMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v0, "_id"

    const-string v1, "_id"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    const-string v0, "campaign_id"

    const-string v1, "campaign_id"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    const-string v0, "expiration"

    const-string v1, "expiration"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    const-string v0, "display_seconds"

    const-string v1, "display_seconds"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    const-string v0, "display_session"

    const-string v1, "display_session"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    const-string v0, "version"

    const-string v1, "version"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    const-string v0, "phone_location"

    const-string v1, "phone_location"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    const-string v0, "phone_size_width"

    const-string v1, "phone_size_width"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    const-string v0, "phone_size_height"

    const-string v1, "phone_size_height"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    const-string v0, "tablet_location"

    const-string v1, "tablet_location"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    const-string v0, "tablet_size_width"

    const-string v1, "tablet_size_width"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    const-string v0, "tablet_size_height"

    const-string v1, "tablet_size_height"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    const-string v0, "time_to_display"

    const-string v1, "time_to_display"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    const-string v0, "internet_required"

    const-string v1, "internet_required"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    const-string v0, "ab_test"

    const-string v1, "ab_test"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    const-string v0, "rule_name"

    const-string v1, "rule_name"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    const-string v0, "location"

    const-string v1, "location"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    const-string v0, "devices"

    const-string v1, "devices"

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v13, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v6, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    invoke-virtual {v8, v6}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z
    :try_end_194
    .catchall {:try_start_29 .. :try_end_194} :catchall_196

    goto/16 :goto_53

    .line 271
    .end local v6    # "ampMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v9    # "campaignId":I
    .end local v11    # "i":I
    :catchall_196
    move-exception v0

    if-eqz v13, :cond_19d

    .line 273
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    .line 274
    const/4 v13, 0x0

    :cond_19d
    throw v0

    .line 271
    .restart local v11    # "i":I
    :cond_19e
    if-eqz v13, :cond_1a4

    .line 273
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    .line 274
    const/4 v13, 0x0

    .line 279
    :cond_1a4
    invoke-virtual {v8}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_1a8
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1bb

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map;

    .line 281
    .restart local v7    # "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/localytics/android/AmpUploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const/4 v1, 0x0

    invoke-static {v0, v7, v1}, Lcom/localytics/android/AmpHelper;->destroyLocalAmp(Lcom/localytics/android/LocalyticsProvider;Ljava/util/Map;Z)V

    goto :goto_1a8

    .line 283
    .end local v7    # "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1bb
    return-void
.end method

.method private saveAMPMessage(Ljava/util/Map;)I
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 295
    .local p1, "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0, p1}, Lcom/localytics/android/AmpUploadHandler;->validateAMPMessage(Ljava/util/Map;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 297
    const/4 v12, 0x0

    .line 418
    :cond_7
    :goto_7
    return v12

    .line 301
    :cond_8
    const-string v0, "campaign_id"

    invoke-static {p1, v0}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v6

    .line 304
    .local v6, "campaignId":I
    const/4 v8, 0x0

    .line 305
    .local v8, "displayed":I
    const/4 v7, 0x0

    .line 308
    .local v7, "cursorDisplayed":Landroid/database/Cursor;
    :try_start_10
    iget-object v0, p0, Lcom/localytics/android/AmpUploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v1, "amp_displayed"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "displayed"

    aput-object v4, v2, v3

    const-string v3, "%s = ?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v13, "campaign_id"

    aput-object v13, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsProvider;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 309
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_49

    .line 311
    const-string v0, "displayed"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_48} :catch_52
    .catchall {:try_start_10 .. :try_end_48} :catchall_5c

    move-result v8

    .line 320
    :cond_49
    if-eqz v7, :cond_4e

    .line 322
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 327
    :cond_4e
    :goto_4e
    if-eqz v8, :cond_63

    .line 329
    const/4 v12, 0x0

    goto :goto_7

    .line 314
    :catch_52
    move-exception v9

    .line 316
    .local v9, "e":Ljava/lang/Exception;
    :try_start_53
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_56
    .catchall {:try_start_53 .. :try_end_56} :catchall_5c

    .line 320
    if-eqz v7, :cond_4e

    .line 322
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_4e

    .line 320
    .end local v9    # "e":Ljava/lang/Exception;
    :catchall_5c
    move-exception v0

    if-eqz v7, :cond_62

    .line 322
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_62
    throw v0

    .line 333
    :cond_63
    iget-object v0, p0, Lcom/localytics/android/AmpUploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    new-instance v1, Lcom/localytics/android/AmpUploadHandler$1;

    invoke-direct {v1, p0, v6, p1}, Lcom/localytics/android/AmpUploadHandler$1;-><init>(Lcom/localytics/android/AmpUploadHandler;ILjava/util/Map;)V

    invoke-virtual {v0, v1}, Lcom/localytics/android/LocalyticsProvider;->runBatchTransaction(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v12

    .line 407
    .local v12, "ruleId":I
    if-lez v12, :cond_7

    invoke-static {}, Lcom/localytics/android/AmpConstants;->isTestModeEnabled()Z

    move-result v0

    if-nez v0, :cond_7

    .line 410
    invoke-static {p1}, Lcom/localytics/android/AmpDownloader;->getRemoteFileURL(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v11

    .line 411
    .local v11, "remoteFileURL":Ljava/lang/String;
    iget-object v0, p0, Lcom/localytics/android/AmpUploadHandler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/localytics/android/AmpUploadHandler;->mApiKey:Ljava/lang/String;

    int-to-long v2, v12

    const-string v4, ".zip"

    invoke-virtual {v11, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    invoke-static {v0, v1, v2, v3, v4}, Lcom/localytics/android/AmpDownloader;->getLocalFileURL(Landroid/content/Context;Ljava/lang/String;JZ)Ljava/lang/String;

    move-result-object v10

    .line 412
    .local v10, "localFileURL":Ljava/lang/String;
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 414
    const/4 v0, 0x1

    invoke-static {v11, v10, v0}, Lcom/localytics/android/AmpDownloader;->downloadFile(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    goto/16 :goto_7
.end method

.method private saveAmpConditions(JLjava/util/List;)V
    .registers 23
    .param p1, "ruleId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 456
    .local p3, "conditions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    if-nez p3, :cond_3

    .line 492
    :cond_2
    return-void

    .line 462
    :cond_3
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/localytics/android/AmpUploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    move-wide/from16 v0, p1

    invoke-static {v12, v0, v1}, Lcom/localytics/android/AmpHelper;->getConditionIdFromRuleId(Lcom/localytics/android/LocalyticsProvider;J)[J

    move-result-object v6

    .line 463
    .local v6, "conditionIds":[J
    move-object v2, v6

    .local v2, "arr$":[J
    array-length v9, v2

    .local v9, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_10
    if-ge v8, v9, :cond_3a

    aget-wide v4, v2, v8

    .line 465
    .local v4, "conditionId":J
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/localytics/android/AmpUploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v13, "amp_condition_values"

    const-string v14, "%s = ?"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v17, "condition_id_ref"

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/String;

    const/16 v16, 0x0

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-virtual {v12, v13, v14, v15}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 463
    add-int/lit8 v8, v8, 0x1

    goto :goto_10

    .line 467
    .end local v4    # "conditionId":J
    :cond_3a
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/localytics/android/AmpUploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v13, "amp_conditions"

    const-string v14, "%s = ?"

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v17, "rule_id_ref"

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/String;

    const/16 v16, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-virtual {v12, v13, v14, v15}, Lcom/localytics/android/LocalyticsProvider;->remove(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 469
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :cond_61
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    .local v10, "obj":Ljava/lang/Object;
    move-object v3, v10

    .line 472
    check-cast v3, Ljava/util/List;

    .line 476
    .local v3, "condition":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 477
    .local v11, "values":Landroid/content/ContentValues;
    const-string v13, "attribute_name"

    const/4 v12, 0x0

    invoke-interface {v3, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v11, v13, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 478
    const-string v13, "operator"

    const/4 v12, 0x1

    invoke-interface {v3, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v11, v13, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 479
    const-string v12, "rule_id_ref"

    invoke-static/range {p1 .. p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 480
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/localytics/android/AmpUploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v13, "amp_conditions"

    invoke-virtual {v12, v13, v11}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    .line 484
    .restart local v4    # "conditionId":J
    const/4 v7, 0x2

    .local v7, "i":I
    :goto_9f
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v12

    if-ge v7, v12, :cond_61

    .line 486
    new-instance v11, Landroid/content/ContentValues;

    .end local v11    # "values":Landroid/content/ContentValues;
    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 487
    .restart local v11    # "values":Landroid/content/ContentValues;
    const-string v12, "value"

    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    invoke-static {v13}, Lcom/localytics/android/JsonHelper;->getSafeStringFromValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 488
    const-string v12, "condition_id_ref"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    invoke-virtual {v11, v12, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 489
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/localytics/android/AmpUploadHandler;->mProvider:Lcom/localytics/android/LocalyticsProvider;

    const-string v13, "amp_condition_values"

    invoke-virtual {v12, v13, v11}, Lcom/localytics/android/LocalyticsProvider;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 484
    add-int/lit8 v7, v7, 0x1

    goto :goto_9f
.end method

.method private validateAMPMessage(Ljava/util/Map;)Z
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 502
    .local p1, "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v7, "campaign_id"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v0

    .line 503
    .local v0, "campaignId":I
    const-string v7, "rule_name"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 504
    .local v6, "ruleName":Ljava/lang/String;
    const-string v7, "display_events"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeListFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 505
    .local v1, "eventNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const-string v7, "expiration"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeIntegerFromMap(Ljava/util/Map;Ljava/lang/String;)I

    move-result v2

    .line 506
    .local v2, "expiration":I
    const-string v7, "location"

    invoke-static {p1, v7}, Lcom/localytics/android/JsonHelper;->getSafeStringFromMap(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 508
    .local v3, "location":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long v4, v8, v10

    .line 511
    .local v4, "now":J
    if-eqz v0, :cond_3d

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3d

    if-eqz v1, :cond_3d

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3d

    int-to-long v8, v2

    cmp-long v7, v8, v4

    if-lez v7, :cond_3d

    const/4 v7, 0x1

    :goto_3c
    return v7

    :cond_3d
    const/4 v7, 0x0

    goto :goto_3c
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 63
    :try_start_0
    invoke-direct {p0}, Lcom/localytics/android/AmpUploadHandler;->enterWakeLock()V

    .line 64
    invoke-super {p0, p1}, Lcom/localytics/android/UploadHandler;->handleMessage(Landroid/os/Message;)V
    :try_end_6
    .catchall {:try_start_0 .. :try_end_6} :catchall_a

    .line 68
    invoke-direct {p0}, Lcom/localytics/android/AmpUploadHandler;->exitWakeLock()V

    .line 70
    return-void

    .line 68
    :catchall_a
    move-exception v0

    invoke-direct {p0}, Lcom/localytics/android/AmpUploadHandler;->exitWakeLock()V

    throw v0
.end method

.method protected onUploadResponded(Ljava/lang/String;)V
    .registers 11
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 156
    sget-boolean v5, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v5, :cond_15

    .line 158
    const-string v5, "Localytics"

    const-string v6, "get session upload response: \n%s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    :cond_15
    :try_start_15
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v5}, Lcom/localytics/android/JsonHelper;->toMap(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v0

    .line 166
    .local v0, "ampMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v5, "amp"

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Lcom/localytics/android/JsonHelper;->toJSON(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/json/JSONArray;

    invoke-static {v5}, Lcom/localytics/android/JsonHelper;->toList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v2

    .line 169
    .local v2, "ampMessages":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-direct {p0, v2}, Lcom/localytics/android/AmpUploadHandler;->removeDeactivatedAMPMessages(Ljava/util/List;)V

    .line 172
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_35
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_51

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 174
    .local v1, "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0, v1}, Lcom/localytics/android/AmpUploadHandler;->saveAMPMessage(Ljava/util/Map;)I
    :try_end_44
    .catch Lorg/json/JSONException; {:try_start_15 .. :try_end_44} :catch_45

    goto :goto_35

    .line 177
    .end local v0    # "ampMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v1    # "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v2    # "ampMessages":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v4    # "i$":Ljava/util/Iterator;
    :catch_45
    move-exception v3

    .line 179
    .local v3, "e":Lorg/json/JSONException;
    sget-boolean v5, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v5, :cond_51

    .line 181
    const-string v5, "Localytics"

    const-string v6, "JSONException"

    invoke-static {v5, v6, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 184
    .end local v3    # "e":Lorg/json/JSONException;
    :cond_51
    return-void
.end method
