.class Lcom/squareup/okhttp/internal/DiskLruCache$Editor$FaultHidingSink;
.super Lokio/ForwardingSink;
.source "DiskLruCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FaultHidingSink"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Lokio/Sink;)V
    .registers 3
    .param p2, "delegate"    # Lokio/Sink;

    .prologue
    .line 874
    iput-object p1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor$FaultHidingSink;->this$1:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    .line 875
    invoke-direct {p0, p2}, Lokio/ForwardingSink;-><init>(Lokio/Sink;)V

    .line 876
    return-void
.end method


# virtual methods
.method public close()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 900
    :try_start_0
    invoke-super {p0}, Lokio/ForwardingSink;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 906
    :goto_3
    return-void

    .line 901
    :catch_4
    move-exception v0

    .line 902
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor$FaultHidingSink;->this$1:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    iget-object v2, v1, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v2

    .line 903
    :try_start_a
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor$FaultHidingSink;->this$1:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    const/4 v3, 0x1

    # setter for: Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->hasErrors:Z
    invoke-static {v1, v3}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->access$1802(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)Z

    .line 904
    monitor-exit v2

    goto :goto_3

    :catchall_12
    move-exception v1

    monitor-exit v2
    :try_end_14
    .catchall {:try_start_a .. :try_end_14} :catchall_12

    throw v1
.end method

.method public flush()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 890
    :try_start_0
    invoke-super {p0}, Lokio/ForwardingSink;->flush()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 896
    :goto_3
    return-void

    .line 891
    :catch_4
    move-exception v0

    .line 892
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor$FaultHidingSink;->this$1:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    iget-object v2, v1, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v2

    .line 893
    :try_start_a
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor$FaultHidingSink;->this$1:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    const/4 v3, 0x1

    # setter for: Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->hasErrors:Z
    invoke-static {v1, v3}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->access$1802(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)Z

    .line 894
    monitor-exit v2

    goto :goto_3

    :catchall_12
    move-exception v1

    monitor-exit v2
    :try_end_14
    .catchall {:try_start_a .. :try_end_14} :catchall_12

    throw v1
.end method

.method public write(Lokio/Buffer;J)V
    .registers 8
    .param p1, "source"    # Lokio/Buffer;
    .param p2, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 880
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Lokio/ForwardingSink;->write(Lokio/Buffer;J)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 886
    :goto_3
    return-void

    .line 881
    :catch_4
    move-exception v0

    .line 882
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor$FaultHidingSink;->this$1:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    iget-object v2, v1, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    monitor-enter v2

    .line 883
    :try_start_a
    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Editor$FaultHidingSink;->this$1:Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    const/4 v3, 0x1

    # setter for: Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->hasErrors:Z
    invoke-static {v1, v3}, Lcom/squareup/okhttp/internal/DiskLruCache$Editor;->access$1802(Lcom/squareup/okhttp/internal/DiskLruCache$Editor;Z)Z

    .line 884
    monitor-exit v2

    goto :goto_3

    :catchall_12
    move-exception v1

    monitor-exit v2
    :try_end_14
    .catchall {:try_start_a .. :try_end_14} :catchall_12

    throw v1
.end method
