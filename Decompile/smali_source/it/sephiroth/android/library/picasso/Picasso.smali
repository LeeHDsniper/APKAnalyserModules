.class public Lit/sephiroth/android/library/picasso/Picasso;
.super Ljava/lang/Object;
.source "Picasso.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;,
        Lit/sephiroth/android/library/picasso/Picasso$Builder;,
        Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;,
        Lit/sephiroth/android/library/picasso/Picasso$Priority;,
        Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;,
        Lit/sephiroth/android/library/picasso/Picasso$Listener;
    }
.end annotation


# static fields
.field static final HANDLER:Landroid/os/Handler;

.field static volatile singleton:Lit/sephiroth/android/library/picasso/Picasso;


# instance fields
.field final cache:Lit/sephiroth/android/library/picasso/Cache;

.field private final cleanupThread:Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;

.field final context:Landroid/content/Context;

.field final defaultBitmapConfig:Landroid/graphics/Bitmap$Config;

.field final dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

.field indicatorsEnabled:Z

.field private final listener:Lit/sephiroth/android/library/picasso/Picasso$Listener;

.field volatile loggingEnabled:Z

.field final referenceQueue:Ljava/lang/ref/ReferenceQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final requestHandlers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/picasso/RequestHandler;",
            ">;"
        }
    .end annotation
.end field

.field private final requestTransformer:Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;

.field shutdown:Z

.field final stats:Lit/sephiroth/android/library/picasso/Stats;

.field final targetToAction:Ljava/util/Map;
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

.field final targetToDeferredRequestCreator:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/widget/ImageView;",
            "Lit/sephiroth/android/library/picasso/DeferredRequestCreator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 103
    new-instance v0, Lit/sephiroth/android/library/picasso/Picasso$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Lit/sephiroth/android/library/picasso/Picasso$1;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lit/sephiroth/android/library/picasso/Picasso;->HANDLER:Landroid/os/Handler;

    .line 141
    const/4 v0, 0x0

    sput-object v0, Lit/sephiroth/android/library/picasso/Picasso;->singleton:Lit/sephiroth/android/library/picasso/Picasso;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Lit/sephiroth/android/library/picasso/Dispatcher;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Picasso$Listener;Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;Ljava/util/List;Lit/sephiroth/android/library/picasso/Stats;Landroid/graphics/Bitmap$Config;ZZ)V
    .registers 18
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "dispatcher"    # Lit/sephiroth/android/library/picasso/Dispatcher;
    .param p3, "cache"    # Lit/sephiroth/android/library/picasso/Cache;
    .param p4, "listener"    # Lit/sephiroth/android/library/picasso/Picasso$Listener;
    .param p5, "requestTransformer"    # Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;
    .param p7, "stats"    # Lit/sephiroth/android/library/picasso/Stats;
    .param p8, "defaultBitmapConfig"    # Landroid/graphics/Bitmap$Config;
    .param p9, "indicatorsEnabled"    # Z
    .param p10, "loggingEnabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lit/sephiroth/android/library/picasso/Dispatcher;",
            "Lit/sephiroth/android/library/picasso/Cache;",
            "Lit/sephiroth/android/library/picasso/Picasso$Listener;",
            "Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;",
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/picasso/RequestHandler;",
            ">;",
            "Lit/sephiroth/android/library/picasso/Stats;",
            "Landroid/graphics/Bitmap$Config;",
            "ZZ)V"
        }
    .end annotation

    .prologue
    .line 164
    .local p6, "extraRequestHandlers":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/RequestHandler;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 165
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/Picasso;->context:Landroid/content/Context;

    .line 166
    iput-object p2, p0, Lit/sephiroth/android/library/picasso/Picasso;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    .line 167
    iput-object p3, p0, Lit/sephiroth/android/library/picasso/Picasso;->cache:Lit/sephiroth/android/library/picasso/Cache;

    .line 168
    iput-object p4, p0, Lit/sephiroth/android/library/picasso/Picasso;->listener:Lit/sephiroth/android/library/picasso/Picasso$Listener;

    .line 169
    iput-object p5, p0, Lit/sephiroth/android/library/picasso/Picasso;->requestTransformer:Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;

    .line 170
    iput-object p8, p0, Lit/sephiroth/android/library/picasso/Picasso;->defaultBitmapConfig:Landroid/graphics/Bitmap$Config;

    .line 172
    const/4 v2, 0x7

    .line 173
    .local v2, "builtInHandlers":I
    if-eqz p6, :cond_92

    invoke-interface {p6}, Ljava/util/List;->size()I

    move-result v3

    .line 174
    .local v3, "extraCount":I
    :goto_16
    new-instance v1, Ljava/util/ArrayList;

    add-int v4, v2, v3

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 180
    .local v1, "allRequestHandlers":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/RequestHandler;>;"
    new-instance v4, Lit/sephiroth/android/library/picasso/ResourceRequestHandler;

    invoke-direct {v4, p1}, Lit/sephiroth/android/library/picasso/ResourceRequestHandler;-><init>(Landroid/content/Context;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    if-eqz p6, :cond_2a

    .line 182
    invoke-interface {v1, p6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 184
    :cond_2a
    new-instance v4, Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler;

    invoke-direct {v4, p1}, Lit/sephiroth/android/library/picasso/ContactsPhotoRequestHandler;-><init>(Landroid/content/Context;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    new-instance v4, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler;

    invoke-direct {v4, p1}, Lit/sephiroth/android/library/picasso/MediaStoreRequestHandler;-><init>(Landroid/content/Context;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 186
    new-instance v4, Lit/sephiroth/android/library/picasso/ContentStreamRequestHandler;

    invoke-direct {v4, p1}, Lit/sephiroth/android/library/picasso/ContentStreamRequestHandler;-><init>(Landroid/content/Context;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    new-instance v4, Lit/sephiroth/android/library/picasso/AssetRequestHandler;

    invoke-direct {v4, p1}, Lit/sephiroth/android/library/picasso/AssetRequestHandler;-><init>(Landroid/content/Context;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 188
    new-instance v4, Lit/sephiroth/android/library/picasso/FileRequestHandler;

    invoke-direct {v4, p1}, Lit/sephiroth/android/library/picasso/FileRequestHandler;-><init>(Landroid/content/Context;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 189
    new-instance v4, Lit/sephiroth/android/library/picasso/NetworkRequestHandler;

    iget-object v5, p2, Lit/sephiroth/android/library/picasso/Dispatcher;->downloader:Lit/sephiroth/android/library/picasso/Downloader;

    invoke-direct {v4, v5, p7}, Lit/sephiroth/android/library/picasso/NetworkRequestHandler;-><init>(Lit/sephiroth/android/library/picasso/Downloader;Lit/sephiroth/android/library/picasso/Stats;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    invoke-static {v1}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lit/sephiroth/android/library/picasso/Picasso;->requestHandlers:Ljava/util/List;

    .line 193
    iput-object p7, p0, Lit/sephiroth/android/library/picasso/Picasso;->stats:Lit/sephiroth/android/library/picasso/Stats;

    .line 194
    new-instance v4, Ljava/util/WeakHashMap;

    invoke-direct {v4}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v4, p0, Lit/sephiroth/android/library/picasso/Picasso;->targetToAction:Ljava/util/Map;

    .line 195
    new-instance v4, Ljava/util/WeakHashMap;

    invoke-direct {v4}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v4, p0, Lit/sephiroth/android/library/picasso/Picasso;->targetToDeferredRequestCreator:Ljava/util/Map;

    .line 196
    move/from16 v0, p9

    iput-boolean v0, p0, Lit/sephiroth/android/library/picasso/Picasso;->indicatorsEnabled:Z

    .line 197
    move/from16 v0, p10

    iput-boolean v0, p0, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    .line 198
    new-instance v4, Ljava/lang/ref/ReferenceQueue;

    invoke-direct {v4}, Ljava/lang/ref/ReferenceQueue;-><init>()V

    iput-object v4, p0, Lit/sephiroth/android/library/picasso/Picasso;->referenceQueue:Ljava/lang/ref/ReferenceQueue;

    .line 199
    new-instance v4, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;

    iget-object v5, p0, Lit/sephiroth/android/library/picasso/Picasso;->referenceQueue:Ljava/lang/ref/ReferenceQueue;

    sget-object v6, Lit/sephiroth/android/library/picasso/Picasso;->HANDLER:Landroid/os/Handler;

    invoke-direct {v4, v5, v6}, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;-><init>(Ljava/lang/ref/ReferenceQueue;Landroid/os/Handler;)V

    iput-object v4, p0, Lit/sephiroth/android/library/picasso/Picasso;->cleanupThread:Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;

    .line 200
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/Picasso;->cleanupThread:Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;

    invoke-virtual {v4}, Lit/sephiroth/android/library/picasso/Picasso$CleanupThread;->start()V

    .line 201
    return-void

    .line 173
    .end local v1    # "allRequestHandlers":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/RequestHandler;>;"
    .end local v3    # "extraCount":I
    :cond_92
    const/4 v3, 0x0

    goto :goto_16
.end method

.method static synthetic access$000(Lit/sephiroth/android/library/picasso/Picasso;Ljava/lang/Object;)V
    .registers 2
    .param p0, "x0"    # Lit/sephiroth/android/library/picasso/Picasso;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/picasso/Picasso;->cancelExistingRequest(Ljava/lang/Object;)V

    return-void
.end method

.method private cancelExistingRequest(Ljava/lang/Object;)V
    .registers 6
    .param p1, "target"    # Ljava/lang/Object;

    .prologue
    .line 629
    invoke-static {}, Lit/sephiroth/android/library/picasso/Utils;->checkMain()V

    .line 630
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Picasso;->targetToAction:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/picasso/Action;

    .line 631
    .local v0, "action":Lit/sephiroth/android/library/picasso/Action;
    if-eqz v0, :cond_15

    .line 632
    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Action;->cancel()V

    .line 633
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Picasso;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v3, v0}, Lit/sephiroth/android/library/picasso/Dispatcher;->dispatchCancel(Lit/sephiroth/android/library/picasso/Action;)V

    .line 635
    :cond_15
    instance-of v3, p1, Landroid/widget/ImageView;

    if-eqz v3, :cond_29

    move-object v2, p1

    .line 636
    check-cast v2, Landroid/widget/ImageView;

    .line 637
    .local v2, "targetImageView":Landroid/widget/ImageView;
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Picasso;->targetToDeferredRequestCreator:Ljava/util/Map;

    .line 638
    invoke-interface {v3, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lit/sephiroth/android/library/picasso/DeferredRequestCreator;

    .line 639
    .local v1, "deferredRequestCreator":Lit/sephiroth/android/library/picasso/DeferredRequestCreator;
    if-eqz v1, :cond_29

    .line 640
    invoke-virtual {v1}, Lit/sephiroth/android/library/picasso/DeferredRequestCreator;->cancel()V

    .line 643
    .end local v1    # "deferredRequestCreator":Lit/sephiroth/android/library/picasso/DeferredRequestCreator;
    .end local v2    # "targetImageView":Landroid/widget/ImageView;
    :cond_29
    return-void
.end method

.method private deliverAction(Landroid/graphics/Bitmap;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;Lit/sephiroth/android/library/picasso/Action;)V
    .registers 9
    .param p1, "result"    # Landroid/graphics/Bitmap;
    .param p2, "from"    # Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;
    .param p3, "action"    # Lit/sephiroth/android/library/picasso/Action;

    .prologue
    .line 606
    invoke-virtual {p3}, Lit/sephiroth/android/library/picasso/Action;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 626
    :cond_6
    :goto_6
    return-void

    .line 609
    :cond_7
    invoke-virtual {p3}, Lit/sephiroth/android/library/picasso/Action;->willReplay()Z

    move-result v0

    if-nez v0, :cond_16

    .line 610
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Picasso;->targetToAction:Ljava/util/Map;

    invoke-virtual {p3}, Lit/sephiroth/android/library/picasso/Action;->getTarget()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 612
    :cond_16
    if-eqz p1, :cond_4a

    .line 613
    if-nez p2, :cond_22

    .line 614
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "LoadedFrom cannot be null."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 616
    :cond_22
    invoke-virtual {p3, p1, p2}, Lit/sephiroth/android/library/picasso/Action;->complete(Landroid/graphics/Bitmap;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;)V

    .line 617
    iget-boolean v0, p0, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v0, :cond_6

    .line 618
    const-string v0, "Main"

    const-string v1, "completed"

    iget-object v2, p3, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6

    .line 621
    :cond_4a
    invoke-virtual {p3}, Lit/sephiroth/android/library/picasso/Action;->error()V

    .line 622
    iget-boolean v0, p0, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v0, :cond_6

    .line 623
    const-string v0, "Main"

    const-string v1, "errored"

    iget-object v2, p3, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v2}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_6
.end method

.method public static with(Landroid/content/Context;)Lit/sephiroth/android/library/picasso/Picasso;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 717
    sget-object v0, Lit/sephiroth/android/library/picasso/Picasso;->singleton:Lit/sephiroth/android/library/picasso/Picasso;

    if-nez v0, :cond_17

    .line 718
    const-class v1, Lit/sephiroth/android/library/picasso/Picasso;

    monitor-enter v1

    .line 719
    :try_start_7
    sget-object v0, Lit/sephiroth/android/library/picasso/Picasso;->singleton:Lit/sephiroth/android/library/picasso/Picasso;

    if-nez v0, :cond_16

    .line 720
    new-instance v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;

    invoke-direct {v0, p0}, Lit/sephiroth/android/library/picasso/Picasso$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lit/sephiroth/android/library/picasso/Picasso$Builder;->build()Lit/sephiroth/android/library/picasso/Picasso;

    move-result-object v0

    sput-object v0, Lit/sephiroth/android/library/picasso/Picasso;->singleton:Lit/sephiroth/android/library/picasso/Picasso;

    .line 722
    :cond_16
    monitor-exit v1
    :try_end_17
    .catchall {:try_start_7 .. :try_end_17} :catchall_1a

    .line 724
    :cond_17
    sget-object v0, Lit/sephiroth/android/library/picasso/Picasso;->singleton:Lit/sephiroth/android/library/picasso/Picasso;

    return-object v0

    .line 722
    :catchall_1a
    move-exception v0

    :try_start_1b
    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_1a

    throw v0
.end method


# virtual methods
.method public addRequestHandler(Lit/sephiroth/android/library/picasso/RequestHandler;)V
    .registers 4
    .param p1, "handler"    # Lit/sephiroth/android/library/picasso/RequestHandler;

    .prologue
    .line 484
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Picasso;->requestHandlers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 485
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "RequestHandler already registered."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 487
    :cond_10
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Picasso;->requestHandlers:Ljava/util/List;

    const/4 v1, 0x1

    invoke-interface {v0, v1, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 488
    return-void
.end method

.method public cancelRequest(Landroid/widget/ImageView;)V
    .registers 2
    .param p1, "view"    # Landroid/widget/ImageView;

    .prologue
    .line 209
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/picasso/Picasso;->cancelExistingRequest(Ljava/lang/Object;)V

    .line 210
    return-void
.end method

.method complete(Lit/sephiroth/android/library/picasso/BitmapHunter;)V
    .registers 15
    .param p1, "hunter"    # Lit/sephiroth/android/library/picasso/BitmapHunter;

    .prologue
    const/4 v11, 0x1

    const/4 v8, 0x0

    .line 552
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getAction()Lit/sephiroth/android/library/picasso/Action;

    move-result-object v9

    .line 553
    .local v9, "single":Lit/sephiroth/android/library/picasso/Action;
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getActions()Ljava/util/List;

    move-result-object v5

    .line 555
    .local v5, "joined":Ljava/util/List;, "Ljava/util/List<Lit/sephiroth/android/library/picasso/Action;>;"
    if-eqz v5, :cond_1b

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_1b

    move v2, v11

    .line 556
    .local v2, "hasMultiple":Z
    :goto_13
    if-nez v9, :cond_17

    if-eqz v2, :cond_18

    :cond_17
    move v8, v11

    .line 558
    .local v8, "shouldDeliver":Z
    :cond_18
    if-nez v8, :cond_1d

    .line 582
    :cond_1a
    :goto_1a
    return-void

    .end local v2    # "hasMultiple":Z
    .end local v8    # "shouldDeliver":Z
    :cond_1b
    move v2, v8

    .line 555
    goto :goto_13

    .line 562
    .restart local v2    # "hasMultiple":Z
    .restart local v8    # "shouldDeliver":Z
    :cond_1d
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getData()Lit/sephiroth/android/library/picasso/Request;

    move-result-object v11

    iget-object v10, v11, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    .line 563
    .local v10, "uri":Landroid/net/Uri;
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getException()Ljava/lang/Exception;

    move-result-object v0

    .line 564
    .local v0, "exception":Ljava/lang/Exception;
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getResult()Landroid/graphics/Bitmap;

    move-result-object v7

    .line 565
    .local v7, "result":Landroid/graphics/Bitmap;
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/BitmapHunter;->getLoadedFrom()Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    move-result-object v1

    .line 567
    .local v1, "from":Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;
    if-eqz v9, :cond_34

    .line 568
    invoke-direct {p0, v7, v1, v9}, Lit/sephiroth/android/library/picasso/Picasso;->deliverAction(Landroid/graphics/Bitmap;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;Lit/sephiroth/android/library/picasso/Action;)V

    .line 571
    :cond_34
    if-eqz v2, :cond_49

    .line 573
    const/4 v3, 0x0

    .local v3, "i":I
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    .local v6, "n":I
    :goto_3b
    if-ge v3, v6, :cond_49

    .line 574
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lit/sephiroth/android/library/picasso/Action;

    .line 575
    .local v4, "join":Lit/sephiroth/android/library/picasso/Action;
    invoke-direct {p0, v7, v1, v4}, Lit/sephiroth/android/library/picasso/Picasso;->deliverAction(Landroid/graphics/Bitmap;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;Lit/sephiroth/android/library/picasso/Action;)V

    .line 573
    add-int/lit8 v3, v3, 0x1

    goto :goto_3b

    .line 579
    .end local v3    # "i":I
    .end local v4    # "join":Lit/sephiroth/android/library/picasso/Action;
    .end local v6    # "n":I
    :cond_49
    iget-object v11, p0, Lit/sephiroth/android/library/picasso/Picasso;->listener:Lit/sephiroth/android/library/picasso/Picasso$Listener;

    if-eqz v11, :cond_1a

    if-eqz v0, :cond_1a

    .line 580
    iget-object v11, p0, Lit/sephiroth/android/library/picasso/Picasso;->listener:Lit/sephiroth/android/library/picasso/Picasso$Listener;

    invoke-interface {v11, p0, v10, v0}, Lit/sephiroth/android/library/picasso/Picasso$Listener;->onImageLoadFailed(Lit/sephiroth/android/library/picasso/Picasso;Landroid/net/Uri;Ljava/lang/Exception;)V

    goto :goto_1a
.end method

.method defer(Landroid/widget/ImageView;Lit/sephiroth/android/library/picasso/DeferredRequestCreator;)V
    .registers 4
    .param p1, "view"    # Landroid/widget/ImageView;
    .param p2, "request"    # Lit/sephiroth/android/library/picasso/DeferredRequestCreator;

    .prologue
    .line 506
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Picasso;->targetToDeferredRequestCreator:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 507
    return-void
.end method

.method enqueueAndSubmit(Lit/sephiroth/android/library/picasso/Action;J)V
    .registers 6
    .param p1, "action"    # Lit/sephiroth/android/library/picasso/Action;
    .param p2, "delayMillis"    # J

    .prologue
    .line 515
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getTarget()Ljava/lang/Object;

    move-result-object v0

    .line 516
    .local v0, "target":Ljava/lang/Object;
    if-eqz v0, :cond_16

    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Picasso;->targetToAction:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p1, :cond_16

    .line 518
    invoke-direct {p0, v0}, Lit/sephiroth/android/library/picasso/Picasso;->cancelExistingRequest(Ljava/lang/Object;)V

    .line 519
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Picasso;->targetToAction:Ljava/util/Map;

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 521
    :cond_16
    invoke-virtual {p0, p1, p2, p3}, Lit/sephiroth/android/library/picasso/Picasso;->submit(Lit/sephiroth/android/library/picasso/Action;J)V

    .line 522
    return-void
.end method

.method public getCache()Lit/sephiroth/android/library/picasso/Cache;
    .registers 2

    .prologue
    .line 451
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Picasso;->cache:Lit/sephiroth/android/library/picasso/Cache;

    return-object v0
.end method

.method getRequestHandlers()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/picasso/RequestHandler;",
            ">;"
        }
    .end annotation

    .prologue
    .line 474
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Picasso;->requestHandlers:Ljava/util/List;

    return-object v0
.end method

.method public isLoggingEnabled()Z
    .registers 2

    .prologue
    .line 433
    iget-boolean v0, p0, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    return v0
.end method

.method public load(Landroid/net/Uri;)Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 4
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 288
    new-instance v0, Lit/sephiroth/android/library/picasso/RequestCreator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lit/sephiroth/android/library/picasso/RequestCreator;-><init>(Lit/sephiroth/android/library/picasso/Picasso;Landroid/net/Uri;I)V

    return-object v0
.end method

.method public load(Ljava/io/File;)Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 5
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 331
    if-nez p1, :cond_a

    .line 332
    new-instance v0, Lit/sephiroth/android/library/picasso/RequestCreator;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lit/sephiroth/android/library/picasso/RequestCreator;-><init>(Lit/sephiroth/android/library/picasso/Picasso;Landroid/net/Uri;I)V

    .line 334
    :goto_9
    return-object v0

    :cond_a
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/picasso/Picasso;->load(Landroid/net/Uri;)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v0

    goto :goto_9
.end method

.method public load(Ljava/lang/String;)Lit/sephiroth/android/library/picasso/RequestCreator;
    .registers 5
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 308
    if-nez p1, :cond_a

    .line 309
    new-instance v0, Lit/sephiroth/android/library/picasso/RequestCreator;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lit/sephiroth/android/library/picasso/RequestCreator;-><init>(Lit/sephiroth/android/library/picasso/Picasso;Landroid/net/Uri;I)V

    .line 314
    :goto_9
    return-object v0

    .line 311
    :cond_a
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1c

    .line 312
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Path must not be empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 314
    :cond_1c
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lit/sephiroth/android/library/picasso/Picasso;->load(Landroid/net/Uri;)Lit/sephiroth/android/library/picasso/RequestCreator;

    move-result-object v0

    goto :goto_9
.end method

.method quickMemoryCacheCheck(Lit/sephiroth/android/library/picasso/Cache;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 7
    .param p1, "cache"    # Lit/sephiroth/android/library/picasso/Cache;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 539
    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/Picasso;->isLoggingEnabled()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 540
    const-string v1, "Picasso"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "quickMemoryCacheCheck: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 542
    :cond_1e
    invoke-interface {p1, p2}, Lit/sephiroth/android/library/picasso/Cache;->get(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 543
    .local v0, "cached":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_2a

    .line 544
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Picasso;->stats:Lit/sephiroth/android/library/picasso/Stats;

    invoke-virtual {v1}, Lit/sephiroth/android/library/picasso/Stats;->dispatchCacheHit()V

    .line 548
    :goto_29
    return-object v0

    .line 546
    :cond_2a
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Picasso;->stats:Lit/sephiroth/android/library/picasso/Stats;

    invoke-virtual {v1}, Lit/sephiroth/android/library/picasso/Stats;->dispatchCacheMiss()V

    goto :goto_29
.end method

.method public removeRequestHandler(Lit/sephiroth/android/library/picasso/RequestHandler;)Z
    .registers 3
    .param p1, "handler"    # Lit/sephiroth/android/library/picasso/RequestHandler;

    .prologue
    .line 491
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Picasso;->requestHandlers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method resumeAction(Lit/sephiroth/android/library/picasso/Action;)V
    .registers 8
    .param p1, "action"    # Lit/sephiroth/android/library/picasso/Action;

    .prologue
    .line 585
    const/4 v0, 0x0

    .line 586
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget v1, p1, Lit/sephiroth/android/library/picasso/Action;->memoryPolicy:I

    invoke-static {v1}, Lit/sephiroth/android/library/picasso/MemoryPolicy;->shouldReadFromMemoryCache(I)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 587
    iget-object v1, p1, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    if-eqz v1, :cond_47

    iget-object v1, p1, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    iget-object v1, v1, Lit/sephiroth/android/library/picasso/Request;->cache:Lit/sephiroth/android/library/picasso/Cache;

    :goto_11
    invoke-virtual {p1}, Lit/sephiroth/android/library/picasso/Action;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lit/sephiroth/android/library/picasso/Picasso;->quickMemoryCacheCheck(Lit/sephiroth/android/library/picasso/Cache;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 590
    :cond_19
    if-eqz v0, :cond_4a

    .line 592
    sget-object v1, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->MEMORY:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    invoke-direct {p0, v0, v1, p1}, Lit/sephiroth/android/library/picasso/Picasso;->deliverAction(Landroid/graphics/Bitmap;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;Lit/sephiroth/android/library/picasso/Action;)V

    .line 593
    iget-boolean v1, p0, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v1, :cond_46

    .line 594
    const-string v1, "Main"

    const-string v2, "completed"

    iget-object v3, p1, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v3}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "from "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->MEMORY:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 603
    :cond_46
    :goto_46
    return-void

    .line 587
    :cond_47
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Picasso;->cache:Lit/sephiroth/android/library/picasso/Cache;

    goto :goto_11

    .line 598
    :cond_4a
    const-wide/16 v2, 0x0

    invoke-virtual {p0, p1, v2, v3}, Lit/sephiroth/android/library/picasso/Picasso;->enqueueAndSubmit(Lit/sephiroth/android/library/picasso/Action;J)V

    .line 599
    iget-boolean v1, p0, Lit/sephiroth/android/library/picasso/Picasso;->loggingEnabled:Z

    if-eqz v1, :cond_46

    .line 600
    const-string v1, "Main"

    const-string v2, "resumed"

    iget-object v3, p1, Lit/sephiroth/android/library/picasso/Action;->request:Lit/sephiroth/android/library/picasso/Request;

    invoke-virtual {v3}, Lit/sephiroth/android/library/picasso/Request;->logId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lit/sephiroth/android/library/picasso/Utils;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_46
.end method

.method submit(Lit/sephiroth/android/library/picasso/Action;J)V
    .registers 6
    .param p1, "action"    # Lit/sephiroth/android/library/picasso/Action;
    .param p2, "delayMillis"    # J

    .prologue
    .line 530
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Picasso;->dispatcher:Lit/sephiroth/android/library/picasso/Dispatcher;

    invoke-virtual {v0, p1, p2, p3}, Lit/sephiroth/android/library/picasso/Dispatcher;->dispatchSubmit(Lit/sephiroth/android/library/picasso/Action;J)V

    .line 531
    return-void
.end method

.method transformRequest(Lit/sephiroth/android/library/picasso/Request;)Lit/sephiroth/android/library/picasso/Request;
    .registers 6
    .param p1, "request"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 495
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/Picasso;->requestTransformer:Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;

    invoke-interface {v1, p1}, Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;->transformRequest(Lit/sephiroth/android/library/picasso/Request;)Lit/sephiroth/android/library/picasso/Request;

    move-result-object v0

    .line 496
    .local v0, "transformed":Lit/sephiroth/android/library/picasso/Request;
    if-nez v0, :cond_35

    .line 497
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Request transformer "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Picasso;->requestTransformer:Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;

    .line 498
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " returned null for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 502
    :cond_35
    return-object v0
.end method
