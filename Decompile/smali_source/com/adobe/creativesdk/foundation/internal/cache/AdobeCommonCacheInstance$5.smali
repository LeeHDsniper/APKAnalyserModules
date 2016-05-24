.class Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$5;
.super Ljava/lang/Object;
.source "AdobeCommonCacheInstance.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->startRepeatingTimer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    .prologue
    .line 1029
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 1032
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "***** Async eviction event at "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/text/SimpleDateFormat;->getDateInstance()Ljava/text/DateFormat;

    move-result-object v2

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$900(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;)V

    .line 1034
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$1000(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)J

    move-result-wide v0

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getNormalEvictionThreshold()I
    invoke-static {v2}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$1100(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)I

    move-result v2

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_3c

    .line 1035
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheEviction()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$1200(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)V

    .line 1040
    :goto_3b
    return-void

    .line 1037
    :cond_3c
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    const-string v1, "Stopping eviction timer: %d < %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->currentDiskCacheSize:J
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$1000(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->getNormalEvictionThreshold()I
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$1100(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->cacheLog(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$900(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;Ljava/lang/String;)V

    .line 1038
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance$5;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->stopRepeatingTimer()V
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;->access$1300(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCacheInstance;)V

    goto :goto_3b
.end method
