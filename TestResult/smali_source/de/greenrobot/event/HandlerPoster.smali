.class final Lde/greenrobot/event/HandlerPoster;
.super Landroid/os/Handler;
.source "HandlerPoster.java"


# instance fields
.field private final eventBus:Lde/greenrobot/event/EventBus;

.field private handlerActive:Z

.field private final maxMillisInsideHandleMessage:I

.field private final queue:Lde/greenrobot/event/PendingPostQueue;


# direct methods
.method constructor <init>(Lde/greenrobot/event/EventBus;Landroid/os/Looper;I)V
    .registers 5
    .param p1, "eventBus"    # Lde/greenrobot/event/EventBus;
    .param p2, "looper"    # Landroid/os/Looper;
    .param p3, "maxMillisInsideHandleMessage"    # I

    .prologue
    .line 31
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 32
    iput-object p1, p0, Lde/greenrobot/event/HandlerPoster;->eventBus:Lde/greenrobot/event/EventBus;

    .line 33
    iput p3, p0, Lde/greenrobot/event/HandlerPoster;->maxMillisInsideHandleMessage:I

    .line 34
    new-instance v0, Lde/greenrobot/event/PendingPostQueue;

    invoke-direct {v0}, Lde/greenrobot/event/PendingPostQueue;-><init>()V

    iput-object v0, p0, Lde/greenrobot/event/HandlerPoster;->queue:Lde/greenrobot/event/PendingPostQueue;

    .line 35
    return-void
.end method


# virtual methods
.method enqueue(Lde/greenrobot/event/Subscription;Ljava/lang/Object;)V
    .registers 6
    .param p1, "subscription"    # Lde/greenrobot/event/Subscription;
    .param p2, "event"    # Ljava/lang/Object;

    .prologue
    .line 38
    invoke-static {p1, p2}, Lde/greenrobot/event/PendingPost;->obtainPendingPost(Lde/greenrobot/event/Subscription;Ljava/lang/Object;)Lde/greenrobot/event/PendingPost;

    move-result-object v0

    .line 39
    .local v0, "pendingPost":Lde/greenrobot/event/PendingPost;
    monitor-enter p0

    .line 40
    :try_start_5
    iget-object v1, p0, Lde/greenrobot/event/HandlerPoster;->queue:Lde/greenrobot/event/PendingPostQueue;

    invoke-virtual {v1, v0}, Lde/greenrobot/event/PendingPostQueue;->enqueue(Lde/greenrobot/event/PendingPost;)V

    .line 41
    iget-boolean v1, p0, Lde/greenrobot/event/HandlerPoster;->handlerActive:Z

    if-nez v1, :cond_26

    .line 42
    const/4 v1, 0x1

    iput-boolean v1, p0, Lde/greenrobot/event/HandlerPoster;->handlerActive:Z

    .line 43
    invoke-virtual {p0}, Lde/greenrobot/event/HandlerPoster;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    invoke-virtual {p0, v1}, Lde/greenrobot/event/HandlerPoster;->sendMessage(Landroid/os/Message;)Z

    move-result v1

    if-nez v1, :cond_26

    .line 44
    new-instance v1, Lde/greenrobot/event/EventBusException;

    const-string v2, "Could not send handler message"

    invoke-direct {v1, v2}, Lde/greenrobot/event/EventBusException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 47
    :catchall_23
    move-exception v1

    monitor-exit p0
    :try_end_25
    .catchall {:try_start_5 .. :try_end_25} :catchall_23

    throw v1

    :cond_26
    :try_start_26
    monitor-exit p0
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_23

    .line 48
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 10
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 52
    const/4 v1, 0x0

    .line 54
    .local v1, "rescheduled":Z
    :try_start_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 56
    .local v2, "started":J
    :cond_5
    iget-object v6, p0, Lde/greenrobot/event/HandlerPoster;->queue:Lde/greenrobot/event/PendingPostQueue;

    invoke-virtual {v6}, Lde/greenrobot/event/PendingPostQueue;->poll()Lde/greenrobot/event/PendingPost;

    move-result-object v0

    .line 57
    .local v0, "pendingPost":Lde/greenrobot/event/PendingPost;
    if-nez v0, :cond_1e

    .line 58
    monitor-enter p0
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_42

    .line 60
    :try_start_e
    iget-object v6, p0, Lde/greenrobot/event/HandlerPoster;->queue:Lde/greenrobot/event/PendingPostQueue;

    invoke-virtual {v6}, Lde/greenrobot/event/PendingPostQueue;->poll()Lde/greenrobot/event/PendingPost;

    move-result-object v0

    .line 61
    if-nez v0, :cond_1d

    .line 62
    const/4 v6, 0x0

    iput-boolean v6, p0, Lde/greenrobot/event/HandlerPoster;->handlerActive:Z

    .line 63
    monitor-exit p0
    :try_end_1a
    .catchall {:try_start_e .. :try_end_1a} :catchall_46

    .line 78
    iput-boolean v1, p0, Lde/greenrobot/event/HandlerPoster;->handlerActive:Z

    :goto_1c
    return-void

    .line 65
    :cond_1d
    :try_start_1d
    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_1d .. :try_end_1e} :catchall_46

    .line 67
    :cond_1e
    :try_start_1e
    iget-object v6, p0, Lde/greenrobot/event/HandlerPoster;->eventBus:Lde/greenrobot/event/EventBus;

    invoke-virtual {v6, v0}, Lde/greenrobot/event/EventBus;->invokeSubscriber(Lde/greenrobot/event/PendingPost;)V

    .line 68
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    sub-long v4, v6, v2

    .line 69
    .local v4, "timeInMethod":J
    iget v6, p0, Lde/greenrobot/event/HandlerPoster;->maxMillisInsideHandleMessage:I

    int-to-long v6, v6

    cmp-long v6, v4, v6

    if-ltz v6, :cond_5

    .line 70
    invoke-virtual {p0}, Lde/greenrobot/event/HandlerPoster;->obtainMessage()Landroid/os/Message;

    move-result-object v6

    invoke-virtual {p0, v6}, Lde/greenrobot/event/HandlerPoster;->sendMessage(Landroid/os/Message;)Z

    move-result v6

    if-nez v6, :cond_49

    .line 71
    new-instance v6, Lde/greenrobot/event/EventBusException;

    const-string v7, "Could not send handler message"

    invoke-direct {v6, v7}, Lde/greenrobot/event/EventBusException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_42
    .catchall {:try_start_1e .. :try_end_42} :catchall_42

    .line 78
    .end local v0    # "pendingPost":Lde/greenrobot/event/PendingPost;
    .end local v2    # "started":J
    .end local v4    # "timeInMethod":J
    :catchall_42
    move-exception v6

    iput-boolean v1, p0, Lde/greenrobot/event/HandlerPoster;->handlerActive:Z

    throw v6

    .line 65
    .restart local v0    # "pendingPost":Lde/greenrobot/event/PendingPost;
    .restart local v2    # "started":J
    :catchall_46
    move-exception v6

    :try_start_47
    monitor-exit p0
    :try_end_48
    .catchall {:try_start_47 .. :try_end_48} :catchall_46

    :try_start_48
    throw v6
    :try_end_49
    .catchall {:try_start_48 .. :try_end_49} :catchall_42

    .line 73
    .restart local v4    # "timeInMethod":J
    :cond_49
    const/4 v1, 0x1

    .line 78
    iput-boolean v1, p0, Lde/greenrobot/event/HandlerPoster;->handlerActive:Z

    goto :goto_1c
.end method
