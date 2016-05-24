.class public abstract Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;
.super Ljava/lang/Object;
.source "AbstractTracker.java"


# instance fields
.field protected mApiKey:Ljava/lang/String;

.field protected mAppName:Ljava/lang/String;

.field protected mCallingAppName:Ljava/lang/String;

.field protected mSdkVersion:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "appName"    # Ljava/lang/String;
    .param p3, "apiKey"    # Ljava/lang/String;
    .param p4, "sdkVersion"    # Ljava/lang/String;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    const-string v0, "com.aviary.feather"

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;->mCallingAppName:Ljava/lang/String;

    .line 10
    const-string v0, "com.aviary.feather"

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;->mAppName:Ljava/lang/String;

    .line 12
    const-string v0, "d2703c903"

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;->mApiKey:Ljava/lang/String;

    .line 15
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;->mCallingAppName:Ljava/lang/String;

    .line 16
    iput-object p2, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;->mAppName:Ljava/lang/String;

    .line 17
    iput-object p3, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;->mApiKey:Ljava/lang/String;

    .line 18
    iput-object p4, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;->mSdkVersion:Ljava/lang/String;

    .line 19
    return-void
.end method


# virtual methods
.method public abstract close()Z
.end method

.method public abstract open()V
.end method

.method public abstract putCustomAttribute(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract recordTag(Ljava/lang/String;Ljava/util/HashMap;)Z
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
.end method

.method public abstract upload()V
.end method
