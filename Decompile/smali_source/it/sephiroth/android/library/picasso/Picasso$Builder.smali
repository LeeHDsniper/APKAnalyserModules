.class public Lit/sephiroth/android/library/picasso/Picasso$Builder;
.super Ljava/lang/Object;
.source "Picasso.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Picasso;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private cache:Lit/sephiroth/android/library/picasso/Cache;

.field private final context:Landroid/content/Context;

.field private defaultBitmapConfig:Landroid/graphics/Bitmap$Config;

.field private downloader:Lit/sephiroth/android/library/picasso/Downloader;

.field private indicatorsEnabled:Z

.field private listener:Lit/sephiroth/android/library/picasso/Picasso$Listener;

.field private loggingEnabled:Z

.field private requestHandlers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lit/sephiroth/android/library/picasso/RequestHandler;",
            ">;"
        }
    .end annotation
.end field

.field private service:Ljava/util/concurrent/ExecutorService;

.field private transformer:Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 757
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 758
    if-nez p1, :cond_d

    .line 759
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 761
    :cond_d
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->context:Landroid/content/Context;

    .line 762
    return-void
.end method


# virtual methods
.method public build()Lit/sephiroth/android/library/picasso/Picasso;
    .registers 20

    .prologue
    .line 887
    move-object/from16 v0, p0

    iget-object v2, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->context:Landroid/content/Context;

    .line 889
    .local v2, "context":Landroid/content/Context;
    move-object/from16 v0, p0

    iget-object v3, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->downloader:Lit/sephiroth/android/library/picasso/Downloader;

    if-nez v3, :cond_12

    .line 890
    invoke-static {v2}, Lit/sephiroth/android/library/picasso/Utils;->createDefaultDownloader(Landroid/content/Context;)Lit/sephiroth/android/library/picasso/Downloader;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->downloader:Lit/sephiroth/android/library/picasso/Downloader;

    .line 892
    :cond_12
    move-object/from16 v0, p0

    iget-object v3, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->cache:Lit/sephiroth/android/library/picasso/Cache;

    if-nez v3, :cond_21

    .line 893
    new-instance v3, Lit/sephiroth/android/library/picasso/LruCache;

    invoke-direct {v3, v2}, Lit/sephiroth/android/library/picasso/LruCache;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->cache:Lit/sephiroth/android/library/picasso/Cache;

    .line 895
    :cond_21
    move-object/from16 v0, p0

    iget-object v3, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->service:Ljava/util/concurrent/ExecutorService;

    if-nez v3, :cond_30

    .line 896
    new-instance v3, Lit/sephiroth/android/library/picasso/PicassoExecutorService;

    invoke-direct {v3}, Lit/sephiroth/android/library/picasso/PicassoExecutorService;-><init>()V

    move-object/from16 v0, p0

    iput-object v3, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->service:Ljava/util/concurrent/ExecutorService;

    .line 898
    :cond_30
    move-object/from16 v0, p0

    iget-object v3, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->transformer:Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;

    if-nez v3, :cond_3c

    .line 899
    sget-object v3, Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;->IDENTITY:Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;

    move-object/from16 v0, p0

    iput-object v3, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->transformer:Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;

    .line 902
    :cond_3c
    new-instance v7, Lit/sephiroth/android/library/picasso/Stats;

    move-object/from16 v0, p0

    iget-object v3, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->cache:Lit/sephiroth/android/library/picasso/Cache;

    invoke-direct {v7, v3}, Lit/sephiroth/android/library/picasso/Stats;-><init>(Lit/sephiroth/android/library/picasso/Cache;)V

    .line 904
    .local v7, "stats":Lit/sephiroth/android/library/picasso/Stats;
    new-instance v1, Lit/sephiroth/android/library/picasso/Dispatcher;

    move-object/from16 v0, p0

    iget-object v3, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->service:Ljava/util/concurrent/ExecutorService;

    sget-object v4, Lit/sephiroth/android/library/picasso/Picasso;->HANDLER:Landroid/os/Handler;

    move-object/from16 v0, p0

    iget-object v5, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->downloader:Lit/sephiroth/android/library/picasso/Downloader;

    move-object/from16 v0, p0

    iget-object v6, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->cache:Lit/sephiroth/android/library/picasso/Cache;

    invoke-direct/range {v1 .. v7}, Lit/sephiroth/android/library/picasso/Dispatcher;-><init>(Landroid/content/Context;Ljava/util/concurrent/ExecutorService;Landroid/os/Handler;Lit/sephiroth/android/library/picasso/Downloader;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Stats;)V

    .line 906
    .local v1, "dispatcher":Lit/sephiroth/android/library/picasso/Dispatcher;
    new-instance v8, Lit/sephiroth/android/library/picasso/Picasso;

    move-object/from16 v0, p0

    iget-object v11, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->cache:Lit/sephiroth/android/library/picasso/Cache;

    move-object/from16 v0, p0

    iget-object v12, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->listener:Lit/sephiroth/android/library/picasso/Picasso$Listener;

    move-object/from16 v0, p0

    iget-object v13, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->transformer:Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;

    move-object/from16 v0, p0

    iget-object v14, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->requestHandlers:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v0, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->defaultBitmapConfig:Landroid/graphics/Bitmap$Config;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->indicatorsEnabled:Z

    move/from16 v17, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lit/sephiroth/android/library/picasso/Picasso$Builder;->loggingEnabled:Z

    move/from16 v18, v0

    move-object v9, v2

    move-object v10, v1

    move-object v15, v7

    invoke-direct/range {v8 .. v18}, Lit/sephiroth/android/library/picasso/Picasso;-><init>(Landroid/content/Context;Lit/sephiroth/android/library/picasso/Dispatcher;Lit/sephiroth/android/library/picasso/Cache;Lit/sephiroth/android/library/picasso/Picasso$Listener;Lit/sephiroth/android/library/picasso/Picasso$RequestTransformer;Ljava/util/List;Lit/sephiroth/android/library/picasso/Stats;Landroid/graphics/Bitmap$Config;ZZ)V

    return-object v8
.end method
