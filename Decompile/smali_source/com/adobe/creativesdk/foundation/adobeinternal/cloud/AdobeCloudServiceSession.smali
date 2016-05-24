.class public abstract Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
.super Ljava/lang/Object;
.source "AdobeCloudServiceSession.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;
.implements Ljava/util/Observer;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private _checkIsAuthenticated:Z

.field private _connectionTimer:Ljava/util/Timer;

.field private _disconnectionNotifier:Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

.field private _endpoint:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

.field private _httpServices:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;",
            ">;"
        }
    .end annotation
.end field

.field private _ongoingConnectionTimer:Ljava/util/Timer;

.field private _privateService:Z

.field private _triedReconnecting:Z

.field private _useOngoingTimer:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 47
    const-class v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_httpServices:Ljava/util/HashMap;

    .line 80
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {v0, v1, p0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 81
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginExternalNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {v0, v1, p0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 82
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLogoutNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {v0, v1, p0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->addObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 83
    return-void
.end method

.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V
    .registers 2
    .param p1, "endpoint"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .prologue
    .line 400
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;-><init>()V

    .line 401
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->configureEndpoint(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V

    .line 402
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->checkServiceConnection()V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->ongoingCheckServiceConnection()V

    return-void
.end method

.method private checkServiceConnection()V
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 299
    invoke-static {}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->getSharedAuthManager()Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->isAuthenticated()Z

    move-result v4

    if-nez v4, :cond_f

    .line 301
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->stopConnectionTimer()V

    .line 355
    :cond_e
    return-void

    .line 303
    :cond_f
    iget-boolean v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_useOngoingTimer:Z

    if-nez v4, :cond_e

    .line 306
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_httpServices:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    .line 307
    .local v1, "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    :goto_1d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_e

    .line 308
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 309
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .line 310
    .local v3, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    if-nez v3, :cond_5e

    .line 312
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Network service not set up for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " timer"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1d

    .line 314
    :cond_5e
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_disconnectionNotifier:Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    if-nez v4, :cond_8f

    .line 316
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Disconnect notifier not set up for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " timer"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1d

    .line 318
    :cond_8f
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_c4

    .line 325
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " isConnected is true.  Cancel timer."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_connectionTimer:Ljava/util/Timer;

    invoke-virtual {v4}, Ljava/util/Timer;->cancel()V

    .line 327
    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_connectionTimer:Ljava/util/Timer;

    goto/16 :goto_1d

    .line 331
    :cond_c4
    iget-boolean v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_triedReconnecting:Z

    if-nez v4, :cond_f6

    .line 334
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Attempting to reconnect "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->reconnect()V

    .line 336
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_triedReconnecting:Z

    goto/16 :goto_1d

    .line 341
    :cond_f6
    sget-object v4, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v5, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to reconnect "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ". Sending "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_disconnectionNotifier:Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 342
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v4

    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    iget-object v6, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_disconnectionNotifier:Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    invoke-direct {v5, v6, v8}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;-><init>(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Map;)V

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->postNotification(Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;)V

    .line 343
    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->reconnect()V

    .line 344
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_connectionTimer:Ljava/util/Timer;

    if-eqz v4, :cond_144

    .line 345
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_connectionTimer:Ljava/util/Timer;

    invoke-virtual {v4}, Ljava/util/Timer;->cancel()V

    .line 346
    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_connectionTimer:Ljava/util/Timer;

    .line 348
    :cond_144
    const/4 v4, 0x0

    iput-boolean v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_triedReconnecting:Z

    goto/16 :goto_1d
.end method

.method private ongoingCheckServiceConnection()V
    .registers 10

    .prologue
    .line 463
    iget-boolean v5, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_checkIsAuthenticated:Z

    if-eqz v5, :cond_12

    invoke-static {}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->getSharedAuthManager()Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->isAuthenticated()Z

    move-result v5

    if-nez v5, :cond_12

    .line 465
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->stopOngoingConnectionTimer()V

    .line 492
    :cond_11
    return-void

    .line 467
    :cond_12
    iget-boolean v5, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_useOngoingTimer:Z

    if-eqz v5, :cond_11

    .line 469
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_httpServices:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    .line 470
    .local v1, "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    :cond_20
    :goto_20
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_11

    .line 471
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 472
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .line 473
    .local v4, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 475
    .local v3, "key":Ljava/lang/String;
    if-nez v4, :cond_67

    .line 477
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Network service not set up for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " timer"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_20

    .line 479
    :cond_67
    iget-object v5, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_disconnectionNotifier:Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    if-nez v5, :cond_98

    .line 481
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Disconnect notification not set up for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " timer"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_20

    .line 483
    :cond_98
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->isConnected()Z

    move-result v5

    if-nez v5, :cond_20

    .line 486
    sget-object v5, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v6, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Ongoing timer.  Attempting to reconnect "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 487
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->reconnect()V

    goto/16 :goto_20
.end method

.method private refreshAccessTokenForService(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)Z
    .registers 4
    .param p1, "service"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    .line 374
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->sharedAuthManager()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthManager;->reAuthenticate()Z

    move-result v0

    .line 376
    .local v0, "refreshedAccess":Z
    if-eqz v0, :cond_19

    .line 378
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setAccessToken(Ljava/lang/String;)V

    .line 379
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setSuspended(Z)V

    .line 382
    :cond_19
    return v0
.end method

.method private setupConnectionTimer(JLcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)V
    .registers 15
    .param p1, "timeInterval"    # J
    .param p3, "service"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    .line 259
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_useOngoingTimer:Z

    if-nez v0, :cond_72

    .line 261
    const/4 v9, 0x0

    .line 264
    .local v9, "storedService":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_httpServices:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v7

    .line 265
    .local v7, "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    :cond_f
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 266
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    .line 267
    .local v6, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;"
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 268
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "storedService":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    check-cast v9, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .line 274
    .end local v6    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;"
    .restart local v9    # "storedService":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    :cond_2b
    if-nez v9, :cond_34

    .line 276
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_httpServices:Ljava/util/HashMap;

    const-string v2, "default"

    invoke-virtual {v0, v2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    :cond_34
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_connectionTimer:Ljava/util/Timer;

    if-nez v0, :cond_72

    .line 284
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Check connection for in "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " secs."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 286
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_connectionTimer:Ljava/util/Timer;

    .line 287
    new-instance v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession$1;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;)V

    .line 293
    .local v1, "task":Ljava/util/TimerTask;
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_connectionTimer:Ljava/util/Timer;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x3e8

    mul-long/2addr v4, p1

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 296
    .end local v1    # "task":Ljava/util/TimerTask;
    .end local v7    # "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    .end local v8    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    .end local v9    # "storedService":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    :cond_72
    return-void
.end method

.method private stopConnectionTimer()V
    .registers 4

    .prologue
    .line 359
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_connectionTimer:Ljava/util/Timer;

    if-eqz v0, :cond_1e

    .line 361
    monitor-enter p0

    .line 363
    :try_start_5
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Stopping connection timer"

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 364
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_connectionTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 365
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_connectionTimer:Ljava/util/Timer;

    .line 367
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_triedReconnecting:Z

    .line 368
    monitor-exit p0

    .line 370
    :cond_1e
    return-void

    .line 368
    :catchall_1f
    move-exception v0

    monitor-exit p0
    :try_end_21
    .catchall {:try_start_5 .. :try_end_21} :catchall_1f

    throw v0
.end method


# virtual methods
.method public HTTPServiceAuthenticationDidFail(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)Z
    .registers 3
    .param p1, "service"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    .line 166
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->refreshAccessTokenForService(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)Z

    move-result v0

    .line 167
    .local v0, "tryAgain":Z
    return v0
.end method

.method public HTTPServiceDidDisconnect(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)V
    .registers 4
    .param p1, "service"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    .line 172
    const-wide/16 v0, 0xf

    invoke-direct {p0, v0, v1, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->setupConnectionTimer(JLcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)V

    .line 173
    return-void
.end method

.method public HTTPServiceIsActive(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;)V
    .registers 2
    .param p1, "service"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .prologue
    .line 177
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->stopConnectionTimer()V

    .line 178
    return-void
.end method

.method protected configureEndpoint(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)V
    .registers 15
    .param p1, "endpoint"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .prologue
    .line 405
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v4

    .line 406
    .local v4, "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v0

    .line 408
    .local v0, "accessToken":Ljava/lang/String;
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 416
    .local v1, "additionalHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v9, "%s%s"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string v12, "CreativeSDK"

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-static {}, Lcom/adobe/creativesdk/foundation/AdobeCSDKFoundation;->getVersion()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 418
    .local v6, "sdkVersion":Ljava/lang/String;
    sget-boolean v9, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->$assertionsDisabled:Z

    if-nez v9, :cond_34

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v9

    if-nez v9, :cond_34

    new-instance v9, Ljava/lang/AssertionError;

    const-string v10, "clientID not initialized by the authentication module."

    invoke-direct {v9, v10}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v9

    .line 420
    :cond_34
    const-string v9, "x-api-key"

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v1, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 421
    const-string v9, "x-creativesdk-versions"

    invoke-interface {v1, v9, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 423
    sget-boolean v9, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->$assertionsDisabled:Z

    if-nez v9, :cond_54

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;->getServiceURLs()Ljava/util/HashMap;

    move-result-object v9

    if-nez v9, :cond_54

    new-instance v9, Ljava/lang/AssertionError;

    const-string v10, "Service endpoint URLs cannot be nil."

    invoke-direct {v9, v10}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v9

    .line 427
    :cond_54
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;->getServiceURLs()Ljava/util/HashMap;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    .line 428
    .local v3, "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/net/URL;>;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/net/URL;>;>;"
    :goto_60
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_8f

    .line 429
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 430
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/net/URL;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/net/URL;

    .line 431
    .local v8, "url":Ljava/net/URL;
    new-instance v7, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    invoke-virtual {v8}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getClientID()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v7, v9, v10, v1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 433
    .local v7, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    invoke-virtual {v7, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setAccessToken(Ljava/lang/String;)V

    .line 434
    invoke-virtual {v7, p0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setHttpServiceDelegate(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpServiceDelegate;)V

    .line 436
    iget-object v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_httpServices:Ljava/util/HashMap;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_60

    .line 439
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/net/URL;>;"
    .end local v7    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    .end local v8    # "url":Ljava/net/URL;
    :cond_8f
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_endpoint:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .line 440
    return-void
.end method

.method protected finalize()V
    .registers 1

    .prologue
    .line 254
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->unInitialize()V

    .line 255
    return-void
.end method

.method public getCloudEndpoint()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    .registers 2

    .prologue
    .line 508
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_endpoint:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    return-object v0
.end method

.method public getHttpServices()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;",
            ">;"
        }
    .end annotation

    .prologue
    .line 181
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_httpServices:Ljava/util/HashMap;

    return-object v0
.end method

.method public getService()Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    .registers 2

    .prologue
    .line 131
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->getServiceForSchemaId(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    move-result-object v0

    return-object v0
.end method

.method public getServiceForSchemaId(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    .registers 7
    .param p1, "serviceId"    # Ljava/lang/String;

    .prologue
    .line 143
    const/4 v3, 0x0

    .line 146
    .local v3, "result":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    if-nez p1, :cond_1f

    .line 147
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_httpServices:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    .line 148
    .local v1, "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 149
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1f

    .line 150
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 151
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p1

    .end local p1    # "serviceId":Ljava/lang/String;
    check-cast p1, Ljava/lang/String;

    .line 155
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;"
    .end local v1    # "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    .end local v2    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    .restart local p1    # "serviceId":Ljava/lang/String;
    :cond_1f
    if-eqz p1, :cond_29

    .line 157
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_httpServices:Ljava/util/HashMap;

    invoke-virtual {v4, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "result":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    check-cast v3, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .line 160
    .restart local v3    # "result":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    :cond_29
    return-object v3
.end method

.method public isPrivateService()Z
    .registers 2

    .prologue
    .line 59
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_privateService:Z

    return v0
.end method

.method public setDisconnectionNotifier(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;)V
    .registers 2
    .param p1, "disconnectionNotifier"    # Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    .prologue
    .line 389
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_disconnectionNotifier:Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    .line 390
    return-void
.end method

.method public setPrivateService(Z)V
    .registers 2
    .param p1, "privateService"    # Z

    .prologue
    .line 512
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_privateService:Z

    .line 513
    return-void
.end method

.method public setUpService()V
    .registers 1

    .prologue
    .line 110
    return-void
.end method

.method protected setupOngoingConnectionTimer(JZ)V
    .registers 11
    .param p1, "timeInterval"    # J
    .param p3, "onlyIfAuthenticated"    # Z

    .prologue
    .line 444
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_useOngoingTimer:Z

    .line 445
    iput-boolean p3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_checkIsAuthenticated:Z

    .line 447
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_ongoingConnectionTimer:Ljava/util/Timer;

    if-nez v0, :cond_55

    .line 449
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Set up "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ongoing connection timer at "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " secs."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 451
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_ongoingConnectionTimer:Ljava/util/Timer;

    .line 452
    new-instance v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession$2;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;)V

    .line 458
    .local v1, "task":Ljava/util/TimerTask;
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_ongoingConnectionTimer:Ljava/util/Timer;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x3e8

    mul-long/2addr v4, p1

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 460
    .end local v1    # "task":Ljava/util/TimerTask;
    :cond_55
    return-void
.end method

.method protected stopOngoingConnectionTimer()V
    .registers 5

    .prologue
    .line 496
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_ongoingConnectionTimer:Ljava/util/Timer;

    if-eqz v0, :cond_20

    .line 497
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_ongoingConnectionTimer:Ljava/util/Timer;

    monitor-enter v1

    .line 499
    const/4 v0, 0x0

    :try_start_8
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_useOngoingTimer:Z

    .line 500
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Stopping ongoing connection timer"

    invoke-static {v0, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 501
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_ongoingConnectionTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 502
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_ongoingConnectionTimer:Ljava/util/Timer;

    .line 503
    monitor-exit v1

    .line 505
    :cond_20
    return-void

    .line 503
    :catchall_21
    move-exception v0

    monitor-exit v1
    :try_end_23
    .catchall {:try_start_8 .. :try_end_23} :catchall_21

    throw v0
.end method

.method public tearDownService()V
    .registers 4

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->getHttpServices()Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .line 120
    .local v0, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->clearQueuedRequests()V

    goto :goto_c

    .line 122
    .end local v0    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    :cond_1c
    return-void
.end method

.method protected unInitialize()V
    .registers 3

    .prologue
    .line 246
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {v0, v1, p0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 247
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginExternalNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {v0, v1, p0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 248
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->getDefaultNotificationCenter()Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLogoutNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    invoke-virtual {v0, v1, p0}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeLocalNotificationCenter;->removeObserver(Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;Ljava/util/Observer;)V

    .line 249
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->tearDownService()V

    .line 250
    return-void
.end method

.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
    .registers 17
    .param p1, "observable"    # Ljava/util/Observable;
    .param p2, "data"    # Ljava/lang/Object;

    .prologue
    .line 186
    move-object/from16 v7, p2

    check-cast v7, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;

    .line 187
    .local v7, "notification":Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;
    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v12

    sget-object v13, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLogoutNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-ne v12, v13, :cond_41

    .line 188
    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getInfo()Ljava/util/Map;

    move-result-object v12

    if-nez v12, :cond_41

    .line 189
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->tearDownService()V

    .line 191
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->stopConnectionTimer()V

    .line 192
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->stopOngoingConnectionTimer()V

    .line 193
    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_httpServices:Ljava/util/HashMap;

    invoke-virtual {v12}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    .line 194
    .local v3, "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    :goto_25
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_3b

    .line 195
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 196
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .line 197
    .local v8, "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->clearQueuedRequests()V

    goto :goto_25

    .line 199
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;"
    .end local v8    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    :cond_3b
    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_httpServices:Ljava/util/HashMap;

    invoke-virtual {v12}, Ljava/util/HashMap;->clear()V

    .line 243
    .end local v3    # "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    .end local v5    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    :cond_40
    :goto_40
    return-void

    .line 201
    :cond_41
    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v12

    sget-object v13, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-eq v12, v13, :cond_51

    .line 202
    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeNotification;->getId()Lcom/adobe/creativesdk/foundation/internal/notification/IAdobeNotificationID;

    move-result-object v12

    sget-object v13, Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;->AdobeAuthLoginExternalNotification:Lcom/adobe/creativesdk/foundation/internal/notification/AdobeInternalNotificationID;

    if-ne v12, v13, :cond_40

    .line 203
    :cond_51
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v4

    .line 205
    .local v4, "imsService":Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;
    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_httpServices:Ljava/util/HashMap;

    invoke-virtual {v12}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    .line 206
    .restart local v3    # "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .restart local v5    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;>;"
    :cond_5f
    :goto_5f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_107

    .line 207
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 208
    .restart local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .line 209
    .restart local v8    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 211
    .local v6, "key":Ljava/lang/String;
    invoke-virtual {v4}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getAccessToken()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v12}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setAccessToken(Ljava/lang/String;)V

    .line 212
    const/4 v12, 0x0

    invoke-virtual {v8, v12}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setSuspended(Z)V

    .line 214
    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_endpoint:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    if-eqz v12, :cond_5f

    .line 216
    sget-boolean v12, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->$assertionsDisabled:Z

    if-nez v12, :cond_9a

    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_endpoint:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    invoke-virtual {v12}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;->getServiceURLs()Ljava/util/HashMap;

    move-result-object v12

    if-nez v12, :cond_9a

    new-instance v12, Ljava/lang/AssertionError;

    const-string v13, "Service endpoint URLs cannot be nil."

    invoke-direct {v12, v13}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v12

    .line 217
    :cond_9a
    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_endpoint:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    invoke-virtual {v12}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;->getServiceURLs()Ljava/util/HashMap;

    move-result-object v12

    if-eqz v12, :cond_b5

    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_endpoint:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    invoke-virtual {v12}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;->getServiceURLs()Ljava/util/HashMap;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/net/URL;

    move-object v0, v12

    .line 219
    .local v0, "baseURL":Ljava/net/URL;
    :goto_af
    if-eqz v0, :cond_b7

    .line 221
    invoke-virtual {v8, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setBaseURL(Ljava/net/URL;)V

    goto :goto_5f

    .line 217
    .end local v0    # "baseURL":Ljava/net/URL;
    :cond_b5
    const/4 v0, 0x0

    goto :goto_af

    .line 223
    .restart local v0    # "baseURL":Ljava/net/URL;
    :cond_b7
    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_endpoint:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    invoke-virtual {v12}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;->getServiceURLs()Ljava/util/HashMap;

    move-result-object v12

    if-eqz v12, :cond_5f

    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_endpoint:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    invoke-virtual {v12}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;->getServiceURLs()Ljava/util/HashMap;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/HashMap;->size()I

    move-result v12

    if-lez v12, :cond_5f

    .line 226
    const-string v12, "default"

    if-ne v6, v12, :cond_101

    .line 227
    const/4 v1, 0x0

    .line 228
    .local v1, "defaultKey":Ljava/lang/String;
    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_endpoint:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    invoke-virtual {v12}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;->getServiceURLs()Ljava/util/HashMap;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v10

    .line 229
    .local v10, "urlEntrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/net/URL;>;>;"
    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .line 230
    .local v11, "urlIt":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/net/URL;>;>;"
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_f0

    .line 231
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 232
    .local v9, "urlEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/net/URL;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "defaultKey":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 234
    .end local v9    # "urlEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/net/URL;>;"
    .restart local v1    # "defaultKey":Ljava/lang/String;
    :cond_f0
    iget-object v12, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->_endpoint:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    invoke-virtual {v12}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;->getServiceURLs()Ljava/util/HashMap;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/net/URL;

    invoke-virtual {v8, v12}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setBaseURL(Ljava/net/URL;)V

    goto/16 :goto_5f

    .line 236
    .end local v1    # "defaultKey":Ljava/lang/String;
    .end local v10    # "urlEntrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/net/URL;>;>;"
    .end local v11    # "urlIt":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/net/URL;>;>;"
    :cond_101
    const/4 v12, 0x0

    invoke-virtual {v8, v12}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->setBaseURL(Ljava/net/URL;)V

    goto/16 :goto_5f

    .line 241
    .end local v0    # "baseURL":Ljava/net/URL;
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;>;"
    .end local v6    # "key":Ljava/lang/String;
    .end local v8    # "service":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;
    :cond_107
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->setUpService()V

    goto/16 :goto_40
.end method
