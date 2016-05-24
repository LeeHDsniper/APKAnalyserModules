.class Lcom/squareup/okhttp/Cache$CacheResponseBody$1;
.super Lokio/ForwardingSource;
.source "Cache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/okhttp/Cache$CacheResponseBody;-><init>(Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/squareup/okhttp/Cache$CacheResponseBody;

.field final synthetic val$snapshot:Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/Cache$CacheResponseBody;Lokio/Source;Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;)V
    .registers 4
    .param p2, "x0"    # Lokio/Source;

    .prologue
    .line 600
    iput-object p1, p0, Lcom/squareup/okhttp/Cache$CacheResponseBody$1;->this$0:Lcom/squareup/okhttp/Cache$CacheResponseBody;

    iput-object p3, p0, Lcom/squareup/okhttp/Cache$CacheResponseBody$1;->val$snapshot:Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;

    invoke-direct {p0, p2}, Lokio/ForwardingSource;-><init>(Lokio/Source;)V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 602
    iget-object v0, p0, Lcom/squareup/okhttp/Cache$CacheResponseBody$1;->val$snapshot:Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;

    invoke-virtual {v0}, Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;->close()V

    .line 603
    invoke-super {p0}, Lokio/ForwardingSource;->close()V

    .line 604
    return-void
.end method
