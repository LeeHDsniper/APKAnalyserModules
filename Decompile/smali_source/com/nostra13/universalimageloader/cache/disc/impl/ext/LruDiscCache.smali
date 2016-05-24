.class public Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;
.super Ljava/lang/Object;
.source "LruDiscCache.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/cache/disc/DiskCache;


# static fields
.field public static final DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;


# instance fields
.field protected bufferSize:I

.field protected cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

.field protected compressFormat:Landroid/graphics/Bitmap$CompressFormat;

.field protected compressQuality:I

.field protected final fileNameGenerator:Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

.field private reserveCacheDir:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 43
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    sput-object v0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;JI)V
    .registers 13
    .param p1, "cacheDir"    # Ljava/io/File;
    .param p2, "fileNameGenerator"    # Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;
    .param p3, "cacheMaxSize"    # J
    .param p5, "cacheMaxFileCount"    # I

    .prologue
    const-wide/16 v2, 0x0

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    const v0, 0x8000

    iput v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->bufferSize:I

    .line 57
    sget-object v0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

    iput-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->compressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 58
    const/16 v0, 0x64

    iput v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->compressQuality:I

    .line 80
    if-nez p1, :cond_1c

    .line 81
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "cacheDir argument must be not null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 83
    :cond_1c
    cmp-long v0, p3, v2

    if-gez v0, :cond_28

    .line 84
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "cacheMaxSize argument must be positive number"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 86
    :cond_28
    if-gez p5, :cond_32

    .line 87
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "cacheMaxFileCount argument must be positive number"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 89
    :cond_32
    if-nez p2, :cond_3c

    .line 90
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "fileNameGenerator argument must be not null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_3c
    cmp-long v0, p3, v2

    if-nez v0, :cond_45

    .line 94
    const-wide p3, 0x7fffffffffffffffL

    .line 96
    :cond_45
    if-nez p5, :cond_4a

    .line 97
    const p5, 0x7fffffff

    .line 100
    :cond_4a
    iput-object p2, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->fileNameGenerator:Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

    .line 101
    iget-object v3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->reserveCacheDir:Ljava/io/File;

    move-object v1, p0

    move-object v2, p1

    move-wide v4, p3

    move v6, p5

    invoke-direct/range {v1 .. v6}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->initCache(Ljava/io/File;Ljava/io/File;JI)V

    .line 102
    return-void
.end method

.method private getKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "imageUri"    # Ljava/lang/String;

    .prologue
    .line 212
    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->fileNameGenerator:Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

    invoke-interface {v0, p1}, Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;->generate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initCache(Ljava/io/File;Ljava/io/File;JI)V
    .registers 13
    .param p1, "cacheDir"    # Ljava/io/File;
    .param p2, "reserveCacheDir"    # Ljava/io/File;
    .param p3, "cacheMaxSize"    # J
    .param p5, "cacheMaxFileCount"    # I

    .prologue
    .line 106
    const/4 v2, 0x1

    const/4 v3, 0x1

    move-object v1, p1

    move-wide v4, p3

    move v6, p5

    :try_start_5
    invoke-static/range {v1 .. v6}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;->open(Ljava/io/File;IIJI)Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    move-result-object v1

    iput-object v1, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_b} :catch_c

    .line 113
    :cond_b
    :goto_b
    return-void

    .line 107
    :catch_c
    move-exception v0

    .line 108
    .local v0, "e":Ljava/io/IOException;
    invoke-static {v0}, Lcom/nostra13/universalimageloader/utils/L;->e(Ljava/lang/Throwable;)V

    .line 109
    if-eqz p2, :cond_b

    .line 110
    const/4 v3, 0x0

    move-object v1, p0

    move-object v2, p2

    move-wide v4, p3

    move v6, p5

    invoke-direct/range {v1 .. v6}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->initCache(Ljava/io/File;Ljava/io/File;JI)V

    goto :goto_b
.end method


# virtual methods
.method public get(Ljava/lang/String;)Ljava/io/File;
    .registers 7
    .param p1, "imageUri"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 122
    const/4 v1, 0x0

    .line 124
    .local v1, "snapshot":Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;
    :try_start_2
    iget-object v3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    invoke-direct {p0, p1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->getKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;->get(Ljava/lang/String;)Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_b} :catch_1a
    .catchall {:try_start_2 .. :try_end_b} :catchall_24

    move-result-object v1

    .line 125
    if-nez v1, :cond_14

    .line 130
    :goto_e
    if-eqz v1, :cond_13

    .line 131
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->close()V

    :cond_13
    :goto_13
    return-object v2

    .line 125
    :cond_14
    const/4 v3, 0x0

    :try_start_15
    invoke-virtual {v1, v3}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->getFile(I)Ljava/io/File;
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_18} :catch_1a
    .catchall {:try_start_15 .. :try_end_18} :catchall_24

    move-result-object v2

    goto :goto_e

    .line 126
    :catch_1a
    move-exception v0

    .line 127
    .local v0, "e":Ljava/io/IOException;
    :try_start_1b
    invoke-static {v0}, Lcom/nostra13/universalimageloader/utils/L;->e(Ljava/lang/Throwable;)V
    :try_end_1e
    .catchall {:try_start_1b .. :try_end_1e} :catchall_24

    .line 130
    if-eqz v1, :cond_13

    .line 131
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->close()V

    goto :goto_13

    .line 130
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_24
    move-exception v2

    if-eqz v1, :cond_2a

    .line 131
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Snapshot;->close()V

    :cond_2a
    throw v2
.end method

.method public save(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    .registers 8
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 160
    iget-object v3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    invoke-direct {p0, p1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->getKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;->edit(Ljava/lang/String;)Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;

    move-result-object v0

    .line 161
    .local v0, "editor":Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;
    if-nez v0, :cond_e

    .line 177
    :goto_d
    return v2

    .line 165
    :cond_e
    new-instance v1, Ljava/io/BufferedOutputStream;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    move-result-object v3

    iget v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->bufferSize:I

    invoke-direct {v1, v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 166
    .local v1, "os":Ljava/io/OutputStream;
    const/4 v2, 0x0

    .line 168
    .local v2, "savedSuccessfully":Z
    :try_start_1a
    iget-object v3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->compressFormat:Landroid/graphics/Bitmap$CompressFormat;

    iget v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->compressQuality:I

    invoke-virtual {p2, v3, v4, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_21
    .catchall {:try_start_1a .. :try_end_21} :catchall_2b

    move-result v2

    .line 170
    invoke-static {v1}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 172
    if-eqz v2, :cond_30

    .line 173
    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->commit()V

    goto :goto_d

    .line 170
    :catchall_2b
    move-exception v3

    invoke-static {v1}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    throw v3

    .line 175
    :cond_30
    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->abort()V

    goto :goto_d
.end method

.method public save(Ljava/lang/String;Ljava/io/InputStream;Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;)Z
    .registers 9
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "imageStream"    # Ljava/io/InputStream;
    .param p3, "listener"    # Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 138
    iget-object v3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->cache:Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;

    invoke-direct {p0, p1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->getKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache;->edit(Ljava/lang/String;)Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;

    move-result-object v1

    .line 139
    .local v1, "editor":Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;
    if-nez v1, :cond_e

    .line 155
    :goto_d
    return v0

    .line 143
    :cond_e
    new-instance v2, Ljava/io/BufferedOutputStream;

    invoke-virtual {v1, v0}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    move-result-object v3

    iget v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->bufferSize:I

    invoke-direct {v2, v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 144
    .local v2, "os":Ljava/io/OutputStream;
    const/4 v0, 0x0

    .line 146
    .local v0, "copied":Z
    :try_start_1a
    iget v3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->bufferSize:I

    invoke-static {p2, v2, p3, v3}, Lcom/nostra13/universalimageloader/utils/IoUtils;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;I)Z
    :try_end_1f
    .catchall {:try_start_1a .. :try_end_1f} :catchall_2d

    move-result v0

    .line 148
    invoke-static {v2}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 149
    if-eqz v0, :cond_29

    .line 150
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->commit()V

    goto :goto_d

    .line 152
    :cond_29
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->abort()V

    goto :goto_d

    .line 148
    :catchall_2d
    move-exception v3

    invoke-static {v2}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 149
    if-eqz v0, :cond_37

    .line 150
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->commit()V

    .line 152
    :goto_36
    throw v3

    :cond_37
    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/DiskLruCache$Editor;->abort()V

    goto :goto_36
.end method

.method public setReserveCacheDir(Ljava/io/File;)V
    .registers 2
    .param p1, "reserveCacheDir"    # Ljava/io/File;

    .prologue
    .line 219
    iput-object p1, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/ext/LruDiscCache;->reserveCacheDir:Ljava/io/File;

    .line 220
    return-void
.end method
