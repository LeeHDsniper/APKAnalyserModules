.class Lcom/squareup/okhttp/internal/DiskLruCache$1;
.super Ljava/lang/Object;
.source "DiskLruCache.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/okhttp/internal/DiskLruCache;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/internal/DiskLruCache;)V
    .registers 2

    .prologue
    .line 160
    iput-object p1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$1;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 162
    iget-object v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache$1;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v2

    .line 163
    :try_start_3
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$1;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    # getter for: Lcom/squareup/okhttp/internal/DiskLruCache;->journalWriter:Lokio/BufferedSink;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$000(Lcom/squareup/okhttp/internal/DiskLruCache;)Lokio/BufferedSink;

    move-result-object v1

    if-nez v1, :cond_d

    .line 164
    monitor-exit v2
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_27

    .line 176
    :goto_c
    return-void

    .line 167
    :cond_d
    :try_start_d
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$1;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->trimToSize()V
    invoke-static {v1}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$100(Lcom/squareup/okhttp/internal/DiskLruCache;)V

    .line 168
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$1;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->journalRebuildRequired()Z
    invoke-static {v1}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$200(Lcom/squareup/okhttp/internal/DiskLruCache;)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 169
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$1;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->rebuildJournal()V
    invoke-static {v1}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$300(Lcom/squareup/okhttp/internal/DiskLruCache;)V

    .line 170
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$1;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    const/4 v3, 0x0

    # setter for: Lcom/squareup/okhttp/internal/DiskLruCache;->redundantOpCount:I
    invoke-static {v1, v3}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$402(Lcom/squareup/okhttp/internal/DiskLruCache;I)I
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_25} :catch_2a
    .catchall {:try_start_d .. :try_end_25} :catchall_27

    .line 175
    :cond_25
    :try_start_25
    monitor-exit v2

    goto :goto_c

    :catchall_27
    move-exception v1

    monitor-exit v2
    :try_end_29
    .catchall {:try_start_25 .. :try_end_29} :catchall_27

    throw v1

    .line 172
    :catch_2a
    move-exception v0

    .line 173
    .local v0, "e":Ljava/io/IOException;
    :try_start_2b
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_31
    .catchall {:try_start_2b .. :try_end_31} :catchall_27
.end method
