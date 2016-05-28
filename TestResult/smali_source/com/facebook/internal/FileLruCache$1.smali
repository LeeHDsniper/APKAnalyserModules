.class Lcom/facebook/internal/FileLruCache$1;
.super Ljava/lang/Object;
.source "FileLruCache.java"

# interfaces
.implements Lcom/facebook/internal/FileLruCache$StreamCloseCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/internal/FileLruCache;->openPutStream(Ljava/lang/String;Ljava/lang/String;)Ljava/io/OutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/internal/FileLruCache;

.field private final synthetic val$buffer:Ljava/io/File;

.field private final synthetic val$bufferFileCreateTime:J

.field private final synthetic val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/facebook/internal/FileLruCache;JLjava/io/File;Ljava/lang/String;)V
    .registers 6

    .prologue
    .line 1
    iput-object p1, p0, Lcom/facebook/internal/FileLruCache$1;->this$0:Lcom/facebook/internal/FileLruCache;

    iput-wide p2, p0, Lcom/facebook/internal/FileLruCache$1;->val$bufferFileCreateTime:J

    iput-object p4, p0, Lcom/facebook/internal/FileLruCache$1;->val$buffer:Ljava/io/File;

    iput-object p5, p0, Lcom/facebook/internal/FileLruCache$1;->val$key:Ljava/lang/String;

    .line 183
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose()V
    .registers 5

    .prologue
    .line 188
    iget-wide v0, p0, Lcom/facebook/internal/FileLruCache$1;->val$bufferFileCreateTime:J

    iget-object v2, p0, Lcom/facebook/internal/FileLruCache$1;->this$0:Lcom/facebook/internal/FileLruCache;

    # getter for: Lcom/facebook/internal/FileLruCache;->lastClearCacheTime:Ljava/util/concurrent/atomic/AtomicLong;
    invoke-static {v2}, Lcom/facebook/internal/FileLruCache;->access$1(Lcom/facebook/internal/FileLruCache;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_16

    .line 189
    iget-object v0, p0, Lcom/facebook/internal/FileLruCache$1;->val$buffer:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 193
    :goto_15
    return-void

    .line 191
    :cond_16
    iget-object v0, p0, Lcom/facebook/internal/FileLruCache$1;->this$0:Lcom/facebook/internal/FileLruCache;

    iget-object v1, p0, Lcom/facebook/internal/FileLruCache$1;->val$key:Ljava/lang/String;

    iget-object v2, p0, Lcom/facebook/internal/FileLruCache$1;->val$buffer:Ljava/io/File;

    # invokes: Lcom/facebook/internal/FileLruCache;->renameToTargetAndTrim(Ljava/lang/String;Ljava/io/File;)V
    invoke-static {v0, v1, v2}, Lcom/facebook/internal/FileLruCache;->access$2(Lcom/facebook/internal/FileLruCache;Ljava/lang/String;Ljava/io/File;)V

    goto :goto_15
.end method
