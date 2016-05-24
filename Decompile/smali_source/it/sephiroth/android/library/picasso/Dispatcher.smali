.class Lit/sephiroth/android/library/picasso/Dispatcher;
.super Ljava/lang/Object;
.source "Dispatcher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/picasso/Dispatcher$NetworkBroadcastReceiver;,
        Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherThread;,
        Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;
    }
.end annotation


# instance fields
.field airplaneMode:Z

.field final batch:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/picasso/BitmapHunter;",
            ">;"
        }
    .end annotation
.end field

.field final cache:Lit/sephiroth/android/library/picasso/Cache;

.field final context:Landroid/content/Context;

.field final dispatcherThread:Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherThread;

.field final downloader:Lit/sephiroth/android/library/picasso/Downloader;

.field final failedActions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Lit/sephiroth/android/library/picasso/Action;",
            ">;"
        }
    .end annotation
.end field

.field final handler:Landroid/os/Handler;

.field final hunterMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lit/sephiroth/android/library/picasso/BitmapHunter;",
            ">;"
        }
    .end annotation
.end field

.field final mainThreadHandler:Landroid/os/Handler;

.field final pausedActions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Lit/sephiroth/android/library/picasso/Action;",
            ">;"
        }
    .end annotation
.end field

.field final pausedTags:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final receiver:Lit/sephiroth/android/library/picasso/Dispatcher$NetworkBroadcastReceiver;

.field final scansNetworkChanges:Z

.field final service:Ljava/util/concurrent/ExecutorService;

.field final stats:Lit/sephiroth/android/library/picasso/Stats;

.field useBatch:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/util/concurrent/ExecutorService;Landroid/os/Handler;Lit/sephiroth/android/library/picasso/Downloader;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Stats;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "service"    # Ljava/util/concurrent/ExecutorService;
    .param p3, "mainThreadHandler"    # Landroid/os/Handler;
    .param p4, "downloader"    # Lit/sephiroth/android/library/picasso/Downloader;
    .param p5, "cache"    # Lit/sephiroth/android/library/picasso/Cache;
    .param p6, "stats"    # Lit/sephiroth/android/library/picasso/Stats;

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    new-instance v0, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherThread;

    invoke-direct {v0}, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherThread;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->dispatcherThread:Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherThread;

    .line 91
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->dispatcherThread:Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherThread;

    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherThread;->start()V

    .line 92
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->dispatcherThread:Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherThread;

    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {v0}, Lit/sephiroth/android/library/picasso/Utils;->flushStackLocalLeaks(Landroid/os/Looper;)V

    .line 93
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->context:Landroid/content/Context;

    .line 94
    iput-object p2, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->service:Ljava/util/concurrent/ExecutorService;

    .line 95
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->hunterMap:Ljava/util/Map;

    .line 96
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->failedActions:Ljava/util/Map;

    .line 97
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->pausedActions:Ljava/util/Map;

    .line 98
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->pausedTags:Ljava/util/Set;

    .line 99
    new-instance v0, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->dispatcherThread:Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherThread;

    invoke-virtual {v1}, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lit/sephiroth/android/library/picasso/Dispatcher$DispatcherHandler;-><init>(Landroid/os/Looper;Lit/sephiroth/android/library/picasso/Dispatcher;)V

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    .line 100
    iput-object p4, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->downloader:Lit/sephiroth/android/library/picasso/Downloader;

    .line 101
    iput-object p3, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->mainThreadHandler:Landroid/os/Handler;

    .line 102
    iput-object p5, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->cache:Lit/sephiroth/android/library/picasso/Cache;

    .line 103
    iput-object p6, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->stats:Lit/sephiroth/android/library/picasso/Stats;

    .line 104
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->batch:Ljava/util/List;

    .line 105
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->context:Landroid/content/Context;

    invoke-static {v0}, Lit/sephiroth/android/library/picasso/Utils;->isAirplaneModeOn(Landroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->airplaneMode:Z

    .line 106
    const-string v0, "android.permission.ACCESS_NETWORK_STATE"

    invoke-static {p1, v0}, Lit/sephiroth/android/library/picasso/Utils;->hasPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->scansNetworkChanges:Z

    .line 107
    new-instance v0, Lit/sephiroth/android/library/picasso/Dispatcher$NetworkBroadcastReceiver;

    invoke-direct {v0, p0}, Lit/sephiroth/android/library/picasso/Dispatcher$NetworkBroadcastReceiver;-><init>(Lit/sephiroth/android/library/picasso/Dispatcher;)V

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->receiver:Lit/sephiroth/android/library/picasso/Dispatcher$NetworkBroadcastReceiver;

    .line 108
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->receiver:Lit/sephiroth/android/library/picasso/Dispatcher$NetworkBroadcastReceiver;

    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Dispatcher$NetworkBroadcastReceiver;->register()V

    .line 109
    return-void
.end method

.method private batch(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    .registers 6
    .param p1, "hunter"    # Lit/sephiroth/android/library/picasso/BitmapHunter;

    .prologue
    const/4 v1, 0x7

    .line 468
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 479
    :cond_7
    :goto_7
    return-void

    .line 471
    :cond_8
    iget-boolean v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->useBatch:Z

    if-eqz v0, :cond_21

    .line 472
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->batch:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 473
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-nez v0, :cond_7

    .line 474
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_7

    .line 477
    :cond_21
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->mainThreadHandler:Landroid/os/Handler;

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->mainThreadHandler:Landroid/os/Handler;

    const/16 v2, 0xe

    invoke-virtual {v1, v2, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_7
.end method

.method private flushFailedActions()V
    .registers 6

    .prologue
    .line 431
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->failedActions:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3d

    .line 432
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->failedActions:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 433
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lit/sephiroth/android/library/picasso/Action;>;"
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 434
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/picasso/Action;

    .line 435
    .local v0, "action":Lit/sephiroth/android/library/picasso/Action;
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 436
    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Action;->getPicasso()Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v2

    iget-boolean v2, v2, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v2, :cond_38

    .line 437
    const-string v2, "Dispatcher"

    const-string v3, "replaying"

    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Action;->getRequest()Lit/sephiroth/android/library/picasso/Request;

    move-result-object v4

    invoke-virtual {v4}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 439
    :cond_38
    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Lit/sephiroth/android/library/picasso/Dispatcher;->performSubmit(Lit/sephiroth/android/library/picasso/Action;Z)V

    goto :goto_12

    .line 442
    .end local v0    # "action":Lit/sephiroth/android/library/picasso/Action;
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lit/sephiroth/android/library/picasso/Action;>;"
    :cond_3d
    return-void
.end method

.method private logBatch(Ljava/util/List;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/picasso/BitmapHunter;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 482
    .local p1, "copy":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/BitmapHunter;>;"
    if-eqz p1, :cond_8

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 493
    :cond_8
    :goto_8
    return-void

    .line 483
    :cond_9
    const/4 v4, 0x0

    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lit/sephiroth/android/library/picasso/BitmapHunter;

    .line 484
    .local v2, "hunter":Lit/sephiroth/android/library/picasso/BitmapHunter;
    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getPicasso()Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v3

    .line 485
    .local v3, "picasso":Lit/sephiroth/android/library/picasso/Picasso;
    iget-boolean v4, v3, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v4, :cond_8

    .line 486
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 487
    .local v1, "builder":Ljava/lang/StringBuilder;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_21
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_40

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/picasso/BitmapHunter;

    .line 488
    .local v0, "bitmapHunter":Lit/sephiroth/android/library/picasso/BitmapHunter;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_38

    const-string v5, ", "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 489
    :cond_38
    invoke-static {v0}, Lit/sephiroth/android/library/picasso/Utils;->getLogIdsForHunter(Lit/sephiroth/android/library/picasso/BitmapHunter;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_21

    .line 491
    .end local v0    # "bitmapHunter":Lit/sephiroth/android/library/picasso/BitmapHunter;
    :cond_40
    const-string v4, "Dispatcher"

    const-string v5, "delivered"

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8
.end method

.method private markForReplay(Lit/sephiroth/android/library/picasso/Action;)V
    .registers 4
    .param p1, "action"    # Lit/sephiroth/android/library/picasso/Action;

    .prologue
    .line 460
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getTarget()Ljava/lang/Object;

    move-result-object v0

    .line 461
    .local v0, "target":Ljava/lang/Object;
    if-eqz v0, :cond_e

    .line 462
    const/4 v1, 0x1

    iput-boolean v1, p1, Lit/sephiroth/android/library/picasso/Action;->willReplay:Z

    .line 463
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->failedActions:Ljava/util/Map;

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 465
    :cond_e
    return-void
.end method

.method private markForReplay(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    .registers 7
    .param p1, "hunter"    # Lit/sephiroth/android/library/picasso/BitmapHunter;

    .prologue
    .line 445
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getAction()Lit/sephiroth/android/library/picasso/Action;

    move-result-object v0

    .line 446
    .local v0, "action":Lit/sephiroth/android/library/picasso/Action;
    if-eqz v0, :cond_9

    .line 447
    invoke-direct {p0, v0}, Lit/sephiroth/android/library/picasso/Dispatcher;->markForReplay(Lit/sephiroth/android/library/picasso/Action;)V

    .line 449
    :cond_9
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getActions()Ljava/util/List;

    move-result-object v3

    .line 450
    .local v3, "joined":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/Action;>;"
    if-eqz v3, :cond_22

    .line 452
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    .local v4, "n":I
    :goto_14
    if-ge v1, v4, :cond_22

    .line 453
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lit/sephiroth/android/library/picasso/Action;

    .line 454
    .local v2, "join":Lit/sephiroth/android/library/picasso/Action;
    invoke-direct {p0, v2}, Lit/sephiroth/android/library/picasso/Dispatcher;->markForReplay(Lit/sephiroth/android/library/picasso/Action;)V

    .line 452
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 457
    .end local v1    # "i":I
    .end local v2    # "join":Lit/sephiroth/android/library/picasso/Action;
    .end local v4    # "n":I
    :cond_22
    return-void
.end method


# virtual methods
.method dispatchAirplaneModeChange(Z)V
    .registers 7
    .param p1, "airplaneMode"    # Z

    .prologue
    const/4 v1, 0x0

    .line 180
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    const/16 v4, 0xa

    if-eqz p1, :cond_12

    const/4 v0, 0x1

    :goto_a
    invoke-virtual {v3, v4, v0, v1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 182
    return-void

    :cond_12
    move v0, v1

    .line 180
    goto :goto_a
.end method

.method dispatchCancel(Lit/sephiroth/android/library/picasso/Action;)V
    .registers 5
    .param p1, "action"    # Lit/sephiroth/android/library/picasso/Action;

    .prologue
    .line 144
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    const/4 v2, 0x2

    invoke-virtual {v1, v2, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 145
    return-void
.end method

.method dispatchComplete(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    .registers 5
    .param p1, "hunter"    # Lit/sephiroth/android/library/picasso/BitmapHunter;

    .prologue
    .line 164
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    const/4 v2, 0x4

    invoke-virtual {v1, v2, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 165
    return-void
.end method

.method dispatchFailed(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    .registers 5
    .param p1, "hunter"    # Lit/sephiroth/android/library/picasso/BitmapHunter;

    .prologue
    .line 172
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    const/4 v2, 0x6

    invoke-virtual {v1, v2, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 173
    return-void
.end method

.method dispatchNetworkStateChange(Landroid/net/NetworkInfo;)V
    .registers 5
    .param p1, "info"    # Landroid/net/NetworkInfo;

    .prologue
    .line 176
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    const/16 v2, 0x9

    invoke-virtual {v1, v2, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 177
    return-void
.end method

.method dispatchRetry(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    .registers 6
    .param p1, "hunter"    # Lit/sephiroth/android/library/picasso/BitmapHunter;

    .prologue
    .line 168
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    const/4 v2, 0x5

    invoke-virtual {v1, v2, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    const-wide/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 169
    return-void
.end method

.method dispatchSubmit(Lit/sephiroth/android/library/picasso/Action;J)V
    .registers 8
    .param p1, "action"    # Lit/sephiroth/android/library/picasso/Action;
    .param p2, "delayMillis"    # J

    .prologue
    const/4 v2, 0x1

    .line 136
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_13

    .line 137
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v2, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 141
    :goto_12
    return-void

    .line 139
    :cond_13
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->handler:Landroid/os/Handler;

    invoke-virtual {v1, v2, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_12
.end method

.method performAirplaneModeChange(Z)V
    .registers 2
    .param p1, "airplaneMode"    # Z

    .prologue
    .line 417
    iput-boolean p1, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->airplaneMode:Z

    .line 418
    return-void
.end method

.method performBatchComplete()V
    .registers 5

    .prologue
    .line 400
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->batch:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 401
    .local v0, "copy":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/BitmapHunter;>;"
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->batch:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 402
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->mainThreadHandler:Landroid/os/Handler;

    iget-object v2, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->mainThreadHandler:Landroid/os/Handler;

    const/16 v3, 0x8

    invoke-virtual {v2, v3, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 403
    invoke-direct {p0, v0}, Lit/sephiroth/android/library/picasso/Dispatcher;->logBatch(Ljava/util/List;)V

    .line 404
    return-void
.end method

.method performCancel(Lit/sephiroth/android/library/picasso/Action;)V
    .registers 9
    .param p1, "action"    # Lit/sephiroth/android/library/picasso/Action;

    .prologue
    .line 226
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getKey()Ljava/lang/String;

    move-result-object v1

    .line 227
    .local v1, "key":Ljava/lang/String;
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->hunterMap:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/picasso/BitmapHunter;

    .line 228
    .local v0, "hunter":Lit/sephiroth/android/library/picasso/BitmapHunter;
    if-eqz v0, :cond_33

    .line 229
    invoke-virtual {v0, p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->detach(Lit/sephiroth/android/library/picasso/Action;)V

    .line 230
    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/BitmapHunter;->cancel()Z

    move-result v3

    if-eqz v3, :cond_33

    .line 231
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->hunterMap:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getPicasso()Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v3

    iget-boolean v3, v3, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v3, :cond_33

    .line 233
    const-string v3, "Dispatcher"

    const-string v4, "canceled"

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getRequest()Lit/sephiroth/android/library/picasso/Request;

    move-result-object v5

    invoke-virtual {v5}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    :cond_33
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->pausedTags:Ljava/util/Set;

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_61

    .line 239
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->pausedActions:Ljava/util/Map;

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getTarget()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getPicasso()Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v3

    iget-boolean v3, v3, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v3, :cond_61

    .line 241
    const-string v3, "Dispatcher"

    const-string v4, "canceled"

    .line 242
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getRequest()Lit/sephiroth/android/library/picasso/Request;

    move-result-object v5

    invoke-virtual {v5}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "because paused request got canceled"

    .line 241
    invoke-static {v3, v4, v5, v6}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    :cond_61
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->failedActions:Ljava/util/Map;

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getTarget()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lit/sephiroth/android/library/picasso/Action;

    .line 248
    .local v2, "remove":Lit/sephiroth/android/library/picasso/Action;
    if-eqz v2, :cond_88

    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/Action;->getPicasso()Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v3

    iget-boolean v3, v3, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v3, :cond_88

    .line 249
    const-string v3, "Dispatcher"

    const-string v4, "canceled"

    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/Action;->getRequest()Lit/sephiroth/android/library/picasso/Request;

    move-result-object v5

    invoke-virtual {v5}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "from replaying"

    invoke-static {v3, v4, v5, v6}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    :cond_88
    return-void
.end method

.method performComplete(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    .registers 6
    .param p1, "hunter"    # Lit/sephiroth/android/library/picasso/BitmapHunter;

    .prologue
    .line 384
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getMemoryPolicy()I

    move-result v0

    invoke-static {v0}, Lit/sephiroth/android/library/picasso/MemoryPolicy;->shouldWriteToMemoryCache(I)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 385
    iget-object v0, p1, Lit/sephiroth/android/library/picasso/BitmapHunter;->cache:Lit/sephiroth/android/library/picasso/Cache;

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getResult()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lit/sephiroth/android/library/picasso/Cache;->set(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 388
    :cond_17
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getResult()Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_2e

    iget-object v0, p1, Lit/sephiroth/android/library/picasso/BitmapHunter;->diskCache:Lit/sephiroth/android/library/picasso/Cache;

    if-eqz v0, :cond_2e

    .line 389
    iget-object v0, p1, Lit/sephiroth/android/library/picasso/BitmapHunter;->diskCache:Lit/sephiroth/android/library/picasso/Cache;

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getResult()Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lit/sephiroth/android/library/picasso/Cache;->set(Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 392
    :cond_2e
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->hunterMap:Ljava/util/Map;

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 393
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/picasso/Dispatcher;->batch(Lit/sephiroth/android/library/picasso/BitmapHunter;)V

    .line 394
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getPicasso()Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v0

    iget-boolean v0, v0, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v0, :cond_4f

    .line 395
    const-string v0, "Dispatcher"

    const-string v1, "batched"

    invoke-static {p1}, Lit/sephiroth/android/library/picasso/Utils;->getLogIdsForHunter(Lit/sephiroth/android/library/picasso/BitmapHunter;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "for completion"

    invoke-static {v0, v1, v2, v3}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 397
    :cond_4f
    return-void
.end method

.method performError(Lit/sephiroth/android/library/picasso/BitmapHunter;Z)V
    .registers 8
    .param p1, "hunter"    # Lit/sephiroth/android/library/picasso/BitmapHunter;
    .param p2, "willReplay"    # Z

    .prologue
    .line 407
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getPicasso()Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v0

    iget-boolean v0, v0, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v0, :cond_2a

    .line 408
    const-string v1, "Dispatcher"

    const-string v2, "batched"

    .line 409
    invoke-static {p1}, Lit/sephiroth/android/library/picasso/Utils;->getLogIdsForHunter(Lit/sephiroth/android/library/picasso/BitmapHunter;)Ljava/lang/String;

    move-result-object v3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "for error"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz p2, :cond_37

    const-string v0, " (will replay)"

    :goto_1f
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 408
    invoke-static {v1, v2, v3, v0}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 412
    :cond_2a
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->hunterMap:Ljava/util/Map;

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 413
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/picasso/Dispatcher;->batch(Lit/sephiroth/android/library/picasso/BitmapHunter;)V

    .line 414
    return-void

    .line 409
    :cond_37
    const-string v0, ""

    goto :goto_1f
.end method

.method performNetworkStateChange(Landroid/net/NetworkInfo;)V
    .registers 3
    .param p1, "info"    # Landroid/net/NetworkInfo;

    .prologue
    .line 421
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->service:Ljava/util/concurrent/ExecutorService;

    instance-of v0, v0, Lit/sephiroth/android/library/picasso/PicassoExecutorService;

    if-eqz v0, :cond_d

    .line 422
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->service:Ljava/util/concurrent/ExecutorService;

    check-cast v0, Lit/sephiroth/android/library/picasso/PicassoExecutorService;

    invoke-virtual {v0, p1}, Lit/sephiroth/android/library/picasso/PicassoExecutorService;->adjustThreadCount(Landroid/net/NetworkInfo;)V

    .line 425
    :cond_d
    if-eqz p1, :cond_18

    invoke-virtual {p1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 426
    invoke-direct {p0}, Lit/sephiroth/android/library/picasso/Dispatcher;->flushFailedActions()V

    .line 428
    :cond_18
    return-void
.end method

.method performPauseTag(Ljava/lang/Object;)V
    .registers 15
    .param p1, "tag"    # Ljava/lang/Object;

    .prologue
    .line 255
    iget-object v8, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->pausedTags:Ljava/util/Set;

    invoke-interface {v8, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_9

    .line 310
    :cond_8
    return-void

    .line 261
    :cond_9
    iget-object v8, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->hunterMap:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lit/sephiroth/android/library/picasso/BitmapHunter;>;"
    :cond_13
    :goto_13
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 262
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lit/sephiroth/android/library/picasso/BitmapHunter;

    .line 263
    .local v2, "hunter":Lit/sephiroth/android/library/picasso/BitmapHunter;
    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getPicasso()Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v8

    iget-boolean v6, v8, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    .line 265
    .local v6, "loggingEnabled":Z
    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getAction()Lit/sephiroth/android/library/picasso/Action;

    move-result-object v7

    .line 266
    .local v7, "single":Lit/sephiroth/android/library/picasso/Action;
    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getActions()Ljava/util/List;

    move-result-object v5

    .line 267
    .local v5, "joined":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/Action;>;"
    if-eqz v5, :cond_97

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_97

    const/4 v1, 0x1

    .line 270
    .local v1, "hasMultiple":Z
    :goto_36
    if-nez v7, :cond_3a

    if-eqz v1, :cond_13

    .line 274
    :cond_3a
    if-eqz v7, :cond_7a

    invoke-virtual {v7}, Lit/sephiroth/android/library/picasso/Action;->getTag()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7a

    .line 275
    invoke-virtual {v2, v7}, Lit/sephiroth/android/library/picasso/BitmapHunter;->detach(Lit/sephiroth/android/library/picasso/Action;)V

    .line 276
    iget-object v8, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->pausedActions:Ljava/util/Map;

    invoke-virtual {v7}, Lit/sephiroth/android/library/picasso/Action;->getTarget()Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v8, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    if-eqz v6, :cond_7a

    .line 278
    const-string v8, "Dispatcher"

    const-string v9, "paused"

    iget-object v10, v7, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    .line 279
    invoke-virtual {v10}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "because tag \'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\' was paused"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 278
    invoke-static {v8, v9, v10, v11}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    :cond_7a
    if-eqz v1, :cond_ce

    .line 285
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    add-int/lit8 v3, v8, -0x1

    .local v3, "i":I
    :goto_82
    if-ltz v3, :cond_ce

    .line 286
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/picasso/Action;

    .line 287
    .local v0, "action":Lit/sephiroth/android/library/picasso/Action;
    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Action;->getTag()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_99

    .line 285
    :cond_94
    :goto_94
    add-int/lit8 v3, v3, -0x1

    goto :goto_82

    .line 267
    .end local v0    # "action":Lit/sephiroth/android/library/picasso/Action;
    .end local v1    # "hasMultiple":Z
    .end local v3    # "i":I
    :cond_97
    const/4 v1, 0x0

    goto :goto_36

    .line 291
    .restart local v0    # "action":Lit/sephiroth/android/library/picasso/Action;
    .restart local v1    # "hasMultiple":Z
    .restart local v3    # "i":I
    :cond_99
    invoke-virtual {v2, v0}, Lit/sephiroth/android/library/picasso/BitmapHunter;->detach(Lit/sephiroth/android/library/picasso/Action;)V

    .line 292
    iget-object v8, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->pausedActions:Ljava/util/Map;

    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Action;->getTarget()Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v8, v9, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    if-eqz v6, :cond_94

    .line 294
    const-string v8, "Dispatcher"

    const-string v9, "paused"

    iget-object v10, v0, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    .line 295
    invoke-virtual {v10}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v10

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "because tag \'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\' was paused"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 294
    invoke-static {v8, v9, v10, v11}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_94

    .line 303
    .end local v0    # "action":Lit/sephiroth/android/library/picasso/Action;
    .end local v3    # "i":I
    :cond_ce
    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/BitmapHunter;->cancel()Z

    move-result v8

    if-eqz v8, :cond_13

    .line 304
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    .line 305
    if-eqz v6, :cond_13

    .line 306
    const-string v8, "Dispatcher"

    const-string v9, "canceled"

    invoke-static {v2}, Lit/sephiroth/android/library/picasso/Utils;->getLogIdsForHunter(Lit/sephiroth/android/library/picasso/BitmapHunter;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "all actions paused"

    invoke-static {v8, v9, v10, v11}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_13
.end method

.method performResumeTag(Ljava/lang/Object;)V
    .registers 8
    .param p1, "tag"    # Ljava/lang/Object;

    .prologue
    .line 314
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->pausedTags:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    .line 333
    :cond_8
    :goto_8
    return-void

    .line 318
    :cond_9
    const/4 v1, 0x0

    .line 319
    .local v1, "batch":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/Action;>;"
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->pausedActions:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lit/sephiroth/android/library/picasso/Action;>;"
    :cond_14
    :goto_14
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_38

    .line 320
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/picasso/Action;

    .line 321
    .local v0, "action":Lit/sephiroth/android/library/picasso/Action;
    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Action;->getTag()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 322
    if-nez v1, :cond_31

    .line 323
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "batch":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/Action;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 325
    .restart local v1    # "batch":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/Action;>;"
    :cond_31
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 326
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_14

    .line 330
    .end local v0    # "action":Lit/sephiroth/android/library/picasso/Action;
    :cond_38
    if-eqz v1, :cond_8

    .line 331
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->mainThreadHandler:Landroid/os/Handler;

    iget-object v4, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->mainThreadHandler:Landroid/os/Handler;

    const/16 v5, 0xd

    invoke-virtual {v4, v5, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_8
.end method

.method performRetry(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    .registers 12
    .param p1, "hunter"    # Lit/sephiroth/android/library/picasso/BitmapHunter;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 336
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->isCancelled()Z

    move-result v8

    if-eqz v8, :cond_9

    .line 381
    :cond_8
    :goto_8
    return-void

    .line 338
    :cond_9
    iget-object v8, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->service:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v8}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    move-result v8

    if-eqz v8, :cond_15

    .line 339
    invoke-virtual {p0, p1, v7}, Lit/sephiroth/android/library/picasso/Dispatcher;->performError(Lit/sephiroth/android/library/picasso/BitmapHunter;Z)V

    goto :goto_8

    .line 343
    :cond_15
    const/4 v2, 0x0

    .line 344
    .local v2, "networkInfo":Landroid/net/NetworkInfo;
    iget-boolean v8, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->scansNetworkChanges:Z

    if-eqz v8, :cond_28

    .line 345
    iget-object v8, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->context:Landroid/content/Context;

    const-string v9, "connectivity"

    invoke-static {v8, v9}, Lit/sephiroth/android/library/picasso/Utils;->getService(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 346
    .local v0, "connectivityManager":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v2

    .line 349
    .end local v0    # "connectivityManager":Landroid/net/ConnectivityManager;
    :cond_28
    if-eqz v2, :cond_4d

    invoke-virtual {v2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v8

    if-eqz v8, :cond_4d

    move v1, v6

    .line 350
    .local v1, "hasConnectivity":Z
    :goto_31
    iget-boolean v8, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->airplaneMode:Z

    invoke-virtual {p1, v8, v2}, Lit/sephiroth/android/library/picasso/BitmapHunter;->shouldRetry(ZLandroid/net/NetworkInfo;)Z

    move-result v3

    .line 351
    .local v3, "shouldRetryHunter":Z
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->supportsReplay()Z

    move-result v4

    .line 353
    .local v4, "supportsReplay":Z
    if-nez v3, :cond_51

    .line 355
    iget-boolean v8, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->scansNetworkChanges:Z

    if-eqz v8, :cond_4f

    if-eqz v4, :cond_4f

    move v5, v6

    .line 356
    .local v5, "willReplay":Z
    :goto_44
    invoke-virtual {p0, p1, v5}, Lit/sephiroth/android/library/picasso/Dispatcher;->performError(Lit/sephiroth/android/library/picasso/BitmapHunter;Z)V

    .line 357
    if-eqz v5, :cond_8

    .line 358
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/picasso/Dispatcher;->markForReplay(Lit/sephiroth/android/library/picasso/BitmapHunter;)V

    goto :goto_8

    .end local v1    # "hasConnectivity":Z
    .end local v3    # "shouldRetryHunter":Z
    .end local v4    # "supportsReplay":Z
    .end local v5    # "willReplay":Z
    :cond_4d
    move v1, v7

    .line 349
    goto :goto_31

    .restart local v1    # "hasConnectivity":Z
    .restart local v3    # "shouldRetryHunter":Z
    .restart local v4    # "supportsReplay":Z
    :cond_4f
    move v5, v7

    .line 355
    goto :goto_44

    .line 364
    :cond_51
    iget-boolean v6, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->scansNetworkChanges:Z

    if-eqz v6, :cond_57

    if-eqz v1, :cond_84

    .line 365
    :cond_57
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getPicasso()Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v6

    iget-boolean v6, v6, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v6, :cond_6a

    .line 366
    const-string v6, "Dispatcher"

    const-string v7, "retrying"

    invoke-static {p1}, Lit/sephiroth/android/library/picasso/Utils;->getLogIdsForHunter(Lit/sephiroth/android/library/picasso/BitmapHunter;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 369
    :cond_6a
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getException()Ljava/lang/Exception;

    move-result-object v6

    instance-of v6, v6, Lit/sephiroth/android/library/picasso/NetworkRequestHandler$ContentLengthException;

    if-eqz v6, :cond_7b

    .line 370
    iget v6, p1, Lit/sephiroth/android/library/picasso/BitmapHunter;->networkPolicy:I

    sget-object v7, Lit/sephiroth/android/library/picasso/NetworkPolicy;->NO_CACHE:Lit/sephiroth/android/library/picasso/NetworkPolicy;

    iget v7, v7, Lit/sephiroth/android/library/picasso/NetworkPolicy;->index:I

    or-int/2addr v6, v7

    iput v6, p1, Lit/sephiroth/android/library/picasso/BitmapHunter;->networkPolicy:I

    .line 372
    :cond_7b
    iget-object v6, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->service:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v6, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v6

    iput-object v6, p1, Lit/sephiroth/android/library/picasso/BitmapHunter;->future:Ljava/util/concurrent/Future;

    goto :goto_8

    .line 376
    :cond_84
    invoke-virtual {p0, p1, v4}, Lit/sephiroth/android/library/picasso/Dispatcher;->performError(Lit/sephiroth/android/library/picasso/BitmapHunter;Z)V

    .line 378
    if-eqz v4, :cond_8

    .line 379
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/picasso/Dispatcher;->markForReplay(Lit/sephiroth/android/library/picasso/BitmapHunter;)V

    goto/16 :goto_8
.end method

.method performSubmit(Lit/sephiroth/android/library/picasso/Action;)V
    .registers 3
    .param p1, "action"    # Lit/sephiroth/android/library/picasso/Action;

    .prologue
    .line 185
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lit/sephiroth/android/library/picasso/Dispatcher;->performSubmit(Lit/sephiroth/android/library/picasso/Action;Z)V

    .line 186
    return-void
.end method

.method performSubmit(Lit/sephiroth/android/library/picasso/Action;Z)V
    .registers 10
    .param p1, "action"    # Lit/sephiroth/android/library/picasso/Action;
    .param p2, "dismissFailed"    # Z

    .prologue
    .line 189
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->pausedTags:Ljava/util/Set;

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getTag()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    .line 190
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->pausedActions:Ljava/util/Map;

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getTarget()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getPicasso()Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v0

    iget-boolean v0, v0, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v0, :cond_47

    .line 192
    const-string v0, "Dispatcher"

    const-string v1, "paused"

    iget-object v2, p1, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    .line 193
    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "because tag \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 194
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getTag()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' is paused"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 192
    invoke-static {v0, v1, v2, v3}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    :cond_47
    :goto_47
    return-void

    .line 199
    :cond_48
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->hunterMap:Ljava/util/Map;

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lit/sephiroth/android/library/picasso/BitmapHunter;

    .line 200
    .local v6, "hunter":Lit/sephiroth/android/library/picasso/BitmapHunter;
    if-eqz v6, :cond_5a

    .line 201
    invoke-virtual {v6, p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->attach(Lit/sephiroth/android/library/picasso/Action;)V

    goto :goto_47

    .line 205
    :cond_5a
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->service:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    move-result v0

    if-eqz v0, :cond_7a

    .line 206
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getPicasso()Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v0

    iget-boolean v0, v0, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v0, :cond_47

    .line 207
    const-string v0, "Dispatcher"

    const-string v1, "ignored"

    iget-object v2, p1, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v2

    const-string v3, "because shut down"

    invoke-static {v0, v1, v2, v3}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_47

    .line 212
    :cond_7a
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getPicasso()Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v0

    iget-object v1, p1, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    iget-object v2, v1, Lit/sephiroth/android/library/picasso/Request;->cache:Lit/sephiroth/android/library/picasso/Cache;

    iget-object v1, p1, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    iget-object v3, v1, Lit/sephiroth/android/library/picasso/Request;->diskCache:Lit/sephiroth/android/library/picasso/Cache;

    iget-object v4, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->stats:Lit/sephiroth/android/library/picasso/Stats;

    move-object v1, p0

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lit/sephiroth/android/library/picasso/BitmapHunter;->forRequest(Lit/sephiroth/android/library/picasso/Picasso;Lit/sephiroth/android/library/picasso/Dispatcher;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Stats;Lit/sephiroth/android/library/picasso/Action;)Lit/sephiroth/android/library/picasso/BitmapHunter;

    move-result-object v6

    .line 214
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->service:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0, v6}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object v0

    iput-object v0, v6, Lit/sephiroth/android/library/picasso/BitmapHunter;->future:Ljava/util/concurrent/Future;

    .line 215
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->hunterMap:Ljava/util/Map;

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    if-eqz p2, :cond_aa

    .line 217
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Dispatcher;->failedActions:Ljava/util/Map;

    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getTarget()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    :cond_aa
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getPicasso()Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v0

    iget-boolean v0, v0, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v0, :cond_47

    .line 221
    const-string v0, "Dispatcher"

    const-string v1, "enqueued"

    iget-object v2, p1, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_47
.end method
