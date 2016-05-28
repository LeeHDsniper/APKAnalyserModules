.class public Lit/sephiroth/android/library/picasso/OkHttpDownloader;
.super Ljava/lang/Object;
.source "OkHttpDownloader.java"

# interfaces
.implements Lit/sephiroth/android/library/picasso/Downloader;


# instance fields
.field private final client:Lcom/squareup/okhttp/OkHttpClient;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 45
    invoke-static {p1}, Lit/sephiroth/android/library/picasso/Utils;->createDefaultCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    invoke-direct {p0, v0}, Lit/sephiroth/android/library/picasso/OkHttpDownloader;-><init>(Ljava/io/File;)V

    .line 46
    return-void
.end method

.method public constructor <init>(Lcom/squareup/okhttp/OkHttpClient;)V
    .registers 2
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/OkHttpDownloader;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 89
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 4
    .param p1, "cacheDir"    # Ljava/io/File;

    .prologue
    .line 55
    invoke-static {p1}, Lit/sephiroth/android/library/picasso/Utils;->calculateDiskCacheSize(Ljava/io/File;)J

    move-result-wide v0

    invoke-direct {p0, p1, v0, v1}, Lit/sephiroth/android/library/picasso/OkHttpDownloader;-><init>(Ljava/io/File;J)V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/io/File;J)V
    .registers 6
    .param p1, "cacheDir"    # Ljava/io/File;
    .param p2, "maxSize"    # J

    .prologue
    .line 76
    invoke-static {}, Lit/sephiroth/android/library/picasso/OkHttpDownloader;->defaultOkHttpClient()Lcom/squareup/okhttp/OkHttpClient;

    move-result-object v0

    invoke-direct {p0, v0}, Lit/sephiroth/android/library/picasso/OkHttpDownloader;-><init>(Lcom/squareup/okhttp/OkHttpClient;)V

    .line 78
    :try_start_7
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/OkHttpDownloader;->client:Lcom/squareup/okhttp/OkHttpClient;

    new-instance v1, Lcom/squareup/okhttp/Cache;

    invoke-direct {v1, p1, p2, p3}, Lcom/squareup/okhttp/Cache;-><init>(Ljava/io/File;J)V

    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/OkHttpClient;->setCache(Lcom/squareup/okhttp/Cache;)Lcom/squareup/okhttp/OkHttpClient;
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_11} :catch_12

    .line 81
    :goto_11
    return-void

    .line 79
    :catch_12
    move-exception v0

    goto :goto_11
.end method

.method private static defaultOkHttpClient()Lcom/squareup/okhttp/OkHttpClient;
    .registers 6

    .prologue
    const-wide/16 v4, 0x4e20

    .line 31
    new-instance v0, Lcom/squareup/okhttp/OkHttpClient;

    invoke-direct {v0}, Lcom/squareup/okhttp/OkHttpClient;-><init>()V

    .line 32
    .local v0, "client":Lcom/squareup/okhttp/OkHttpClient;
    const-wide/16 v2, 0x3a98

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v2, v3, v1}, Lcom/squareup/okhttp/OkHttpClient;->setConnectTimeout(JLjava/util/concurrent/TimeUnit;)V

    .line 33
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v4, v5, v1}, Lcom/squareup/okhttp/OkHttpClient;->setReadTimeout(JLjava/util/concurrent/TimeUnit;)V

    .line 34
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v4, v5, v1}, Lcom/squareup/okhttp/OkHttpClient;->setWriteTimeout(JLjava/util/concurrent/TimeUnit;)V

    .line 35
    return-object v0
.end method


# virtual methods
.method public load(Landroid/net/Uri;I)Lit/sephiroth/android/library/picasso/Downloader$Response;
    .registers 13
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "networkPolicy"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    const/4 v1, 0x0

    .line 97
    .local v1, "cacheControl":Lcom/squareup/okhttp/CacheControl;
    if-eqz p2, :cond_b

    .line 98
    invoke-static {p2}, Lit/sephiroth/android/library/picasso/NetworkPolicy;->isOfflineOnly(I)Z

    move-result v6

    if-eqz v6, :cond_5b

    .line 99
    sget-object v1, Lcom/squareup/okhttp/CacheControl;->FORCE_CACHE:Lcom/squareup/okhttp/CacheControl;

    .line 112
    :cond_b
    :goto_b
    new-instance v6, Lcom/squareup/okhttp/Request$Builder;

    invoke-direct {v6}, Lcom/squareup/okhttp/Request$Builder;-><init>()V

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/squareup/okhttp/Request$Builder;->url(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v0

    .line 113
    .local v0, "builder":Lcom/squareup/okhttp/Request$Builder;
    if-eqz v1, :cond_1d

    .line 114
    invoke-virtual {v0, v1}, Lcom/squareup/okhttp/Request$Builder;->cacheControl(Lcom/squareup/okhttp/CacheControl;)Lcom/squareup/okhttp/Request$Builder;

    .line 117
    :cond_1d
    iget-object v6, p0, Lit/sephiroth/android/library/picasso/OkHttpDownloader;->client:Lcom/squareup/okhttp/OkHttpClient;

    invoke-virtual {v0}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/squareup/okhttp/OkHttpClient;->newCall(Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Call;

    move-result-object v6

    invoke-virtual {v6}, Lcom/squareup/okhttp/Call;->execute()Lcom/squareup/okhttp/Response;

    move-result-object v3

    .line 118
    .local v3, "response":Lcom/squareup/okhttp/Response;
    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->code()I

    move-result v5

    .line 119
    .local v5, "responseCode":I
    const/16 v6, 0x12c

    if-lt v5, v6, :cond_77

    .line 120
    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v6

    invoke-virtual {v6}, Lcom/squareup/okhttp/ResponseBody;->close()V

    .line 121
    new-instance v6, Lit/sephiroth/android/library/picasso/Downloader$ResponseException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->message()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, p2, v5}, Lit/sephiroth/android/library/picasso/Downloader$ResponseException;-><init>(Ljava/lang/String;II)V

    throw v6

    .line 101
    .end local v0    # "builder":Lcom/squareup/okhttp/Request$Builder;
    .end local v3    # "response":Lcom/squareup/okhttp/Response;
    .end local v5    # "responseCode":I
    :cond_5b
    new-instance v0, Lcom/squareup/okhttp/CacheControl$Builder;

    invoke-direct {v0}, Lcom/squareup/okhttp/CacheControl$Builder;-><init>()V

    .line 102
    .local v0, "builder":Lcom/squareup/okhttp/CacheControl$Builder;
    invoke-static {p2}, Lit/sephiroth/android/library/picasso/NetworkPolicy;->shouldReadFromDiskCache(I)Z

    move-result v6

    if-nez v6, :cond_69

    .line 103
    invoke-virtual {v0}, Lcom/squareup/okhttp/CacheControl$Builder;->noCache()Lcom/squareup/okhttp/CacheControl$Builder;

    .line 105
    :cond_69
    invoke-static {p2}, Lit/sephiroth/android/library/picasso/NetworkPolicy;->shouldWriteToDiskCache(I)Z

    move-result v6

    if-nez v6, :cond_72

    .line 106
    invoke-virtual {v0}, Lcom/squareup/okhttp/CacheControl$Builder;->noStore()Lcom/squareup/okhttp/CacheControl$Builder;

    .line 108
    :cond_72
    invoke-virtual {v0}, Lcom/squareup/okhttp/CacheControl$Builder;->build()Lcom/squareup/okhttp/CacheControl;

    move-result-object v1

    goto :goto_b

    .line 125
    .local v0, "builder":Lcom/squareup/okhttp/Request$Builder;
    .restart local v3    # "response":Lcom/squareup/okhttp/Response;
    .restart local v5    # "responseCode":I
    :cond_77
    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->cacheResponse()Lcom/squareup/okhttp/Response;

    move-result-object v6

    if-eqz v6, :cond_90

    const/4 v2, 0x1

    .line 127
    .local v2, "fromCache":Z
    :goto_7e
    invoke-virtual {v3}, Lcom/squareup/okhttp/Response;->body()Lcom/squareup/okhttp/ResponseBody;

    move-result-object v4

    .line 128
    .local v4, "responseBody":Lcom/squareup/okhttp/ResponseBody;
    new-instance v6, Lit/sephiroth/android/library/picasso/Downloader$Response;

    invoke-virtual {v4}, Lcom/squareup/okhttp/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-virtual {v4}, Lcom/squareup/okhttp/ResponseBody;->contentLength()J

    move-result-wide v8

    invoke-direct {v6, v7, v2, v8, v9}, Lit/sephiroth/android/library/picasso/Downloader$Response;-><init>(Ljava/io/InputStream;ZJ)V

    return-object v6

    .line 125
    .end local v2    # "fromCache":Z
    .end local v4    # "responseBody":Lcom/squareup/okhttp/ResponseBody;
    :cond_90
    const/4 v2, 0x0

    goto :goto_7e
.end method
