.class Lcom/squareup/okhttp/Cache$CacheResponseBody;
.super Lcom/squareup/okhttp/ResponseBody;
.source "Cache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/Cache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CacheResponseBody"
.end annotation


# instance fields
.field private final bodySource:Lokio/BufferedSource;

.field private final contentLength:Ljava/lang/String;

.field private final contentType:Ljava/lang/String;

.field private final snapshot:Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;


# direct methods
.method public constructor <init>(Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "snapshot"    # Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;
    .param p2, "contentType"    # Ljava/lang/String;
    .param p3, "contentLength"    # Ljava/lang/String;

    .prologue
    .line 594
    invoke-direct {p0}, Lcom/squareup/okhttp/ResponseBody;-><init>()V

    .line 595
    iput-object p1, p0, Lcom/squareup/okhttp/Cache$CacheResponseBody;->snapshot:Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;

    .line 596
    iput-object p2, p0, Lcom/squareup/okhttp/Cache$CacheResponseBody;->contentType:Ljava/lang/String;

    .line 597
    iput-object p3, p0, Lcom/squareup/okhttp/Cache$CacheResponseBody;->contentLength:Ljava/lang/String;

    .line 599
    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;->getSource(I)Lokio/Source;

    move-result-object v0

    .line 600
    .local v0, "source":Lokio/Source;
    new-instance v1, Lcom/squareup/okhttp/Cache$CacheResponseBody$1;

    invoke-direct {v1, p0, v0, p1}, Lcom/squareup/okhttp/Cache$CacheResponseBody$1;-><init>(Lcom/squareup/okhttp/Cache$CacheResponseBody;Lokio/Source;Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;)V

    invoke-static {v1}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/Cache$CacheResponseBody;->bodySource:Lokio/BufferedSource;

    .line 606
    return-void
.end method

.method static synthetic access$500(Lcom/squareup/okhttp/Cache$CacheResponseBody;)Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/Cache$CacheResponseBody;

    .prologue
    .line 587
    iget-object v0, p0, Lcom/squareup/okhttp/Cache$CacheResponseBody;->snapshot:Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;

    return-object v0
.end method


# virtual methods
.method public contentLength()J
    .registers 5

    .prologue
    const-wide/16 v2, -0x1

    .line 614
    :try_start_2
    iget-object v1, p0, Lcom/squareup/okhttp/Cache$CacheResponseBody;->contentLength:Ljava/lang/String;

    if-eqz v1, :cond_c

    iget-object v1, p0, Lcom/squareup/okhttp/Cache$CacheResponseBody;->contentLength:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_b
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_b} :catch_d

    move-result-wide v2

    .line 616
    :cond_c
    :goto_c
    return-wide v2

    .line 615
    :catch_d
    move-exception v0

    .line 616
    .local v0, "e":Ljava/lang/NumberFormatException;
    goto :goto_c
.end method

.method public source()Lokio/BufferedSource;
    .registers 2

    .prologue
    .line 621
    iget-object v0, p0, Lcom/squareup/okhttp/Cache$CacheResponseBody;->bodySource:Lokio/BufferedSource;

    return-object v0
.end method
