.class final Lcom/adobe/creativesdk/aviary/internal/tracking/TrackingUtils;
.super Ljava/lang/Object;
.source "TrackingUtils.java"


# static fields
.field private static final M_API_KEY_LOCK:Ljava/lang/Object;

.field private static mTrackingApiKey:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/tracking/TrackingUtils;->mTrackingApiKey:Ljava/lang/String;

    .line 14
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/tracking/TrackingUtils;->M_API_KEY_LOCK:Ljava/lang/Object;

    return-void
.end method

.method public static getTrackerApiKey(Landroid/content/Context;)Ljava/lang/String;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/tracking/TrackingUtils;->mTrackingApiKey:Ljava/lang/String;

    if-nez v0, :cond_16

    .line 20
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/tracking/TrackingUtils;->M_API_KEY_LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 21
    :try_start_7
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/tracking/TrackingUtils;->mTrackingApiKey:Ljava/lang/String;

    if-nez v0, :cond_15

    .line 22
    const-string v0, "com.aviary.android.feather.v1.LOCALYTICS_API_KEY"

    const-string v2, "ff159f6cc04d5010ac6461e-fc511f5e-b6ff-11e0-049a-007f58cb3154"

    invoke-static {p0, v0, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/SDKUtils;->getMetadataValue(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/tracking/TrackingUtils;->mTrackingApiKey:Ljava/lang/String;

    .line 24
    :cond_15
    monitor-exit v1
    :try_end_16
    .catchall {:try_start_7 .. :try_end_16} :catchall_19

    .line 26
    :cond_16
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/tracking/TrackingUtils;->mTrackingApiKey:Ljava/lang/String;

    return-object v0

    .line 24
    :catchall_19
    move-exception v0

    :try_start_1a
    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_1a .. :try_end_1b} :catchall_19

    throw v0
.end method
