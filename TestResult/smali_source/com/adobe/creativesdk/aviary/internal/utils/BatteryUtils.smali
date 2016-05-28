.class public final Lcom/adobe/creativesdk/aviary/internal/utils/BatteryUtils;
.super Ljava/lang/Object;
.source "BatteryUtils.java"


# direct methods
.method private static getChargingIntent(Landroid/content/Context;)Landroid/content/Intent;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 28
    if-nez p0, :cond_4

    .line 29
    :goto_3
    return-object v0

    :cond_4
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    goto :goto_3
.end method

.method private static getIsCharging(I)Z
    .registers 3
    .param p0, "status"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 34
    const/4 v1, 0x2

    if-ne p0, v1, :cond_5

    .line 46
    :cond_4
    :goto_4
    return v0

    .line 37
    :cond_5
    if-eq p0, v0, :cond_4

    .line 41
    sget-boolean v1, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_17:Z

    if-eqz v1, :cond_e

    .line 42
    const/4 v1, 0x4

    if-eq p0, v1, :cond_4

    .line 46
    :cond_e
    const/4 v0, 0x0

    goto :goto_4
.end method

.method public static isCharging(Landroid/content/Context;Landroid/content/Intent;)Z
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 15
    if-eqz p1, :cond_a

    const-string v1, "plugged"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_e

    .line 16
    :cond_a
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/BatteryUtils;->getChargingIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    .line 19
    :cond_e
    if-nez p1, :cond_12

    .line 20
    const/4 v1, 0x0

    .line 24
    :goto_11
    return v1

    .line 23
    :cond_12
    const-string v1, "plugged"

    const/4 v2, -0x1

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 24
    .local v0, "chargePlug":I
    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/BatteryUtils;->getIsCharging(I)Z

    move-result v1

    goto :goto_11
.end method
