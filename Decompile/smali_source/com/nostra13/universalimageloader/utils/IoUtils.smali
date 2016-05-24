.class public final Lcom/nostra13/universalimageloader/utils/IoUtils;
.super Ljava/lang/Object;
.source "IoUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;
    }
.end annotation


# direct methods
.method public static closeSilently(Ljava/io/Closeable;)V
    .registers 2
    .param p0, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 112
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_4

    .line 116
    :goto_3
    return-void

    .line 113
    :catch_4
    move-exception v0

    goto :goto_3
.end method

.method public static copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;I)Z
    .registers 10
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "listener"    # Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;
    .param p3, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 66
    const/4 v2, 0x0

    .line 67
    .local v2, "current":I
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result v3

    .line 69
    .local v3, "total":I
    new-array v0, p3, [B

    .line 71
    .local v0, "bytes":[B
    invoke-static {p2, v2, v3}, Lcom/nostra13/universalimageloader/utils/IoUtils;->shouldStopLoading(Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;II)Z

    move-result v5

    if-eqz v5, :cond_f

    .line 78
    :goto_e
    return v4

    .line 72
    :cond_f
    invoke-virtual {p0, v0, v4, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .local v1, "count":I
    const/4 v5, -0x1

    if-eq v1, v5, :cond_21

    .line 73
    invoke-virtual {p1, v0, v4, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 74
    add-int/2addr v2, v1

    .line 75
    invoke-static {p2, v2, v3}, Lcom/nostra13/universalimageloader/utils/IoUtils;->shouldStopLoading(Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;II)Z

    move-result v5

    if-eqz v5, :cond_f

    goto :goto_e

    .line 77
    :cond_21
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 78
    const/4 v4, 0x1

    goto :goto_e
.end method

.method public static readAndCloseStream(Ljava/io/InputStream;)V
    .registers 4
    .param p0, "is"    # Ljava/io/InputStream;

    .prologue
    const v1, 0x8000

    .line 99
    new-array v0, v1, [B

    .line 101
    .local v0, "bytes":[B
    :cond_5
    const/4 v1, 0x0

    const v2, 0x8000

    :try_start_9
    invoke-virtual {p0, v0, v1, v2}, Ljava/io/InputStream;->read([BII)I
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_c} :catch_14
    .catchall {:try_start_9 .. :try_end_c} :catchall_19

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_5

    .line 106
    invoke-static {p0}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 108
    :goto_13
    return-void

    .line 103
    :catch_14
    move-exception v1

    .line 106
    invoke-static {p0}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_13

    :catchall_19
    move-exception v1

    invoke-static {p0}, Lcom/nostra13/universalimageloader/utils/IoUtils;->closeSilently(Ljava/io/Closeable;)V

    throw v1
.end method

.method private static shouldStopLoading(Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;II)Z
    .registers 6
    .param p0, "listener"    # Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;
    .param p1, "current"    # I
    .param p2, "total"    # I

    .prologue
    .line 82
    if-eqz p0, :cond_11

    .line 83
    invoke-interface {p0, p1, p2}, Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;->onBytesCopied(II)Z

    move-result v0

    .line 84
    .local v0, "shouldContinue":Z
    if-nez v0, :cond_11

    .line 85
    mul-int/lit8 v1, p1, 0x64

    div-int/2addr v1, p2

    const/16 v2, 0x4b

    if-ge v1, v2, :cond_11

    .line 86
    const/4 v1, 0x1

    .line 90
    .end local v0    # "shouldContinue":Z
    :goto_10
    return v1

    :cond_11
    const/4 v1, 0x0

    goto :goto_10
.end method
