.class public abstract Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;
.super Ljava/lang/Object;
.source "BaseDiscCache.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/cache/disc/DiskCache;


# static fields
.field public static final DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;


# instance fields
.field protected bufferSize:I

.field protected final cacheDir:Ljava/io/File;

.field protected compressFormat:Landroid/graphics/Bitmap$CompressFormat;

.field protected compressQuality:I

.field protected final fileNameGenerator:Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

.field protected final reserveCacheDir:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    sput-object v0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/io/File;Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;)V
    .registers 6
    .param p1, "cacheDir"    # Ljava/io/File;
    .param p2, "reserveCacheDir"    # Ljava/io/File;
    .param p3, "fileNameGenerator"    # Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const v0, 0x8000

    iput v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->bufferSize:I

    .line 56
    sget-object v0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->DEFAULT_COMPRESS_FORMAT:Landroid/graphics/Bitmap$CompressFormat;

    iput-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->compressFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 57
    const/16 v0, 0x64

    iput v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->compressQuality:I

    .line 79
    if-nez p1, :cond_1a

    .line 80
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "cacheDir argument must be not null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_1a
    if-nez p3, :cond_24

    .line 83
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "fileNameGenerator argument must be not null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 86
    :cond_24
    iput-object p1, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->cacheDir:Ljava/io/File;

    .line 87
    iput-object p2, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->reserveCacheDir:Ljava/io/File;

    .line 88
    iput-object p3, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->fileNameGenerator:Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

    .line 89
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Ljava/io/File;
    .registers 3
    .param p1, "imageUri"    # Ljava/lang/String;

    .prologue
    .line 98
    invoke-virtual {p0, p1}, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method protected getFile(Ljava/lang/String;)Ljava/io/File;
    .registers 5
    .param p1, "imageUri"    # Ljava/lang/String;

    .prologue
    .line 168
    iget-object v2, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->fileNameGenerator:Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

    invoke-interface {v2, p1}, Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;->generate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 169
    .local v1, "fileName":Ljava/lang/String;
    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->cacheDir:Ljava/io/File;

    .line 170
    .local v0, "dir":Ljava/io/File;
    iget-object v2, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->cacheDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_2e

    iget-object v2, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->cacheDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_2e

    .line 171
    iget-object v2, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->reserveCacheDir:Ljava/io/File;

    if-eqz v2, :cond_2e

    iget-object v2, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->reserveCacheDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_2c

    iget-object v2, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->reserveCacheDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 172
    :cond_2c
    iget-object v0, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->reserveCacheDir:Ljava/io/File;

    .line 175
    :cond_2e
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v2
.end method

.method public save(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    .registers 9
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    invoke-virtual {p0, p1}, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 128
    .local v0, "imageFile":Ljava/io/File;
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".tmp"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 129
    .local v3, "tmpFile":Ljava/io/File;
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iget v5, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->bufferSize:I

    invoke-direct {v1, v4, v5}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 130
    .local v1, "os":Ljava/io/OutputStream;
    const/4 v2, 0x0

    .line 132
    .local v2, "savedSuccessfully":Z
    :try_start_2d
    iget-object v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->compressFormat:Landroid/graphics/Bitmap$CompressFormat;

    iget v5, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->compressQuality:I

    invoke-virtual {p2, v4, v5, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z
    :try_end_34
    .catchall {:try_start_2d .. :try_end_34} :catchall_4a

    move-result v2

    .line 134
    invoke-static {v1}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 135
    if-eqz v2, :cond_41

    invoke-virtual {v3, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v4

    if-nez v4, :cond_41

    .line 136
    const/4 v2, 0x0

    .line 138
    :cond_41
    if-nez v2, :cond_46

    .line 139
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 142
    :cond_46
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->recycle()V

    .line 143
    return v2

    .line 134
    :catchall_4a
    move-exception v4

    invoke-static {v1}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 135
    if-eqz v2, :cond_57

    invoke-virtual {v3, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_57

    .line 136
    const/4 v2, 0x0

    .line 138
    :cond_57
    if-nez v2, :cond_5c

    .line 139
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    :cond_5c
    throw v4
.end method

.method public save(Ljava/lang/String;Ljava/io/InputStream;Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;)Z
    .registers 10
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "imageStream"    # Ljava/io/InputStream;
    .param p3, "listener"    # Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-virtual {p0, p1}, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->getFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 104
    .local v0, "imageFile":Ljava/io/File;
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".tmp"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 105
    .local v3, "tmpFile":Ljava/io/File;
    const/4 v1, 0x0

    .line 107
    .local v1, "loaded":Z
    :try_start_21
    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iget v5, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->bufferSize:I

    invoke-direct {v2, v4, v5}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_2d
    .catchall {:try_start_21 .. :try_end_2d} :catchall_4d

    .line 109
    .local v2, "os":Ljava/io/OutputStream;
    :try_start_2d
    iget v4, p0, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;->bufferSize:I

    invoke-static {p2, v2, p3, v4}, Lcom/nostra13/universalimageloader/utils/IoUtils;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;I)Z
    :try_end_32
    .catchall {:try_start_2d .. :try_end_32} :catchall_48

    move-result v1

    .line 111
    :try_start_33
    invoke-static {v2}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V
    :try_end_36
    .catchall {:try_start_33 .. :try_end_36} :catchall_4d

    .line 114
    invoke-static {p2}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 115
    if-eqz v1, :cond_42

    invoke-virtual {v3, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v4

    if-nez v4, :cond_42

    .line 116
    const/4 v1, 0x0

    .line 118
    :cond_42
    if-nez v1, :cond_47

    .line 119
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 122
    :cond_47
    return v1

    .line 111
    :catchall_48
    move-exception v4

    :try_start_49
    invoke-static {v2}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    throw v4
    :try_end_4d
    .catchall {:try_start_49 .. :try_end_4d} :catchall_4d

    .line 114
    .end local v2    # "os":Ljava/io/OutputStream;
    :catchall_4d
    move-exception v4

    invoke-static {p2}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 115
    if-eqz v1, :cond_5a

    invoke-virtual {v3, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_5a

    .line 116
    const/4 v1, 0x0

    .line 118
    :cond_5a
    if-nez v1, :cond_5f

    .line 119
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    :cond_5f
    throw v4
.end method
