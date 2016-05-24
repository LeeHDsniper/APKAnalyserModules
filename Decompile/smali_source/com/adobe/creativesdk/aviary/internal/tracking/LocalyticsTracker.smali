.class public Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;
.super Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;
.source "LocalyticsTracker.java"


# instance fields
.field private localyticsSession:Lcom/localytics/android/LocalyticsSession;

.field private final mCustomDimensions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mDefaultAttributes:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "appName"    # Ljava/lang/String;
    .param p3, "apiKey"    # Ljava/lang/String;
    .param p4, "sdkVersion"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->mDefaultAttributes:Ljava/util/HashMap;

    .line 27
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->mDefaultAttributes:Ljava/util/HashMap;

    const-string v2, "apiKey"

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->mApiKey:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->mDefaultAttributes:Ljava/util/HashMap;

    const-string v2, "appId"

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->mCallingAppName:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->mDefaultAttributes:Ljava/util/HashMap;

    const-string v2, "sdkVersion"

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->mSdkVersion:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/tracking/TrackingUtils;->getTrackerApiKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 37
    .local v0, "localyticsKey":Ljava/lang/String;
    new-instance v1, Lcom/localytics/android/LocalyticsSession;

    invoke-direct {v1, p1, v0}, Lcom/localytics/android/LocalyticsSession;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->localyticsSession:Lcom/localytics/android/LocalyticsSession;

    .line 39
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->mCustomDimensions:Ljava/util/List;

    .line 40
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->mCustomDimensions:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    return-void
.end method


# virtual methods
.method public close()Z
    .registers 3

    .prologue
    .line 80
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->localyticsSession:Lcom/localytics/android/LocalyticsSession;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->mCustomDimensions:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/localytics/android/LocalyticsSession;->close(Ljava/util/List;)V

    .line 81
    const/4 v0, 0x1

    return v0
.end method

.method public open()V
    .registers 3

    .prologue
    .line 66
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->localyticsSession:Lcom/localytics/android/LocalyticsSession;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->mCustomDimensions:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/localytics/android/LocalyticsSession;->open(Ljava/util/List;)V

    .line 67
    return-void
.end method

.method public putCustomAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->mDefaultAttributes:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    return-void
.end method

.method public recordTag(Ljava/lang/String;Ljava/util/HashMap;)Z
    .registers 5
    .param p1, "theTag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 48
    .local p2, "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p2, :cond_d

    .line 49
    iget-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->mDefaultAttributes:Ljava/util/HashMap;

    .line 58
    :goto_4
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->localyticsSession:Lcom/localytics/android/LocalyticsSession;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->mCustomDimensions:Ljava/util/List;

    invoke-virtual {v0, p1, p2, v1}, Lcom/localytics/android/LocalyticsSession;->tagEvent(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)V

    .line 59
    const/4 v0, 0x1

    return v0

    .line 51
    :cond_d
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->mDefaultAttributes:Ljava/util/HashMap;

    invoke-virtual {p2, v0}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    goto :goto_4
.end method

.method public upload()V
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;->localyticsSession:Lcom/localytics/android/LocalyticsSession;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsSession;->upload()V

    .line 74
    return-void
.end method
