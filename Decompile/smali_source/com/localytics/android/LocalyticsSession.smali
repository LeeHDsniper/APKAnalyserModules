.class public Lcom/localytics/android/LocalyticsSession;
.super Ljava/lang/Object;
.source "LocalyticsSession.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/LocalyticsSession$ProfileDbAction;
    }
.end annotation


# static fields
.field private static final sLocalyticsSessionHandlerMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/localytics/android/SessionHandler;",
            ">;"
        }
    .end annotation
.end field

.field private static final sLocalyticsSessionIntrinsicLock:[Ljava/lang/Object;

.field protected static final sSessionHandlerThread:Landroid/os/HandlerThread;


# instance fields
.field protected final mContext:Landroid/content/Context;

.field private final mSessionHandler:Lcom/localytics/android/SessionHandler;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 148
    const-class v0, Lcom/localytics/android/SessionHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/localytics/android/LocalyticsSession;->getHandlerThread(Ljava/lang/String;)Landroid/os/HandlerThread;

    move-result-object v0

    sput-object v0, Lcom/localytics/android/LocalyticsSession;->sSessionHandlerThread:Landroid/os/HandlerThread;

    .line 174
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/localytics/android/LocalyticsSession;->sLocalyticsSessionHandlerMap:Ljava/util/Map;

    .line 179
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Lcom/localytics/android/LocalyticsSession;->sLocalyticsSessionIntrinsicLock:[Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 248
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/localytics/android/LocalyticsSession;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 249
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 263
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/localytics/android/LocalyticsSession;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    return-void
.end method

.method constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "referrerID"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 278
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 279
    if-nez p1, :cond_e

    .line 281
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "context cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 284
    :cond_e
    move-object v0, p2

    .line 285
    .local v0, "appKey":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_19

    .line 287
    invoke-static {p1}, Lcom/localytics/android/DatapointHelper;->getLocalyticsAppKeyOrNull(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 290
    :cond_19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 292
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "key cannot be null or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 301
    :cond_27
    const-string v2, "com.localytics.android"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_68

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.test.IsolatedContext"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_68

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.test.RenamingDelegatingContext"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_68

    .line 304
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "context.getPackageName() returned %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 318
    :cond_68
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.test.RenamingDelegatingContext"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_82

    sget v2, Lcom/localytics/android/Constants;->CURRENT_API_LEVEL:I

    const/16 v3, 0x8

    if-lt v2, v3, :cond_82

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .end local p1    # "context":Landroid/content/Context;
    :cond_82
    iput-object p1, p0, Lcom/localytics/android/LocalyticsSession;->mContext:Landroid/content/Context;

    .line 320
    sget-object v3, Lcom/localytics/android/LocalyticsSession;->sLocalyticsSessionIntrinsicLock:[Ljava/lang/Object;

    monitor-enter v3

    .line 322
    :try_start_87
    sget-object v2, Lcom/localytics/android/LocalyticsSession;->sLocalyticsSessionHandlerMap:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/localytics/android/SessionHandler;

    .line 324
    .local v1, "handler":Lcom/localytics/android/SessionHandler;
    if-nez v1, :cond_a2

    .line 326
    iget-object v2, p0, Lcom/localytics/android/LocalyticsSession;->mContext:Landroid/content/Context;

    sget-object v4, Lcom/localytics/android/LocalyticsSession;->sSessionHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v4}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-virtual {p0, v2, v0, v4}, Lcom/localytics/android/LocalyticsSession;->createSessionHandler(Landroid/content/Context;Ljava/lang/String;Landroid/os/Looper;)Lcom/localytics/android/SessionHandler;

    move-result-object v1

    .line 327
    sget-object v2, Lcom/localytics/android/LocalyticsSession;->sLocalyticsSessionHandlerMap:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    :cond_a2
    const/4 v2, 0x0

    invoke-virtual {v1, v2, p3}, Lcom/localytics/android/SessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/localytics/android/SessionHandler;->sendMessage(Landroid/os/Message;)Z

    .line 337
    iput-object v1, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    .line 338
    monitor-exit v3

    .line 339
    return-void

    .line 338
    .end local v1    # "handler":Lcom/localytics/android/SessionHandler;
    :catchall_ae
    move-exception v2

    monitor-exit v3
    :try_end_b0
    .catchall {:try_start_87 .. :try_end_b0} :catchall_ae

    throw v2
.end method

.method private static convertDimensionsToAttributes(Ljava/util/List;)Ljava/util/Map;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1274
    .local p0, "customDimensions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 1276
    .local v0, "attributes":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p0, :cond_75

    .line 1278
    const/4 v3, 0x0

    .line 1279
    .local v3, "index":I
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_75

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1281
    .local v1, "element":Ljava/lang/String;
    if-nez v3, :cond_22

    .line 1283
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_1:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1322
    :cond_1f
    :goto_1f
    add-int/lit8 v3, v3, 0x1

    goto :goto_c

    .line 1285
    :cond_22
    const/4 v4, 0x1

    if-ne v4, v3, :cond_2b

    .line 1287
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_2:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 1289
    :cond_2b
    const/4 v4, 0x2

    if-ne v4, v3, :cond_34

    .line 1291
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_3:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 1293
    :cond_34
    const/4 v4, 0x3

    if-ne v4, v3, :cond_3d

    .line 1295
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_4:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 1297
    :cond_3d
    const/4 v4, 0x4

    if-ne v4, v3, :cond_46

    .line 1299
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_5:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 1301
    :cond_46
    const/4 v4, 0x5

    if-ne v4, v3, :cond_4f

    .line 1303
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_6:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 1305
    :cond_4f
    const/4 v4, 0x6

    if-ne v4, v3, :cond_58

    .line 1307
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_7:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 1309
    :cond_58
    const/4 v4, 0x7

    if-ne v4, v3, :cond_61

    .line 1311
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_8:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 1313
    :cond_61
    const/16 v4, 0x8

    if-ne v4, v3, :cond_6b

    .line 1315
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_9:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 1317
    :cond_6b
    const/16 v4, 0x9

    if-ne v4, v3, :cond_1f

    .line 1319
    sget-object v4, Lcom/localytics/android/LocalyticsProvider$AttributesDbColumns;->ATTRIBUTE_CUSTOM_DIMENSION_10:Ljava/lang/String;

    invoke-virtual {v0, v4, v1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    .line 1326
    .end local v1    # "element":Ljava/lang/String;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "index":I
    :cond_75
    return-object v0
.end method

.method private static getHandlerThread(Ljava/lang/String;)Landroid/os/HandlerThread;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 158
    new-instance v0, Landroid/os/HandlerThread;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 160
    .local v0, "thread":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 167
    return-object v0
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 447
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/localytics/android/LocalyticsSession;->close(Ljava/util/List;)V

    .line 448
    return-void
.end method

.method public close(Ljava/util/List;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "customDimensions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v8, 0xa

    const/4 v7, 0x2

    .line 469
    if-eqz p1, :cond_67

    .line 475
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_16

    .line 477
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_16

    .line 479
    const-string v2, "Localytics"

    const-string v3, "customDimensions is empty.  Did the caller make an error?"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 483
    :cond_16
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, v8, :cond_3f

    .line 485
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_3f

    .line 487
    const-string v2, "Localytics"

    const-string v3, "customDimensions size is %d, exceeding the maximum size of %d.  Did the caller make an error?"

    new-array v4, v7, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    :cond_3f
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_43
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_67

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 493
    .local v0, "element":Ljava/lang/String;
    if-nez v0, :cond_59

    .line 495
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "customDimensions cannot contain null elements"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 497
    :cond_59
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_43

    .line 499
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "customDimensions cannot contain empty elements"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 505
    .end local v0    # "element":Ljava/lang/String;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_67
    if-eqz p1, :cond_6f

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_75

    .line 507
    :cond_6f
    iget-object v2, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    invoke-virtual {v2, v7}, Lcom/localytics/android/SessionHandler;->sendEmptyMessage(I)Z

    .line 513
    :goto_74
    return-void

    .line 511
    :cond_75
    iget-object v2, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    iget-object v3, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    new-instance v4, Ljava/util/TreeMap;

    invoke-static {p1}, Lcom/localytics/android/LocalyticsSession;->convertDimensionsToAttributes(Ljava/util/List;)Ljava/util/Map;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v3, v7, v4}, Lcom/localytics/android/SessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/localytics/android/SessionHandler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_74
.end method

.method protected createSessionHandler(Landroid/content/Context;Ljava/lang/String;Landroid/os/Looper;)Lcom/localytics/android/SessionHandler;
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "appKey"    # Ljava/lang/String;
    .param p3, "looper"    # Landroid/os/Looper;

    .prologue
    .line 199
    const/4 v2, 0x0

    .line 202
    .local v2, "handler":Lcom/localytics/android/SessionHandler;
    :try_start_1
    const-string v4, "com.localytics.android.AmpSessionHandler"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/content/Context;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-class v7, Landroid/os/Looper;

    aput-object v7, v5, v6

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    const/4 v7, 0x1

    aput-object p2, v6, v7

    const/4 v7, 0x2

    aput-object p3, v6, v7

    invoke-static {v4, v5, v6}, Lcom/localytics/android/ReflectionUtils;->tryInvokeConstructor(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lcom/localytics/android/SessionHandler;

    move-object v2, v0

    .line 207
    if-nez v2, :cond_3a

    .line 209
    new-instance v4, Ljava/lang/Exception;

    invoke-direct {v4}, Ljava/lang/Exception;-><init>()V

    throw v4
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_31} :catch_31
    .catchall {:try_start_1 .. :try_end_31} :catchall_3c

    .line 212
    :catch_31
    move-exception v1

    move-object v3, v2

    .line 214
    .end local v2    # "handler":Lcom/localytics/android/SessionHandler;
    .local v1, "e":Ljava/lang/Exception;
    .local v3, "handler":Lcom/localytics/android/SessionHandler;
    :try_start_33
    new-instance v2, Lcom/localytics/android/SessionHandler;

    invoke-direct {v2, p1, p2, p3}, Lcom/localytics/android/SessionHandler;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/Looper;)V
    :try_end_38
    .catchall {:try_start_33 .. :try_end_38} :catchall_3f

    .end local v3    # "handler":Lcom/localytics/android/SessionHandler;
    .restart local v2    # "handler":Lcom/localytics/android/SessionHandler;
    move-object v3, v2

    .line 218
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "handler":Lcom/localytics/android/SessionHandler;
    .local v3, "handler":Ljava/lang/Object;
    :goto_39
    return-object v3

    .end local v3    # "handler":Ljava/lang/Object;
    .restart local v2    # "handler":Lcom/localytics/android/SessionHandler;
    :cond_3a
    move-object v3, v2

    .restart local v3    # "handler":Ljava/lang/Object;
    goto :goto_39

    .end local v3    # "handler":Ljava/lang/Object;
    :catchall_3c
    move-exception v4

    :goto_3d
    move-object v3, v2

    .restart local v3    # "handler":Ljava/lang/Object;
    goto :goto_39

    .end local v2    # "handler":Lcom/localytics/android/SessionHandler;
    .restart local v1    # "e":Ljava/lang/Exception;
    .local v3, "handler":Lcom/localytics/android/SessionHandler;
    :catchall_3f
    move-exception v4

    move-object v2, v3

    .end local v3    # "handler":Lcom/localytics/android/SessionHandler;
    .restart local v2    # "handler":Lcom/localytics/android/SessionHandler;
    goto :goto_3d
.end method

.method getSessionHandler()Lcom/localytics/android/SessionHandler;
    .registers 2

    .prologue
    .line 229
    iget-object v0, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    return-object v0
.end method

.method public handleNotificationReceived(Landroid/content/Intent;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 924
    iget-object v0, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    iget-object v1, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    const/16 v2, 0x15

    invoke-virtual {v1, v2, p1}, Lcom/localytics/android/SessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/localytics/android/SessionHandler;->sendMessage(Landroid/os/Message;)Z

    .line 925
    return-void
.end method

.method public handleRegistration(Landroid/content/Intent;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 919
    iget-object v0, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    iget-object v1, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    const/16 v2, 0x14

    invoke-virtual {v1, v2, p1}, Lcom/localytics/android/SessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/localytics/android/SessionHandler;->sendMessage(Landroid/os/Message;)Z

    .line 920
    return-void
.end method

.method public open()V
    .registers 2

    .prologue
    .line 367
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/localytics/android/LocalyticsSession;->open(Ljava/util/List;)V

    .line 368
    return-void
.end method

.method public open(Ljava/util/List;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "customDimensions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v8, 0xa

    const/4 v7, 0x1

    .line 394
    if-eqz p1, :cond_67

    .line 400
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_16

    .line 402
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_16

    .line 404
    const-string v2, "Localytics"

    const-string v3, "customDimensions is empty.  Did the caller make an error?"

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 408
    :cond_16
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, v8, :cond_3f

    .line 410
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_3f

    .line 412
    const-string v2, "Localytics"

    const-string v3, "customDimensions size is %d, exceeding the maximum size of %d.  Did the caller make an error?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 416
    :cond_3f
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_43
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_67

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 418
    .local v0, "element":Ljava/lang/String;
    if-nez v0, :cond_59

    .line 420
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "customDimensions cannot contain null elements"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 422
    :cond_59
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_43

    .line 424
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "customDimensions cannot contain empty elements"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 430
    .end local v0    # "element":Ljava/lang/String;
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_67
    if-eqz p1, :cond_6f

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_75

    .line 432
    :cond_6f
    iget-object v2, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    invoke-virtual {v2, v7}, Lcom/localytics/android/SessionHandler;->sendEmptyMessage(I)Z

    .line 438
    :goto_74
    return-void

    .line 436
    :cond_75
    iget-object v2, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    iget-object v3, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    new-instance v4, Ljava/util/TreeMap;

    invoke-static {p1}, Lcom/localytics/android/LocalyticsSession;->convertDimensionsToAttributes(Ljava/util/List;)Ljava/util/Map;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/TreeMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v3, v7, v4}, Lcom/localytics/android/SessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/localytics/android/SessionHandler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_74
.end method

.method public tagEvent(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;)V
    .registers 10
    .param p1, "event"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 566
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "customDimensions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/localytics/android/LocalyticsSession;->tagEvent(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;J)V

    .line 567
    return-void
.end method

.method public tagEvent(Ljava/lang/String;Ljava/util/Map;Ljava/util/List;J)V
    .registers 20
    .param p1, "event"    # Ljava/lang/String;
    .param p4, "customerValueIncrease"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;J)V"
        }
    .end annotation

    .prologue
    .line 615
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "customDimensions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez p1, :cond_a

    .line 617
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "event cannot be null"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 620
    :cond_a
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_18

    .line 622
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "event cannot be empty"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 625
    :cond_18
    if-eqz p2, :cond_a9

    .line 631
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_2b

    .line 633
    sget-boolean v8, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v8, :cond_2b

    .line 635
    const-string v8, "Localytics"

    const-string v9, "attributes is empty.  Did the caller make an error?"

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 639
    :cond_2b
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->size()I

    move-result v8

    const/16 v9, 0x32

    if-le v8, v9, :cond_59

    .line 641
    sget-boolean v8, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v8, :cond_59

    .line 643
    const-string v8, "Localytics"

    const-string v9, "attributes size is %d, exceeding the maximum size of %d.  Did the caller make an error?"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->size()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const/16 v12, 0x32

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 647
    :cond_59
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_61
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 649
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 650
    .local v4, "key":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 652
    .local v7, "value":Ljava/lang/String;
    if-nez v4, :cond_83

    .line 654
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "attributes cannot contain null keys"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 656
    :cond_83
    if-nez v7, :cond_8d

    .line 658
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "attributes cannot contain null values"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 660
    :cond_8d
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_9b

    .line 662
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "attributes cannot contain empty keys"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 664
    :cond_9b
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_61

    .line 666
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "attributes cannot contain empty values"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 671
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "key":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/String;
    :cond_a9
    if-eqz p3, :cond_112

    .line 677
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_bc

    .line 679
    sget-boolean v8, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v8, :cond_bc

    .line 681
    const-string v8, "Localytics"

    const-string v9, "customDimensions is empty.  Did the caller make an error?"

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 685
    :cond_bc
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v8

    const/16 v9, 0xa

    if-le v8, v9, :cond_ea

    .line 687
    sget-boolean v8, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v8, :cond_ea

    .line 689
    const-string v8, "Localytics"

    const-string v9, "customDimensions size is %d, exceeding the maximum size of %d.  Did the caller make an error?"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    const/16 v12, 0xa

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 693
    :cond_ea
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_ee
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_112

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 695
    .local v0, "element":Ljava/lang/String;
    if-nez v0, :cond_104

    .line 697
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "customDimensions cannot contain null elements"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 699
    :cond_104
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_ee

    .line 701
    new-instance v8, Ljava/lang/IllegalArgumentException;

    const-string v9, "customDimensions cannot contain empty elements"

    invoke-direct {v8, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 707
    .end local v0    # "element":Ljava/lang/String;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_112
    const-string v8, "%s:%s"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/localytics/android/LocalyticsSession;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    aput-object p1, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 709
    .local v2, "eventString":Ljava/lang/String;
    if-nez p2, :cond_149

    if-nez p3, :cond_149

    .line 711
    iget-object v8, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    iget-object v9, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    const/4 v10, 0x3

    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v2, v11, v12

    const/4 v12, 0x1

    const/4 v13, 0x0

    aput-object v13, v11, v12

    const/4 v12, 0x2

    invoke-static/range {p4 .. p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v9, v10, v11}, Lcom/localytics/android/SessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/localytics/android/SessionHandler;->sendMessage(Landroid/os/Message;)Z

    .line 744
    :goto_148
    return-void

    .line 718
    :cond_149
    new-instance v6, Ljava/util/TreeMap;

    invoke-direct {v6}, Ljava/util/TreeMap;-><init>()V

    .line 720
    .local v6, "remappedAttributes":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p2, :cond_185

    .line 722
    iget-object v8, p0, Lcom/localytics/android/LocalyticsSession;->mContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    .line 723
    .local v5, "packageName":Ljava/lang/String;
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :goto_15e
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_185

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 725
    .restart local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v8, "%s:%s"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v5, v9, v10

    const/4 v10, 0x1

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_15e

    .line 729
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "packageName":Ljava/lang/String;
    :cond_185
    if-eqz p3, :cond_18e

    .line 731
    invoke-static/range {p3 .. p3}, Lcom/localytics/android/LocalyticsSession;->convertDimensionsToAttributes(Ljava/util/List;)Ljava/util/Map;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/TreeMap;->putAll(Ljava/util/Map;)V

    .line 742
    :cond_18e
    iget-object v8, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    iget-object v9, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    const/4 v10, 0x3

    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v2, v11, v12

    const/4 v12, 0x1

    new-instance v13, Ljava/util/TreeMap;

    invoke-direct {v13, v6}, Ljava/util/TreeMap;-><init>(Ljava/util/SortedMap;)V

    aput-object v13, v11, v12

    const/4 v12, 0x2

    invoke-static/range {p4 .. p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v9, v10, v11}, Lcom/localytics/android/SessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/localytics/android/SessionHandler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_148
.end method

.method public upload()V
    .registers 1

    .prologue
    .line 1123
    invoke-virtual {p0}, Lcom/localytics/android/LocalyticsSession;->uploadAnalytics()V

    .line 1124
    invoke-virtual {p0}, Lcom/localytics/android/LocalyticsSession;->uploadProfile()V

    .line 1125
    return-void
.end method

.method protected uploadAnalytics()V
    .registers 5

    .prologue
    .line 1132
    iget-object v0, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    iget-object v1, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    const/4 v2, 0x4

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/localytics/android/SessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/localytics/android/SessionHandler;->sendMessage(Landroid/os/Message;)Z

    .line 1133
    return-void
.end method

.method protected uploadProfile()V
    .registers 5

    .prologue
    .line 1140
    iget-object v0, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    iget-object v1, p0, Lcom/localytics/android/LocalyticsSession;->mSessionHandler:Lcom/localytics/android/SessionHandler;

    const/16 v2, 0x11

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/localytics/android/SessionHandler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/localytics/android/SessionHandler;->sendMessage(Landroid/os/Message;)Z

    .line 1141
    return-void
.end method
