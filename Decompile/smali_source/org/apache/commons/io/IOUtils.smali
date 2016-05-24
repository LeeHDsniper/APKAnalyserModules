.class public Lorg/apache/commons/io/IOUtils;
.super Ljava/lang/Object;
.source "IOUtils.java"


# static fields
.field public static final DIR_SEPARATOR:C

.field public static final LINE_SEPARATOR:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 101
    sget-char v2, Ljava/io/File;->separatorChar:C

    sput-char v2, Lorg/apache/commons/io/IOUtils;->DIR_SEPARATOR:C

    .line 117
    new-instance v0, Lorg/apache/commons/io/output/StringBuilderWriter;

    const/4 v2, 0x4

    invoke-direct {v0, v2}, Lorg/apache/commons/io/output/StringBuilderWriter;-><init>(I)V

    .line 118
    .local v0, "buf":Lorg/apache/commons/io/output/StringBuilderWriter;
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 119
    .local v1, "out":Ljava/io/PrintWriter;
    invoke-virtual {v1}, Ljava/io/PrintWriter;->println()V

    .line 120
    invoke-virtual {v0}, Lorg/apache/commons/io/output/StringBuilderWriter;->toString()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/io/IOUtils;->LINE_SEPARATOR:Ljava/lang/String;

    .line 121
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 122
    return-void
.end method

.method public static closeQuietly(Ljava/io/Closeable;)V
    .registers 2
    .param p0, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 302
    if-eqz p0, :cond_5

    .line 303
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 308
    :cond_5
    :goto_5
    return-void

    .line 305
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method public static closeQuietly(Ljava/io/InputStream;)V
    .registers 1
    .param p0, "input"    # Ljava/io/InputStream;

    .prologue
    .line 246
    invoke-static {p0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 247
    return-void
.end method

.method public static closeQuietly(Ljava/io/OutputStream;)V
    .registers 1
    .param p0, "output"    # Ljava/io/OutputStream;

    .prologue
    .line 274
    invoke-static {p0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 275
    return-void
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I
    .registers 6
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1744
    invoke-static {p0, p1}, Lorg/apache/commons/io/IOUtils;->copyLarge(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    move-result-wide v0

    .line 1745
    .local v0, "count":J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_d

    .line 1746
    const/4 v2, -0x1

    .line 1748
    :goto_c
    return v2

    :cond_d
    long-to-int v2, v0

    goto :goto_c
.end method

.method public static copyLarge(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    .registers 4
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1769
    const/16 v0, 0x1000

    new-array v0, v0, [B

    invoke-static {p0, p1, v0}, Lorg/apache/commons/io/IOUtils;->copyLarge(Ljava/io/InputStream;Ljava/io/OutputStream;[B)J

    move-result-wide v0

    return-wide v0
.end method

.method public static copyLarge(Ljava/io/InputStream;Ljava/io/OutputStream;[B)J
    .registers 9
    .param p0, "input"    # Ljava/io/InputStream;
    .param p1, "output"    # Ljava/io/OutputStream;
    .param p2, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1790
    const-wide/16 v0, 0x0

    .line 1791
    .local v0, "count":J
    const/4 v2, 0x0

    .line 1792
    .local v2, "n":I
    :goto_3
    const/4 v3, -0x1

    invoke-virtual {p0, p2}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-eq v3, v2, :cond_11

    .line 1793
    const/4 v3, 0x0

    invoke-virtual {p1, p2, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 1794
    int-to-long v4, v2

    add-long/2addr v0, v4

    goto :goto_3

    .line 1796
    :cond_11
    return-wide v0
.end method

.method public static toByteArray(Ljava/io/InputStream;)[B
    .registers 3
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 461
    new-instance v0, Lorg/apache/commons/io/output/ByteArrayOutputStream;

    invoke-direct {v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;-><init>()V

    .line 462
    .local v0, "output":Lorg/apache/commons/io/output/ByteArrayOutputStream;
    invoke-static {p0, v0}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I

    .line 463
    invoke-virtual {v0}, Lorg/apache/commons/io/output/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method
