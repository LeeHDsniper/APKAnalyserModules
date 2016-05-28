.class public abstract Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;
.super Lcom/adobe/android/ui/view/AdobeTutorialOverlay;
.source "AbstractBaseOverlay.java"


# instance fields
.field logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "toolName"    # Ljava/lang/String;
    .param p3, "styleId"    # I
    .param p4, "overlayId"    # I

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/adobe/android/ui/view/AdobeTutorialOverlay;-><init>(Landroid/content/Context;Ljava/lang/String;II)V

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    .line 31
    return-void
.end method

.method private static markAsViewed(Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;I)V
    .registers 2
    .param p0, "preferences"    # Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    .param p1, "overlayId"    # I

    .prologue
    .line 70
    if-gez p1, :cond_3

    .line 74
    :goto_2
    return-void

    .line 73
    :cond_3
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->markOverlayAsRead(I)V

    goto :goto_2
.end method

.method public static shouldShow(Landroid/content/Context;I)Z
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "overlayId"    # I

    .prologue
    .line 77
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v0

    .line 78
    .local v0, "preferences":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->shouldShow(Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;I)Z

    move-result v1

    return v1
.end method

.method private static shouldShow(Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;I)Z
    .registers 4
    .param p0, "preferences"    # Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    .param p1, "overlayId"    # I

    .prologue
    const/4 v0, 0x1

    .line 82
    const/4 v1, -0x1

    if-le p1, v1, :cond_a

    .line 83
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->hasOverlayKey(I)Z

    move-result v1

    if-nez v1, :cond_b

    .line 85
    :cond_a
    :goto_a
    return v0

    .line 83
    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method


# virtual methods
.method public shouldShow()Z
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 47
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->getContext()Landroid/content/Context;

    move-result-object v2

    if-nez v2, :cond_8

    .line 56
    :cond_7
    :goto_7
    return v1

    .line 51
    :cond_8
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v0

    .line 52
    .local v0, "prefs":Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;
    iget v2, p0, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->overlayId:I

    invoke-static {v0, v2}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->shouldShow(Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;I)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 53
    iget v1, p0, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->overlayId:I

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->markAsViewed(Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;I)V

    .line 54
    const/4 v1, 0x1

    goto :goto_7
.end method

.method protected trackTutorialClosed(Ljava/lang/String;)V
    .registers 7
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->getContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_33

    if-eqz p1, :cond_33

    .line 41
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v0

    .line 42
    .local v0, "tracker":Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->mTagName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": tutorial_closed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "from"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    .line 44
    .end local v0    # "tracker":Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;
    :cond_33
    return-void
.end method

.method protected trackTutorialOpened()V
    .registers 4

    .prologue
    .line 34
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_26

    .line 35
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/overlays/AbstractBaseOverlay;->mTagName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": tutorial_presented"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V

    .line 37
    :cond_26
    return-void
.end method
