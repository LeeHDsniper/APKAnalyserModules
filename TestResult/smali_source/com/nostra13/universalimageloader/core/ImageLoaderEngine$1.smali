.class Lcom/nostra13/universalimageloader/core/ImageLoaderEngine$1;
.super Ljava/lang/Object;
.source "ImageLoaderEngine.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;->submit(Lcom/nostra13/universalimageloader/core/LoadAndDisplayImageTask;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;

.field final synthetic val$task:Lcom/nostra13/universalimageloader/core/LoadAndDisplayImageTask;


# direct methods
.method constructor <init>(Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;Lcom/nostra13/universalimageloader/core/LoadAndDisplayImageTask;)V
    .registers 3

    .prologue
    .line 69
    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderEngine$1;->this$0:Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;

    iput-object p2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderEngine$1;->val$task:Lcom/nostra13/universalimageloader/core/LoadAndDisplayImageTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 72
    iget-object v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderEngine$1;->this$0:Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;

    iget-object v2, v2, Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;->configuration:Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;

    iget-object v2, v2, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;->diskCache:Lcom/nostra13/universalimageloader/cache/disc/DiskCache;

    iget-object v3, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderEngine$1;->val$task:Lcom/nostra13/universalimageloader/core/LoadAndDisplayImageTask;

    invoke-virtual {v3}, Lcom/nostra13/universalimageloader/core/LoadAndDisplayImageTask;->getLoadingUri()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/nostra13/universalimageloader/cache/disc/DiskCache;->get(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 73
    .local v0, "image":Ljava/io/File;
    if-eqz v0, :cond_2c

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2c

    const/4 v1, 0x1

    .line 74
    .local v1, "isImageCachedOnDisk":Z
    :goto_19
    iget-object v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderEngine$1;->this$0:Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;

    # invokes: Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;->initExecutorsIfNeed()V
    invoke-static {v2}, Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;->access$000(Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;)V

    .line 75
    if-eqz v1, :cond_2e

    .line 76
    iget-object v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderEngine$1;->this$0:Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;

    # getter for: Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;->taskExecutorForCachedImages:Ljava/util/concurrent/Executor;
    invoke-static {v2}, Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;->access$100(Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;)Ljava/util/concurrent/Executor;

    move-result-object v2

    iget-object v3, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderEngine$1;->val$task:Lcom/nostra13/universalimageloader/core/LoadAndDisplayImageTask;

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 80
    :goto_2b
    return-void

    .line 73
    .end local v1    # "isImageCachedOnDisk":Z
    :cond_2c
    const/4 v1, 0x0

    goto :goto_19

    .line 78
    .restart local v1    # "isImageCachedOnDisk":Z
    :cond_2e
    iget-object v2, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderEngine$1;->this$0:Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;

    # getter for: Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;->taskExecutor:Ljava/util/concurrent/Executor;
    invoke-static {v2}, Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;->access$200(Lcom/nostra13/universalimageloader/core/ImageLoaderEngine;)Ljava/util/concurrent/Executor;

    move-result-object v2

    iget-object v3, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderEngine$1;->val$task:Lcom/nostra13/universalimageloader/core/LoadAndDisplayImageTask;

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    goto :goto_2b
.end method
