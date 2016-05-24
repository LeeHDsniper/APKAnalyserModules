.class public Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
.super Ljava/lang/Object;
.source "AdobeNetworkHttpTaskHandle.java"


# instance fields
.field private _accessToken:Ljava/lang/String;

.field private _hasFinished:Z

.field protected _isCancelled:Z

.field private _notifyHandler:Landroid/os/Handler;

.field private _progressPercent:I

.field private listeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private netTaskFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->netTaskFuture:Ljava/util/concurrent/Future;

    .line 30
    iput v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->_progressPercent:I

    .line 31
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->_accessToken:Ljava/lang/String;

    .line 32
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->listeners:Ljava/util/ArrayList;

    .line 33
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->_isCancelled:Z

    .line 34
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->_hasFinished:Z

    .line 35
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->_notifyHandler:Landroid/os/Handler;

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->listeners:Ljava/util/ArrayList;

    .line 40
    return-void
.end method

.method static synthetic access$002(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;
    .param p1, "x1"    # I

    .prologue
    .line 27
    iput p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->_progressPercent:I

    return p1
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->listeners:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized cancel()V
    .registers 3

    .prologue
    .line 67
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->netTaskFuture:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_b

    .line 68
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->netTaskFuture:Ljava/util/concurrent/Future;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 69
    :cond_b
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->_isCancelled:Z
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    .line 70
    monitor-exit p0

    return-void

    .line 67
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getAccessToken()Ljava/lang/String;
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->_accessToken:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized isCancelled()Z
    .registers 2

    .prologue
    .line 74
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->_isCancelled:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized markFinished()V
    .registers 2

    .prologue
    .line 115
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->_hasFinished:Z
    :try_end_4
    .catchall {:try_start_2 .. :try_end_4} :catchall_6

    .line 116
    monitor-exit p0

    return-void

    .line 115
    :catchall_6
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized notifyProgress(I)V
    .registers 4
    .param p1, "progressPercent"    # I

    .prologue
    .line 89
    monitor-enter p0

    :try_start_1
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle$1;

    invoke-direct {v0, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle$1;-><init>(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;I)V

    .line 99
    .local v0, "notifyProgress":Ljava/lang/Runnable;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->_notifyHandler:Landroid/os/Handler;

    if-eqz v1, :cond_11

    .line 100
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->_notifyHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_15

    .line 104
    :goto_f
    monitor-exit p0

    return-void

    .line 102
    :cond_11
    :try_start_11
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_15

    goto :goto_f

    .line 89
    .end local v0    # "notifyProgress":Ljava/lang/Runnable;
    :catchall_15
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public registerListener(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    return-void
.end method

.method setAccessTokenForRequest(Ljava/lang/String;)V
    .registers 2
    .param p1, "accessToken"    # Ljava/lang/String;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->_accessToken:Ljava/lang/String;

    .line 58
    return-void
.end method

.method public declared-synchronized setFuture(Ljava/util/concurrent/Future;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Future",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "taskFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;>;"
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->netTaskFuture:Ljava/util/concurrent/Future;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 48
    monitor-exit p0

    return-void

    .line 47
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setNotifyHandler(Landroid/os/Handler;)V
    .registers 3
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 43
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->_notifyHandler:Landroid/os/Handler;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 44
    monitor-exit p0

    return-void

    .line 43
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public unregisterListener(Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;)V
    .registers 3
    .param p1, "listener"    # Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkHttpTaskHandleListener;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;->listeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 85
    return-void
.end method
