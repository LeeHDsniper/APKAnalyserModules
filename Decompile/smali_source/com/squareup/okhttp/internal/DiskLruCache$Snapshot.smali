.class public final Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;
.super Ljava/lang/Object;
.source "DiskLruCache.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Snapshot"
.end annotation


# instance fields
.field private final key:Ljava/lang/String;

.field private final lengths:[J

.field private final sequenceNumber:J

.field private final sources:[Lokio/Source;

.field final synthetic this$0:Lcom/squareup/okhttp/internal/DiskLruCache;


# direct methods
.method private constructor <init>(Lcom/squareup/okhttp/internal/DiskLruCache;Ljava/lang/String;J[Lokio/Source;[J)V
    .registers 8
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "sequenceNumber"    # J
    .param p5, "sources"    # [Lokio/Source;
    .param p6, "lengths"    # [J

    .prologue
    .line 701
    iput-object p1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 702
    iput-object p2, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;->key:Ljava/lang/String;

    .line 703
    iput-wide p3, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;->sequenceNumber:J

    .line 704
    iput-object p5, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;->sources:[Lokio/Source;

    .line 705
    iput-object p6, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;->lengths:[J

    .line 706
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/okhttp/internal/DiskLruCache;Ljava/lang/String;J[Lokio/Source;[JLcom/squareup/okhttp/internal/DiskLruCache$1;)V
    .registers 9
    .param p1, "x0"    # Lcom/squareup/okhttp/internal/DiskLruCache;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # J
    .param p5, "x3"    # [Lokio/Source;
    .param p6, "x4"    # [J
    .param p7, "x5"    # Lcom/squareup/okhttp/internal/DiskLruCache$1;

    .prologue
    .line 695
    invoke-direct/range {p0 .. p6}, Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;-><init>(Lcom/squareup/okhttp/internal/DiskLruCache;Ljava/lang/String;J[Lokio/Source;[J)V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 5

    .prologue
    .line 733
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;->sources:[Lokio/Source;

    .local v0, "arr$":[Lokio/Source;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_4
    if-ge v1, v3, :cond_e

    aget-object v2, v0, v1

    .line 734
    .local v2, "in":Lokio/Source;
    invoke-static {v2}, Lcom/squareup/okhttp/internal/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 733
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 736
    .end local v2    # "in":Lokio/Source;
    :cond_e
    return-void
.end method

.method public edit()Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 714
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;->this$0:Lcom/squareup/okhttp/internal/DiskLruCache;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;->key:Ljava/lang/String;

    iget-wide v2, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;->sequenceNumber:J

    # invokes: Lcom/squareup/okhttp/internal/DiskLruCache;->edit(Ljava/lang/String;J)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;
    invoke-static {v0, v1, v2, v3}, Lcom/squareup/okhttp/internal/DiskLruCache;->access$1900(Lcom/squareup/okhttp/internal/DiskLruCache;Ljava/lang/String;J)Lcom/squareup/okhttp/internal/DiskLruCache$Editor;

    move-result-object v0

    return-object v0
.end method

.method public getSource(I)Lokio/Source;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 719
    iget-object v0, p0, Lcom/squareup/okhttp/internal/DiskLruCache$Snapshot;->sources:[Lokio/Source;

    aget-object v0, v0, p1

    return-object v0
.end method
