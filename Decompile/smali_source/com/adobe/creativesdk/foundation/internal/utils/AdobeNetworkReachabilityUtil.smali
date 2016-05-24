.class public Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;
.super Ljava/lang/Object;
.source "AdobeNetworkReachabilityUtil.java"


# static fields
.field private static _sharedCount:I

.field private static volatile _sharedInstance:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    const/4 v0, 0x0

    sput v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->_sharedCount:I

    return-void
.end method

.method public static destorySharedInstance()V
    .registers 1

    .prologue
    .line 42
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->_sharedInstance:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    if-nez v0, :cond_8

    .line 44
    const/4 v0, 0x0

    sput v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->_sharedCount:I

    .line 55
    :cond_7
    :goto_7
    return-void

    .line 48
    :cond_8
    sget v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->_sharedCount:I

    add-int/lit8 v0, v0, -0x1

    sput v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->_sharedCount:I

    .line 50
    sget v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->_sharedCount:I

    if-nez v0, :cond_7

    .line 52
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->_sharedInstance:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->stopNotification()V

    .line 53
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->_sharedInstance:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    goto :goto_7
.end method

.method public static getSharedInstance()Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;
    .registers 3

    .prologue
    .line 30
    const-class v1, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    monitor-enter v1

    .line 31
    :try_start_3
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->_sharedInstance:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    if-nez v0, :cond_1b

    .line 32
    new-instance v0, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->_sharedInstance:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    .line 33
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->_sharedInstance:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getSharedApplicationContextHolder()Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/common/AdobeCommonApplicationContextHolder;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;->startNotification(Landroid/content/Context;)Z

    .line 35
    :cond_1b
    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_3 .. :try_end_1c} :catchall_25

    .line 36
    sget v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->_sharedCount:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->_sharedCount:I

    .line 37
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/AdobeNetworkReachabilityUtil;->_sharedInstance:Lcom/adobe/creativesdk/foundation/adobeinternal/net/AdobeNetworkReachability;

    return-object v0

    .line 35
    :catchall_25
    move-exception v0

    :try_start_26
    monitor-exit v1
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_25

    throw v0
.end method
