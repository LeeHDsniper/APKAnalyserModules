.class public final Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;
.super Ljava/lang/Object;
.source "EventBusUtils.java"


# static fields
.field static final S_INSTANCE:Lde/greenrobot/event/EventBus;

.field static count:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 12
    invoke-static {}, Lde/greenrobot/event/EventBus;->getDefault()Lde/greenrobot/event/EventBus;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->S_INSTANCE:Lde/greenrobot/event/EventBus;

    .line 13
    const/4 v0, 0x0

    sput v0, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->count:I

    return-void
.end method

.method public static declared-synchronized getInstance()Lde/greenrobot/event/EventBus;
    .registers 2

    .prologue
    .line 19
    const-class v0, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->S_INSTANCE:Lde/greenrobot/event/EventBus;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_7

    monitor-exit v0

    return-object v1

    :catchall_7
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized register(Ljava/lang/Object;)V
    .registers 6
    .param p0, "subscriber"    # Ljava/lang/Object;

    .prologue
    .line 34
    const-class v2, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;

    monitor-enter v2

    :try_start_3
    sget-object v1, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->S_INSTANCE:Lde/greenrobot/event/EventBus;

    invoke-virtual {v1, p0}, Lde/greenrobot/event/EventBus;->isRegistered(Ljava/lang/Object;)Z
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_41

    move-result v1

    if-nez v1, :cond_44

    .line 36
    :try_start_b
    sget-object v1, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->S_INSTANCE:Lde/greenrobot/event/EventBus;

    invoke-virtual {v1, p0}, Lde/greenrobot/event/EventBus;->register(Ljava/lang/Object;)V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_10} :catch_3c
    .catchall {:try_start_b .. :try_end_10} :catchall_41

    .line 40
    :goto_10
    :try_start_10
    sget v1, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->count:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->count:I

    .line 41
    const-string v1, "EventBusUtils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "registered("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "). totals: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget v4, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->count:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3a
    .catchall {:try_start_10 .. :try_end_3a} :catchall_41

    .line 45
    :goto_3a
    monitor-exit v2

    return-void

    .line 37
    :catch_3c
    move-exception v0

    .line 38
    .local v0, "e":Ljava/lang/Exception;
    :try_start_3d
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_40
    .catchall {:try_start_3d .. :try_end_40} :catchall_41

    goto :goto_10

    .line 34
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_41
    move-exception v1

    monitor-exit v2

    throw v1

    .line 43
    :cond_44
    :try_start_44
    const-string v1, "EventBusUtils"

    const-string v3, "cannot register (already registered)"

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4b
    .catchall {:try_start_44 .. :try_end_4b} :catchall_41

    goto :goto_3a
.end method

.method public static declared-synchronized unregister(Ljava/lang/Object;)V
    .registers 5
    .param p0, "subscriber"    # Ljava/lang/Object;

    .prologue
    .line 23
    const-class v1, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->S_INSTANCE:Lde/greenrobot/event/EventBus;

    invoke-virtual {v0, p0}, Lde/greenrobot/event/EventBus;->isRegistered(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 24
    sget-object v0, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->S_INSTANCE:Lde/greenrobot/event/EventBus;

    invoke-virtual {v0, p0}, Lde/greenrobot/event/EventBus;->unregister(Ljava/lang/Object;)V

    .line 25
    sget v0, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->count:I

    add-int/lit8 v0, v0, -0x1

    sput v0, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->count:I

    .line 26
    const-string v0, "EventBusUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unregistered("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "). totals: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/adobe/creativesdk/aviary/utils/EventBusUtils;->count:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3a
    .catchall {:try_start_3 .. :try_end_3a} :catchall_44

    .line 31
    :goto_3a
    monitor-exit v1

    return-void

    .line 28
    :cond_3c
    :try_start_3c
    const-string v0, "EventBusUtils"

    const-string v2, "cannot unregister (not registered)"

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_43
    .catchall {:try_start_3c .. :try_end_43} :catchall_44

    goto :goto_3a

    .line 23
    :catchall_44
    move-exception v0

    monitor-exit v1

    throw v0
.end method
