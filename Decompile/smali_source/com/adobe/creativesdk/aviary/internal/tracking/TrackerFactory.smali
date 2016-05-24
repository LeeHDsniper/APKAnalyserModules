.class public final Lcom/adobe/creativesdk/aviary/internal/tracking/TrackerFactory;
.super Ljava/lang/Object;
.source "TrackerFactory.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "apiKey"    # Ljava/lang/String;
    .param p3, "sdkVersion"    # Ljava/lang/String;

    .prologue
    .line 19
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/adobe/creativesdk/aviary/internal/tracking/LocalyticsTracker;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
