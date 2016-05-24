.class public Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;
.super Ljava/lang/Object;
.source "AdobeAnalyticsSession.java"


# static fields
.field private static volatile sharedSession:Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;


# instance fields
.field private _registeredSessionDelegates:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/content/Context;",
            "Lcom/adobe/creativesdk/foundation/internal/analytics/IAdobeAnalyticsSessionCallback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 27
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;->_registeredSessionDelegates:Ljava/util/Map;

    .line 33
    return-void
.end method

.method public static getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;
    .registers 2

    .prologue
    .line 37
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;

    if-nez v0, :cond_13

    .line 39
    const-class v1, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;

    monitor-enter v1

    .line 41
    :try_start_7
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;

    if-nez v0, :cond_12

    .line 43
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;

    .line 45
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 48
    :cond_13
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;->sharedSession:Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;

    return-object v0

    .line 45
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method


# virtual methods
.method public hasDelegate()Ljava/lang/Boolean;
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;->_registeredSessionDelegates:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-nez v0, :cond_e

    .line 59
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 60
    :goto_d
    return-object v0

    :cond_e
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_d
.end method

.method trackAction(Ljava/lang/String;Ljava/util/Map;)V
    .registers 7
    .param p1, "state"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 87
    .local p2, "data":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;->hasDelegate()Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_b

    .line 95
    :cond_a
    return-void

    .line 90
    :cond_b
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;->_registeredSessionDelegates:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_15
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 92
    .local v0, "key":Landroid/content/Context;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/analytics/AdobeAnalyticsSession;->_registeredSessionDelegates:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/internal/analytics/IAdobeAnalyticsSessionCallback;

    .line 93
    .local v1, "sessionDelegate":Lcom/adobe/creativesdk/foundation/internal/analytics/IAdobeAnalyticsSessionCallback;
    invoke-interface {v1, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/analytics/IAdobeAnalyticsSessionCallback;->trackAction(Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_15
.end method
