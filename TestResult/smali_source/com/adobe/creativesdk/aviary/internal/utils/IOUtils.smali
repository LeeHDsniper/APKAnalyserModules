.class public final Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;
.super Ljava/lang/Object;
.source "IOUtils.java"


# static fields
.field private static final ASSET_PREFIX_LENGTH:I

.field static final OK_URL_FACTORY:Lcom/squareup/okhttp/OkUrlFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 589
    new-instance v0, Lcom/squareup/okhttp/OkUrlFactory;

    new-instance v1, Lcom/squareup/okhttp/OkHttpClient;

    invoke-direct {v1}, Lcom/squareup/okhttp/OkHttpClient;-><init>()V

    invoke-direct {v0, v1}, Lcom/squareup/okhttp/OkUrlFactory;-><init>(Lcom/squareup/okhttp/OkHttpClient;)V

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->OK_URL_FACTORY:Lcom/squareup/okhttp/OkUrlFactory;

    .line 615
    const-string v0, "file:///android_asset/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sput v0, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->ASSET_PREFIX_LENGTH:I

    return-void
.end method

.method public static cleanDirectory(Ljava/io/File;)V
    .registers 9
    .param p0, "directory"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 495
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1f

    .line 496
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " does not exist"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 497
    .local v4, "message":Ljava/lang/String;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 500
    .end local v4    # "message":Ljava/lang/String;
    :cond_1f
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-nez v5, :cond_3e

    .line 501
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is not a directory"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 502
    .restart local v4    # "message":Ljava/lang/String;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 505
    .end local v4    # "message":Ljava/lang/String;
    :cond_3e
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 506
    .local v2, "files":[Ljava/io/File;
    if-nez v2, :cond_5d

    .line 507
    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to list contents of "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 510
    :cond_5d
    const/4 v0, 0x0

    .line 511
    .local v0, "exception":Ljava/io/IOException;
    array-length v6, v2

    const/4 v5, 0x0

    :goto_60
    if-ge v5, v6, :cond_6d

    aget-object v1, v2, v5

    .line 513
    .local v1, "file":Ljava/io/File;
    :try_start_64
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->forceDelete(Ljava/io/File;)V
    :try_end_67
    .catch Ljava/io/IOException; {:try_start_64 .. :try_end_67} :catch_6a

    .line 511
    :goto_67
    add-int/lit8 v5, v5, 0x1

    goto :goto_60

    .line 514
    :catch_6a
    move-exception v3

    .line 515
    .local v3, "ioe":Ljava/io/IOException;
    move-object v0, v3

    goto :goto_67

    .line 519
    .end local v1    # "file":Ljava/io/File;
    .end local v3    # "ioe":Ljava/io/IOException;
    :cond_6d
    if-eqz v0, :cond_70

    .line 520
    throw v0

    .line 522
    :cond_70
    return-void
.end method

.method public static closeSilently(Landroid/database/Cursor;)V
    .registers 2
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 218
    if-eqz p0, :cond_b

    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_b

    .line 219
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_b} :catch_c

    .line 223
    :cond_b
    :goto_b
    return-void

    .line 221
    :catch_c
    move-exception v0

    goto :goto_b
.end method

.method public static closeSilently(Landroid/os/ParcelFileDescriptor;)V
    .registers 2
    .param p0, "c"    # Landroid/os/ParcelFileDescriptor;

    .prologue
    .line 206
    if-nez p0, :cond_3

    .line 214
    :goto_2
    return-void

    .line 210
    :cond_3
    :try_start_3
    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_6} :catch_7

    goto :goto_2

    .line 211
    :catch_7
    move-exception v0

    goto :goto_2
.end method

.method public static closeSilently(Ljava/io/Closeable;)V
    .registers 2
    .param p0, "c"    # Ljava/io/Closeable;

    .prologue
    .line 179
    if-nez p0, :cond_3

    .line 187
    :goto_2
    return-void

    .line 183
    :cond_3
    :try_start_3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_6} :catch_7

    goto :goto_2

    .line 184
    :catch_7
    move-exception v0

    goto :goto_2
.end method

.method public static closeSilently(Ljava/util/zip/ZipFile;)V
    .registers 2
    .param p0, "c"    # Ljava/util/zip/ZipFile;

    .prologue
    .line 195
    if-nez p0, :cond_3

    .line 203
    :goto_2
    return-void

    .line 199
    :cond_3
    :try_start_3
    invoke-virtual {p0}, Ljava/util/zip/ZipFile;->close()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_6} :catch_7

    goto :goto_2

    .line 200
    :catch_7
    move-exception v0

    goto :goto_2
.end method

.method public static copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 5
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 227
    const/16 v2, 0x1000

    new-array v0, v2, [B

    .line 230
    .local v0, "buffer":[B
    :goto_4
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "read":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_10

    .line 231
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_4

    .line 233
    :cond_10
    return-void
.end method

.method public static createNoMediaFile(Ljava/io/File;)V
    .registers 4
    .param p0, "parent"    # Ljava/io/File;

    .prologue
    .line 642
    if-eqz p0, :cond_18

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_18

    .line 643
    new-instance v1, Ljava/io/File;

    const-string v2, ".nomedia"

    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 644
    .local v1, "noMedia":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_18

    .line 646
    :try_start_15
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_18} :catch_19

    .line 652
    .end local v1    # "noMedia":Ljava/io/File;
    :cond_18
    :goto_18
    return-void

    .line 647
    .restart local v1    # "noMedia":Ljava/io/File;
    :catch_19
    move-exception v0

    .line 648
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_18
.end method

.method public static deleteDirectory(Ljava/io/File;)V
    .registers 4
    .param p0, "directory"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 470
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_7

    .line 482
    :cond_6
    return-void

    .line 474
    :cond_7
    invoke-static {p0}, Lorg/apache/commons/io/FileUtils;->isSymlink(Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_10

    .line 475
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->cleanDirectory(Ljava/io/File;)V

    .line 478
    :cond_10
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v1

    if-nez v1, :cond_6

    .line 479
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to delete directory "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 480
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static deleteQuietly(Ljava/io/File;)Z
    .registers 4
    .param p0, "file"    # Ljava/io/File;

    .prologue
    const/4 v1, 0x0

    .line 572
    if-nez p0, :cond_4

    .line 585
    :goto_3
    return v1

    .line 576
    :cond_4
    :try_start_4
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_d

    .line 577
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->cleanDirectory(Ljava/io/File;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_d} :catch_14

    .line 583
    :cond_d
    :goto_d
    :try_start_d
    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_10} :catch_12

    move-result v1

    goto :goto_3

    .line 584
    :catch_12
    move-exception v0

    .line 585
    .local v0, "ignored":Ljava/lang/Exception;
    goto :goto_3

    .line 579
    .end local v0    # "ignored":Ljava/lang/Exception;
    :catch_14
    move-exception v2

    goto :goto_d
.end method

.method public static download(Ljava/lang/String;Ljava/util/List;)Ljava/io/ByteArrayInputStream;
    .registers 10
    .param p0, "urlname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;)",
            "Ljava/io/ByteArrayInputStream;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 592
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/NameValuePair;>;"
    if-eqz p1, :cond_19

    .line 593
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "utf-8"

    invoke-static {p1, v6}, Lorg/apache/http/client/utils/URLEncodedUtils;->format(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 597
    :cond_19
    const-string v5, "io-utils"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "download: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 600
    sget-object v5, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->OK_URL_FACTORY:Lcom/squareup/okhttp/OkUrlFactory;

    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Lcom/squareup/okhttp/OkUrlFactory;->open(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 601
    .local v0, "connection":Ljava/net/HttpURLConnection;
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    .line 603
    .local v1, "responseCode":I
    const/16 v5, 0x12c

    if-lt v1, v5, :cond_68

    .line 604
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v2

    .line 605
    .local v2, "responseMessage":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 606
    new-instance v5, Ljava/io/IOException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 608
    .end local v2    # "responseMessage":Ljava/lang/String;
    :cond_68
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    .line 609
    .local v4, "stream":Ljava/io/InputStream;
    invoke-static {v4}, Lorg/apache/commons/io/IOUtils;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v3

    .line 610
    .local v3, "result":[B
    invoke-static {v4}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 611
    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-direct {v5, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v5
.end method

.method public static forceDelete(Ljava/io/File;)V
    .registers 6
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 544
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 545
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->deleteDirectory(Ljava/io/File;)V

    .line 556
    :cond_9
    return-void

    .line 547
    :cond_a
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    .line 548
    .local v0, "filePresent":Z
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_9

    .line 549
    if-nez v0, :cond_2f

    .line 550
    new-instance v2, Ljava/io/FileNotFoundException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "File does not exist: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 552
    :cond_2f
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to delete file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 553
    .local v1, "message":Ljava/lang/String;
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static getRealFilePath(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;
    .registers 14
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    const/4 v11, 0x0

    .line 356
    if-nez p1, :cond_5

    move-object v7, v11

    .line 386
    :cond_4
    :goto_4
    return-object v7

    .line 360
    :cond_5
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v10

    .line 361
    .local v10, "scheme":Ljava/lang/String;
    const/4 v7, 0x0

    .line 363
    .local v7, "data":Ljava/lang/String;
    if-nez v10, :cond_11

    .line 364
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v7

    goto :goto_4

    .line 365
    :cond_11
    const-string v0, "file"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 366
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v7

    goto :goto_4

    .line 367
    :cond_1e
    const-string v0, "content"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 371
    :try_start_26
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v3, "_data"

    aput-object v3, v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_39
    .catch Ljava/lang/IllegalArgumentException; {:try_start_26 .. :try_end_39} :catch_53

    move-result-object v6

    .line 376
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_4

    .line 377
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 378
    const-string v0, "_data"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v9

    .line 379
    .local v9, "index":I
    const/4 v0, -0x1

    if-le v9, v0, :cond_4f

    .line 380
    invoke-interface {v6, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 383
    .end local v9    # "index":I
    :cond_4f
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_4

    .line 372
    .end local v6    # "cursor":Landroid/database/Cursor;
    :catch_53
    move-exception v8

    .local v8, "e":Ljava/lang/IllegalArgumentException;
    move-object v7, v11

    .line 373
    goto :goto_4
.end method

.method public static hunt(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 618
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 619
    new-instance v3, Ljava/io/IOException;

    const-string v4, "url cannot be null"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 622
    :cond_e
    const-string v3, "io-utils"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "hunt: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 624
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 625
    .local v2, "uri":Landroid/net/Uri;
    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    .line 627
    .local v1, "scheme":Ljava/lang/String;
    const-string v3, "content"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3f

    .line 628
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v3

    .line 637
    :goto_3e
    return-object v3

    .line 629
    :cond_3f
    const-string v3, "file"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_49

    if-nez v1, :cond_80

    .line 630
    :cond_49
    invoke-virtual {v2}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_77

    const-string v3, "android_asset"

    invoke-virtual {v2}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_77

    .line 631
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    sget v4, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->ASSET_PREFIX_LENGTH:I

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 632
    .local v0, "filePath":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    goto :goto_3e

    .line 634
    .end local v0    # "filePath":Ljava/lang/String;
    :cond_77
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v3

    goto :goto_3e

    .line 637
    :cond_80
    const/4 v3, 0x0

    invoke-static {p1, v3}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->download(Ljava/lang/String;Ljava/util/List;)Ljava/io/ByteArrayInputStream;

    move-result-object v3

    goto :goto_3e
.end method

.method private static mkdir(Ljava/io/File;)Z
    .registers 2
    .param p0, "dir"    # Ljava/io/File;

    .prologue
    .line 460
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_8

    .line 461
    const/4 v0, 0x1

    .line 463
    :goto_7
    return v0

    :cond_8
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    goto :goto_7
.end method

.method public static mkdirs(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;
    .registers 10
    .param p0, "parent"    # Ljava/io/File;
    .param p1, "dirname"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x1

    .line 66
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_73

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_73

    .line 67
    invoke-virtual {p0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v0

    .line 70
    .local v0, "destFolder":Ljava/io/File;
    sget-char v4, Ljava/io/File;->separatorChar:C

    const/16 v6, 0x5c

    if-ne v4, v6, :cond_4c

    const-string v4, "\\\\"

    :goto_1a
    invoke-virtual {p1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 71
    .local v3, "paths":[Ljava/lang/String;
    array-length v4, v3

    if-le v4, v7, :cond_4f

    .line 72
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_22
    array-length v4, v3

    if-ge v2, v4, :cond_58

    .line 73
    new-instance v1, Ljava/io/File;

    aget-object v4, v3, v2

    invoke-direct {v1, v0, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 74
    .end local v0    # "destFolder":Ljava/io/File;
    .local v1, "destFolder":Ljava/io/File;
    const-string v4, "io-utils"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    add-int/lit8 v2, v2, 0x1

    move-object v0, v1

    .end local v1    # "destFolder":Ljava/io/File;
    .restart local v0    # "destFolder":Ljava/io/File;
    goto :goto_22

    .line 70
    .end local v2    # "i":I
    .end local v3    # "paths":[Ljava/lang/String;
    :cond_4c
    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    goto :goto_1a

    .line 76
    .restart local v3    # "paths":[Ljava/lang/String;
    :cond_4f
    array-length v4, v3

    if-ne v4, v7, :cond_58

    .line 77
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .end local v0    # "destFolder":Ljava/io/File;
    .restart local v1    # "destFolder":Ljava/io/File;
    move-object v0, v1

    .line 80
    .end local v1    # "destFolder":Ljava/io/File;
    .restart local v0    # "destFolder":Ljava/io/File;
    :cond_58
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_6d

    .line 81
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v4

    if-eqz v4, :cond_65

    .line 90
    .end local v0    # "destFolder":Ljava/io/File;
    .end local v3    # "paths":[Ljava/lang/String;
    :cond_64
    :goto_64
    return-object v0

    .line 84
    .restart local v0    # "destFolder":Ljava/io/File;
    .restart local v3    # "paths":[Ljava/lang/String;
    :cond_65
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_64

    move-object v0, v5

    goto :goto_64

    .line 86
    :cond_6d
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-nez v4, :cond_64

    .end local v0    # "destFolder":Ljava/io/File;
    .end local v3    # "paths":[Ljava/lang/String;
    :cond_73
    move-object v0, v5

    .line 90
    goto :goto_64
.end method

.method public static readFully(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 4
    .param p0, "pInputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 318
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 320
    .local v0, "sb":Ljava/lang/StringBuilder;
    new-instance v1, Ljava/util/Scanner;

    invoke-direct {v1, p0}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    .line 321
    .local v1, "sc":Ljava/util/Scanner;
    :goto_a
    invoke-virtual {v1}, Ljava/util/Scanner;->hasNextLine()Z

    move-result v2

    if-eqz v2, :cond_18

    .line 322
    invoke-virtual {v1}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a

    .line 324
    :cond_18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static unzip(Ljava/io/InputStream;Ljava/io/File;)V
    .registers 7
    .param p0, "stream"    # Ljava/io/InputStream;
    .param p1, "destFolder"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 416
    if-nez p1, :cond_a

    .line 417
    new-instance v3, Ljava/io/IOException;

    const-string v4, "destination folder is null"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 419
    :cond_a
    if-nez p0, :cond_14

    .line 420
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Input is null"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 427
    :cond_14
    const/4 v0, 0x0

    .line 428
    .local v0, "success":Z
    new-instance v2, Ljava/util/zip/ZipInputStream;

    invoke-direct {v2, p0}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 430
    .local v2, "zipFile":Ljava/util/zip/ZipInputStream;
    :goto_1a
    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v1

    .local v1, "zipEntry":Ljava/util/zip/ZipEntry;
    if-eqz v1, :cond_28

    .line 431
    invoke-static {v1, v2, p1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->unzipEntry(Ljava/util/zip/ZipEntry;Ljava/util/zip/ZipInputStream;Ljava/io/File;)V

    .line 432
    const/4 v0, 0x1

    .line 433
    invoke-virtual {v2}, Ljava/util/zip/ZipInputStream;->closeEntry()V

    goto :goto_1a

    .line 435
    :cond_28
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 437
    if-nez v0, :cond_35

    .line 438
    new-instance v3, Ljava/io/IOException;

    const-string v4, "invalid zip file"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 440
    :cond_35
    return-void
.end method

.method private static unzipEntry(Ljava/util/zip/ZipEntry;Ljava/util/zip/ZipInputStream;Ljava/io/File;)V
    .registers 6
    .param p0, "entry"    # Ljava/util/zip/ZipEntry;
    .param p1, "zip"    # Ljava/util/zip/ZipInputStream;
    .param p2, "baseDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 443
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_e

    .line 444
    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {p2, v2}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->mkdirs(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    .line 457
    :goto_d
    return-void

    .line 448
    :cond_e
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p2, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 449
    .local v0, "outputFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_28

    .line 450
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->mkdir(Ljava/io/File;)Z

    .line 453
    :cond_28
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 454
    .local v1, "outputStream":Ljava/io/BufferedOutputStream;
    invoke-static {p1, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 455
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->flush()V

    .line 456
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_d
.end method
