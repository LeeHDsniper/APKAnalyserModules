.class public Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;
.super Ljava/lang/Object;
.source "AdobeNetworkReachability.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$NetworkReceiver;,
        Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatus;,
        Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;
    }
.end annotation


# instance fields
.field private _adobeNetworkStatusCode:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

.field private _applicationContext:Landroid/content/Context;

.field private _networkReceiver:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$NetworkReceiver;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;->AdobeNetworkNotReachable:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_adobeNetworkStatusCode:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    .line 68
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_applicationContext:Landroid/content/Context;

    .line 69
    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_networkReceiver:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$NetworkReceiver;

    .line 155
    return-void
.end method

.method public static createAndGetNetworkReachability()Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;
    .registers 1

    .prologue
    .line 76
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;-><init>()V

    return-object v0
.end method


# virtual methods
.method decideNetworkConnectivity(Landroid/net/NetworkInfo;)V
    .registers 4
    .param p1, "networkInfo"    # Landroid/net/NetworkInfo;

    .prologue
    .line 142
    if-eqz p1, :cond_13

    .line 144
    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_e

    .line 145
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;->AdobeNetworkReachableViaWiFi:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_adobeNetworkStatusCode:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    .line 153
    :goto_d
    return-void

    .line 147
    :cond_e
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;->AdobeNetworkReachableViaMobileData:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_adobeNetworkStatusCode:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    goto :goto_d

    .line 151
    :cond_13
    sget-object v0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;->AdobeNetworkNotReachable:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_adobeNetworkStatusCode:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    goto :goto_d
.end method

.method public isOnline()Z
    .registers 3

    .prologue
    .line 84
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_adobeNetworkStatusCode:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;->AdobeNetworkNotReachable:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    if-eq v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method notifyNetworkChange()V
    .registers 6

    .prologue
    .line 132
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v2

    .line 133
    .local v2, "notificationCenter":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 134
    .local v3, "userInfo":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatus;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatus;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;)V

    .line 135
    .local v0, "netStatus":Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatus;
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_adobeNetworkStatusCode:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    iput-object v4, v0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatus;->networkStatusCode:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$AdobeNetworkStatusCode;

    .line 136
    const-string v4, "AdobeNetworkReachabilityStatusKey"

    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeNetworkStatusChangeNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-direct {v1, v4, v3}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    .line 138
    .local v1, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v2, v1}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 139
    return-void
.end method

.method public declared-synchronized startNotification(Landroid/content/Context;)Z
    .registers 7
    .param p1, "applicationContext"    # Landroid/content/Context;

    .prologue
    .line 103
    monitor-enter p0

    :try_start_1
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_applicationContext:Landroid/content/Context;

    if-eqz v3, :cond_b

    .line 105
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->isOnline()Z
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_36

    move-result v3

    .line 116
    :goto_9
    monitor-exit p0

    return v3

    .line 107
    :cond_b
    :try_start_b
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_applicationContext:Landroid/content/Context;

    .line 108
    new-instance v1, Landroid/content/IntentFilter;

    const-string v3, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v1, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 109
    .local v1, "filter":Landroid/content/IntentFilter;
    new-instance v3, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$NetworkReceiver;

    invoke-direct {v3, p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$NetworkReceiver;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;)V

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_networkReceiver:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$NetworkReceiver;

    .line 110
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_applicationContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_networkReceiver:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$NetworkReceiver;

    invoke-virtual {v3, v4, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 112
    const-string v3, "connectivity"

    .line 113
    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 114
    .local v0, "connMgr":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 115
    .local v2, "networkInfo":Landroid/net/NetworkInfo;
    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->decideNetworkConnectivity(Landroid/net/NetworkInfo;)V

    .line 116
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->isOnline()Z
    :try_end_34
    .catchall {:try_start_b .. :try_end_34} :catchall_36

    move-result v3

    goto :goto_9

    .line 103
    .end local v0    # "connMgr":Landroid/net/ConnectivityManager;
    .end local v1    # "filter":Landroid/content/IntentFilter;
    .end local v2    # "networkInfo":Landroid/net/NetworkInfo;
    :catchall_36
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized stopNotification()V
    .registers 3

    .prologue
    .line 124
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_networkReceiver:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$NetworkReceiver;

    if-eqz v0, :cond_c

    .line 125
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_applicationContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_networkReceiver:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$NetworkReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 127
    :cond_c
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_applicationContext:Landroid/content/Context;

    .line 128
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->_networkReceiver:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability$NetworkReceiver;
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_14

    .line 129
    monitor-exit p0

    return-void

    .line 124
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method
