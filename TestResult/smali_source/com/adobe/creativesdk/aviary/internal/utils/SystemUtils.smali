.class public final Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;
.super Ljava/lang/Object;
.source "SystemUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$MemoryInfo;,
        Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils$CpuInfo;
    }
.end annotation


# direct methods
.method static synthetic access$000(Ljava/util/HashMap;Ljava/lang/String;)V
    .registers 2
    .param p0, "x0"    # Ljava/util/HashMap;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-static {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->readValues(Ljava/util/HashMap;Ljava/lang/String;)V

    return-void
.end method

.method private static parseLine(Ljava/lang/String;Ljava/util/HashMap;)V
    .registers 6
    .param p0, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 234
    .local p1, "outValues":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Ljava/util/StringTokenizer;

    const-string v3, ":"

    invoke-direct {v1, p0, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 235
    .local v1, "tokenizer":Ljava/util/StringTokenizer;
    :cond_7
    :goto_7
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_27

    .line 236
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 237
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 238
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 239
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7

    .line 242
    .end local v0    # "key":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    :cond_27
    return-void
.end method

.method private static readValues(Ljava/util/HashMap;Ljava/lang/String;)V
    .registers 9
    .param p1, "proc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 212
    .local p0, "outValues":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v2, 0x0

    .line 214
    .local v2, "reader":Ljava/io/BufferedReader;
    :try_start_1
    const-string v4, "SystemUtils"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "readValues: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 215
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/FileReader;

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_28} :catch_48
    .catchall {:try_start_1 .. :try_end_28} :catchall_40

    .line 218
    .end local v2    # "reader":Ljava/io/BufferedReader;
    .local v3, "reader":Ljava/io/BufferedReader;
    :goto_28
    :try_start_28
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .local v1, "line":Ljava/lang/String;
    if-eqz v1, :cond_3b

    .line 219
    invoke-static {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->parseLine(Ljava/lang/String;Ljava/util/HashMap;)V
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_31} :catch_32
    .catchall {:try_start_28 .. :try_end_31} :catchall_45

    goto :goto_28

    .line 221
    .end local v1    # "line":Ljava/lang/String;
    :catch_32
    move-exception v0

    move-object v2, v3

    .line 222
    .end local v3    # "reader":Ljava/io/BufferedReader;
    .local v0, "ex":Ljava/io/IOException;
    .restart local v2    # "reader":Ljava/io/BufferedReader;
    :goto_34
    :try_start_34
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_37
    .catchall {:try_start_34 .. :try_end_37} :catchall_40

    .line 224
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    .line 226
    .end local v0    # "ex":Ljava/io/IOException;
    :goto_3a
    return-void

    .line 224
    .end local v2    # "reader":Ljava/io/BufferedReader;
    .restart local v1    # "line":Ljava/lang/String;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    :cond_3b
    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    move-object v2, v3

    .line 225
    .end local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v2    # "reader":Ljava/io/BufferedReader;
    goto :goto_3a

    .line 224
    .end local v1    # "line":Ljava/lang/String;
    :catchall_40
    move-exception v4

    :goto_41
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/IOUtils;->closeSilently(Ljava/io/Closeable;)V

    throw v4

    .end local v2    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "reader":Ljava/io/BufferedReader;
    :catchall_45
    move-exception v4

    move-object v2, v3

    .end local v3    # "reader":Ljava/io/BufferedReader;
    .restart local v2    # "reader":Ljava/io/BufferedReader;
    goto :goto_41

    .line 221
    :catch_48
    move-exception v0

    goto :goto_34
.end method

.method public static throwIfNonUiThread()V
    .registers 2

    .prologue
    .line 255
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_12

    .line 256
    new-instance v0, Ljava/lang/IllegalThreadStateException;

    const-string v1, "Current thread is not the mainThread"

    invoke-direct {v0, v1}, Ljava/lang/IllegalThreadStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 258
    :cond_12
    return-void
.end method

.method public static throwIfUiThread()V
    .registers 2

    .prologue
    .line 249
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_12

    .line 250
    new-instance v0, Ljava/lang/IllegalThreadStateException;

    const-string v1, "Current thread is the mainThread"

    invoke-direct {v0, v1}, Ljava/lang/IllegalThreadStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 252
    :cond_12
    return-void
.end method

.method public static trySleep(J)V
    .registers 4
    .param p0, "millisec"    # J

    .prologue
    .line 262
    :try_start_0
    invoke-static {p0, p1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_3} :catch_4

    .line 266
    :goto_3
    return-void

    .line 263
    :catch_4
    move-exception v0

    goto :goto_3
.end method
