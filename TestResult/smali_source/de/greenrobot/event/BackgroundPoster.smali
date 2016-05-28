.class final Lde/greenrobot/event/BackgroundPoster;
.super Ljava/lang/Object;
.source "BackgroundPoster.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final eventBus:Lde/greenrobot/event/EventBus;

.field private volatile executorRunning:Z

.field private final queue:Lde/greenrobot/event/PendingPostQueue;


# direct methods
.method constructor <init>(Lde/greenrobot/event/EventBus;)V
    .registers 3
    .param p1, "eventBus"    # Lde/greenrobot/event/EventBus;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lde/greenrobot/event/BackgroundPoster;->eventBus:Lde/greenrobot/event/EventBus;

    .line 34
    new-instance v0, Lde/greenrobot/event/PendingPostQueue;

    invoke-direct {v0}, Lde/greenrobot/event/PendingPostQueue;-><init>()V

    iput-object v0, p0, Lde/greenrobot/event/BackgroundPoster;->queue:Lde/greenrobot/event/PendingPostQueue;

    .line 35
    return-void
.end method


# virtual methods
.method public enqueue(Lde/greenrobot/event/Subscription;Ljava/lang/Object;)V
    .registers 5
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
    iget-object v1, p0, Lde/greenrobot/event/BackgroundPoster;->queue:Lde/greenrobot/event/PendingPostQueue;

    invoke-virtual {v1, v0}, Lde/greenrobot/event/PendingPostQueue;->enqueue(Lde/greenrobot/event/PendingPost;)V

    .line 41
    iget-boolean v1, p0, Lde/greenrobot/event/BackgroundPoster;->executorRunning:Z

    if-nez v1, :cond_1a

    .line 42
    const/4 v1, 0x1

    iput-boolean v1, p0, Lde/greenrobot/event/BackgroundPoster;->executorRunning:Z

    .line 43
    iget-object v1, p0, Lde/greenrobot/event/BackgroundPoster;->eventBus:Lde/greenrobot/event/EventBus;

    invoke-virtual {v1}, Lde/greenrobot/event/EventBus;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-interface {v1, p0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 45
    :cond_1a
    monitor-exit p0

    .line 46
    return-void

    .line 45
    :catchall_1c
    move-exception v1

    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_5 .. :try_end_1e} :catchall_1c

    throw v1
.end method

.method public run()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 53
    :goto_1
    :try_start_1
    iget-object v2, p0, Lde/greenrobot/event/BackgroundPoster;->queue:Lde/greenrobot/event/PendingPostQueue;

    const/16 v3, 0x3e8

    invoke-virtual {v2, v3}, Lde/greenrobot/event/PendingPostQueue;->poll(I)Lde/greenrobot/event/PendingPost;

    move-result-object v1

    .line 54
    .local v1, "pendingPost":Lde/greenrobot/event/PendingPost;
    if-nez v1, :cond_1c

    .line 55
    monitor-enter p0
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_c} :catch_22
    .catchall {:try_start_1 .. :try_end_c} :catchall_49

    .line 57
    :try_start_c
    iget-object v2, p0, Lde/greenrobot/event/BackgroundPoster;->queue:Lde/greenrobot/event/PendingPostQueue;

    invoke-virtual {v2}, Lde/greenrobot/event/PendingPostQueue;->poll()Lde/greenrobot/event/PendingPost;

    move-result-object v1

    .line 58
    if-nez v1, :cond_1b

    .line 59
    const/4 v2, 0x0

    iput-boolean v2, p0, Lde/greenrobot/event/BackgroundPoster;->executorRunning:Z

    .line 60
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_c .. :try_end_18} :catchall_46

    .line 70
    iput-boolean v5, p0, Lde/greenrobot/event/BackgroundPoster;->executorRunning:Z

    .line 72
    .end local v1    # "pendingPost":Lde/greenrobot/event/PendingPost;
    :goto_1a
    return-void

    .line 62
    .restart local v1    # "pendingPost":Lde/greenrobot/event/PendingPost;
    :cond_1b
    :try_start_1b
    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_46

    .line 64
    :cond_1c
    :try_start_1c
    iget-object v2, p0, Lde/greenrobot/event/BackgroundPoster;->eventBus:Lde/greenrobot/event/EventBus;

    invoke-virtual {v2, v1}, Lde/greenrobot/event/EventBus;->invokeSubscriber(Lde/greenrobot/event/PendingPost;)V
    :try_end_21
    .catch Ljava/lang/InterruptedException; {:try_start_1c .. :try_end_21} :catch_22
    .catchall {:try_start_1c .. :try_end_21} :catchall_49

    goto :goto_1

    .line 66
    .end local v1    # "pendingPost":Lde/greenrobot/event/PendingPost;
    :catch_22
    move-exception v0

    .line 67
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_23
    const-string v2, "Event"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " was interruppted"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_43
    .catchall {:try_start_23 .. :try_end_43} :catchall_49

    .line 70
    iput-boolean v5, p0, Lde/greenrobot/event/BackgroundPoster;->executorRunning:Z

    goto :goto_1a

    .line 62
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .restart local v1    # "pendingPost":Lde/greenrobot/event/PendingPost;
    :catchall_46
    move-exception v2

    :try_start_47
    monitor-exit p0
    :try_end_48
    .catchall {:try_start_47 .. :try_end_48} :catchall_46

    :try_start_48
    throw v2
    :try_end_49
    .catch Ljava/lang/InterruptedException; {:try_start_48 .. :try_end_49} :catch_22
    .catchall {:try_start_48 .. :try_end_49} :catchall_49

    .line 70
    .end local v1    # "pendingPost":Lde/greenrobot/event/PendingPost;
    :catchall_49
    move-exception v2

    iput-boolean v5, p0, Lde/greenrobot/event/BackgroundPoster;->executorRunning:Z

    throw v2
.end method
