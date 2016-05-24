.class public Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;
.super Ljava/lang/Object;
.source "AdobeImageAnalyticsTracker.java"


# static fields
.field private static instance:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;


# instance fields
.field private mInstance:Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 25
    .local v3, "packageName":Ljava/lang/String;
    invoke-static {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/CredentialsUtils;->getApiKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 27
    .local v1, "apiKey":Ljava/lang/String;
    const-string v4, "CreativeSDK api-key is missing."

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    invoke-static {v4, v5}, Ljunit/framework/Assert;->assertFalse(Ljava/lang/String;Z)V

    .line 29
    const-string v4, "4.1.1"

    invoke-static {p1, v3, v1, v4}, Lcom/adobe/creativesdk/aviary/internal/tracking/TrackerFactory;->create(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->mInstance:Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;

    .line 30
    invoke-static {p1}, Lit/sephiroth/android/library/ab/AB;->getInstance(Landroid/content/Context;)Lit/sephiroth/android/library/ab/AB;

    move-result-object v0

    .line 31
    .local v0, "abTest":Lit/sephiroth/android/library/ab/AB;
    invoke-virtual {v0}, Lit/sephiroth/android/library/ab/AB;->getGroup()Lit/sephiroth/android/library/ab/AB$Group;

    move-result-object v2

    .line 32
    .local v2, "group":Lit/sephiroth/android/library/ab/AB$Group;
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->mInstance:Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;

    const-string v5, "ab-group"

    invoke-virtual {v2}, Lit/sephiroth/android/library/ab/AB$Group;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;->putCustomAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 89
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->instance:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    if-nez v0, :cond_13

    .line 90
    const-class v1, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    monitor-enter v1

    .line 91
    :try_start_7
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->instance:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    if-nez v0, :cond_12

    .line 92
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->instance:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    .line 94
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 96
    :cond_13
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->instance:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    return-object v0

    .line 94
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 83
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->mInstance:Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;

    if-eqz v0, :cond_9

    .line 84
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->mInstance:Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;->close()Z

    .line 86
    :cond_9
    return-void
.end method

.method public open()V
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->mInstance:Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;

    if-eqz v0, :cond_9

    .line 72
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->mInstance:Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;->open()V

    .line 74
    :cond_9
    return-void
.end method

.method public tagEvent(Ljava/lang/String;)V
    .registers 3
    .param p1, "theTag"    # Ljava/lang/String;

    .prologue
    .line 42
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEventAttributes(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 43
    return-void
.end method

.method public varargs tagEvent(Ljava/lang/String;[Ljava/lang/String;)V
    .registers 8
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "attributes"    # [Ljava/lang/String;

    .prologue
    .line 52
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->mInstance:Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;

    if-nez v2, :cond_5

    .line 68
    :goto_4
    return-void

    .line 55
    :cond_5
    if-eqz p2, :cond_42

    array-length v2, p2

    if-lez v2, :cond_42

    .line 56
    array-length v2, p2

    rem-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_29

    .line 57
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "attributes array must be even. Found "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v4, p2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 60
    :cond_29
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 61
    .local v1, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2f
    array-length v2, p2

    if-ge v0, v2, :cond_3e

    .line 62
    aget-object v2, p2, v0

    add-int/lit8 v3, v0, 0x1

    aget-object v3, p2, v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    add-int/lit8 v0, v0, 0x2

    goto :goto_2f

    .line 64
    :cond_3e
    invoke-virtual {p0, p1, v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEventAttributes(Ljava/lang/String;Ljava/util/HashMap;)V

    goto :goto_4

    .line 66
    .end local v0    # "i":I
    .end local v1    # "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_42
    const/4 v2, 0x0

    invoke-virtual {p0, p1, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEventAttributes(Ljava/lang/String;Ljava/util/HashMap;)V

    goto :goto_4
.end method

.method public tagEventAttributes(Ljava/lang/String;Ljava/util/HashMap;)V
    .registers 4
    .param p1, "theTag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p2, "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->mInstance:Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;

    if-eqz v0, :cond_9

    .line 47
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->mInstance:Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;

    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;->recordTag(Ljava/lang/String;Ljava/util/HashMap;)Z

    .line 49
    :cond_9
    return-void
.end method

.method public trackBeginPurchaseFlow(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "packIdentifier"    # Ljava/lang/String;
    .param p2, "whereFrom"    # Ljava/lang/String;

    .prologue
    .line 114
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 115
    .local v0, "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "pack"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    const-string v1, "from"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": purchase_initiated"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEventAttributes(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 118
    return-void
.end method

.method public trackContentInstalled(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "identifier"    # Ljava/lang/String;
    .param p2, "whereFrom"    # Ljava/lang/String;

    .prologue
    .line 104
    const-string v0, "content: installed"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "pack"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    const-string v3, "from"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    aput-object p2, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    .line 105
    return-void
.end method

.method public trackContentRestored(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "identifier"    # Ljava/lang/String;
    .param p2, "whereFrom"    # Ljava/lang/String;

    .prologue
    .line 100
    const-string v0, "content: restored"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "pack"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    const/4 v2, 0x2

    const-string v3, "from"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    aput-object p2, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;[Ljava/lang/String;)V

    .line 101
    return-void
.end method

.method public trackEndPurchaseFlow(Ljava/lang/String;Ljava/lang/String;ZI)V
    .registers 8
    .param p1, "packIdentifier"    # Ljava/lang/String;
    .param p2, "whereFrom"    # Ljava/lang/String;
    .param p3, "success"    # Z
    .param p4, "clickedFromPosition"    # I

    .prologue
    .line 125
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 126
    .local v0, "attributes":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "pack"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    const-string v1, "from"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    const-string v2, "success"

    if-eqz p3, :cond_2a

    const-string v1, "true"

    :goto_15
    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    const/4 v1, -0x1

    if-eq p4, v1, :cond_24

    .line 130
    const-string v1, "position"

    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    :cond_24
    const-string v1, "content: purchased"

    invoke-virtual {p0, v1, v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEventAttributes(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 133
    return-void

    .line 128
    :cond_2a
    const-string v1, "false"

    goto :goto_15
.end method

.method public upload()V
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->mInstance:Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;

    if-eqz v0, :cond_9

    .line 78
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->mInstance:Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AbstractTracker;->upload()V

    .line 80
    :cond_9
    return-void
.end method
