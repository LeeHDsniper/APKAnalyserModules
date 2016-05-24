.class Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$1;
.super Ljava/lang/Object;
.source "AdobeCommonCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->startScrubbingTimer()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;)V
    .registers 2
    .param p1, "this$0"    # Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    .prologue
    .line 95
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 98
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->verboseLogging:Z
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->access$000(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;)Z

    move-result v0

    if-eqz v0, :cond_33

    .line 99
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->INFO:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v1, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "***** Async cache scrubbing event at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/text/SimpleDateFormat;->getInstance()Ljava/text/DateFormat;

    move-result-object v3

    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3, v4}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    :cond_33
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache$1;->this$0:Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;

    # getter for: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->scrubAge:I
    invoke-static {v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->access$100(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;)I

    move-result v1

    # invokes: Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->removeDiskCachesOlderThan(I)V
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;->access$200(Lcom/adobe/creativesdk/foundation/internal/cache/AdobeCommonCache;I)V

    .line 101
    return-void
.end method
