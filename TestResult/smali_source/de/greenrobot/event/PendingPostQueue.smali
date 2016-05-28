.class final Lde/greenrobot/event/PendingPostQueue;
.super Ljava/lang/Object;
.source "PendingPostQueue.java"


# instance fields
.field private head:Lde/greenrobot/event/PendingPost;

.field private tail:Lde/greenrobot/event/PendingPost;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method declared-synchronized enqueue(Lde/greenrobot/event/PendingPost;)V
    .registers 4
    .param p1, "pendingPost"    # Lde/greenrobot/event/PendingPost;

    .prologue
    .line 8
    monitor-enter p0

    if-nez p1, :cond_e

    .line 9
    :try_start_3
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "null cannot be enqueued"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_b

    .line 8
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0

    .line 11
    :cond_e
    :try_start_e
    iget-object v0, p0, Lde/greenrobot/event/PendingPostQueue;->tail:Lde/greenrobot/event/PendingPost;

    if-eqz v0, :cond_1d

    .line 12
    iget-object v0, p0, Lde/greenrobot/event/PendingPostQueue;->tail:Lde/greenrobot/event/PendingPost;

    iput-object p1, v0, Lde/greenrobot/event/PendingPost;->next:Lde/greenrobot/event/PendingPost;

    .line 13
    iput-object p1, p0, Lde/greenrobot/event/PendingPostQueue;->tail:Lde/greenrobot/event/PendingPost;

    .line 19
    :goto_18
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_1b
    .catchall {:try_start_e .. :try_end_1b} :catchall_b

    .line 20
    monitor-exit p0

    return-void

    .line 14
    :cond_1d
    :try_start_1d
    iget-object v0, p0, Lde/greenrobot/event/PendingPostQueue;->head:Lde/greenrobot/event/PendingPost;

    if-nez v0, :cond_26

    .line 15
    iput-object p1, p0, Lde/greenrobot/event/PendingPostQueue;->tail:Lde/greenrobot/event/PendingPost;

    iput-object p1, p0, Lde/greenrobot/event/PendingPostQueue;->head:Lde/greenrobot/event/PendingPost;

    goto :goto_18

    .line 17
    :cond_26
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Head present, but no tail"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2e
    .catchall {:try_start_1d .. :try_end_2e} :catchall_b
.end method

.method declared-synchronized poll()Lde/greenrobot/event/PendingPost;
    .registers 3

    .prologue
    .line 23
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lde/greenrobot/event/PendingPostQueue;->head:Lde/greenrobot/event/PendingPost;

    .line 24
    .local v0, "pendingPost":Lde/greenrobot/event/PendingPost;
    iget-object v1, p0, Lde/greenrobot/event/PendingPostQueue;->head:Lde/greenrobot/event/PendingPost;

    if-eqz v1, :cond_14

    .line 25
    iget-object v1, p0, Lde/greenrobot/event/PendingPostQueue;->head:Lde/greenrobot/event/PendingPost;

    iget-object v1, v1, Lde/greenrobot/event/PendingPost;->next:Lde/greenrobot/event/PendingPost;

    iput-object v1, p0, Lde/greenrobot/event/PendingPostQueue;->head:Lde/greenrobot/event/PendingPost;

    .line 26
    iget-object v1, p0, Lde/greenrobot/event/PendingPostQueue;->head:Lde/greenrobot/event/PendingPost;

    if-nez v1, :cond_14

    .line 27
    const/4 v1, 0x0

    iput-object v1, p0, Lde/greenrobot/event/PendingPostQueue;->tail:Lde/greenrobot/event/PendingPost;
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    .line 30
    :cond_14
    monitor-exit p0

    return-object v0

    .line 23
    .end local v0    # "pendingPost":Lde/greenrobot/event/PendingPost;
    :catchall_16
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method declared-synchronized poll(I)Lde/greenrobot/event/PendingPost;
    .registers 4
    .param p1, "maxMillisToWait"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 34
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lde/greenrobot/event/PendingPostQueue;->head:Lde/greenrobot/event/PendingPost;

    if-nez v0, :cond_9

    .line 35
    int-to-long v0, p1

    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    .line 37
    :cond_9
    invoke-virtual {p0}, Lde/greenrobot/event/PendingPostQueue;->poll()Lde/greenrobot/event/PendingPost;
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_f

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 34
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method
