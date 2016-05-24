.class public final Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;
.super Ljava/lang/Object;
.source "DiskLruCache.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Snapshot"
.end annotation


# instance fields
.field private files:[Ljava/io/File;

.field private final ins:[Ljava/io/InputStream;

.field private final key:Ljava/lang/String;

.field private final lengths:[J

.field private final sequenceNumber:J

.field final synthetic this$0:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;


# direct methods
.method private constructor <init>(Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;Ljava/lang/String;J[Ljava/io/File;[Ljava/io/InputStream;[J)V
    .registers 9
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "sequenceNumber"    # J
    .param p5, "files"    # [Ljava/io/File;
    .param p6, "ins"    # [Ljava/io/InputStream;
    .param p7, "lengths"    # [J

    .prologue
    .line 713
    iput-object p1, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->this$0:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 714
    iput-object p2, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->key:Ljava/lang/String;

    .line 715
    iput-wide p3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->sequenceNumber:J

    .line 716
    iput-object p5, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->files:[Ljava/io/File;

    .line 717
    iput-object p6, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->ins:[Ljava/io/InputStream;

    .line 718
    iput-object p7, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->lengths:[J

    .line 719
    return-void
.end method

.method synthetic constructor <init>(Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;Ljava/lang/String;J[Ljava/io/File;[Ljava/io/InputStream;[JLcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$1;)V
    .registers 10
    .param p1, "x0"    # Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;
    .param p2, "x1"    # Ljava/lang/String;
    .param p3, "x2"    # J
    .param p5, "x3"    # [Ljava/io/File;
    .param p6, "x4"    # [Ljava/io/InputStream;
    .param p7, "x5"    # [J
    .param p8, "x6"    # Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$1;

    .prologue
    .line 706
    invoke-direct/range {p0 .. p7}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;-><init>(Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;Ljava/lang/String;J[Ljava/io/File;[Ljava/io/InputStream;[J)V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 5

    .prologue
    .line 751
    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->ins:[Ljava/io/InputStream;

    .local v0, "arr$":[Ljava/io/InputStream;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_4
    if-ge v1, v3, :cond_e

    aget-object v2, v0, v1

    .line 752
    .local v2, "in":Ljava/io/InputStream;
    invoke-static {v2}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 751
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 754
    .end local v2    # "in":Ljava/io/InputStream;
    :cond_e
    return-void
.end method

.method public getFile(I)Ljava/io/File;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 732
    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->files:[Ljava/io/File;

    aget-object v0, v0, p1

    return-object v0
.end method
