.class public Lit/sephiroth/android/library/picasso/UrlConnectionDownloader;
.super Ljava/lang/Object;
.source "UrlConnectionDownloader.java"

# interfaces
.implements Lit/sephiroth/android/library/picasso/Downloader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/picasso/UrlConnectionDownloader$ResponseCacheIcs;
    }
.end annotation


# static fields
.field private static final CACHE_HEADER_BUILDER:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/lang/StringBuilder;",
            ">;"
        }
    .end annotation
.end field

.field static volatile cache:Ljava/lang/Object;

.field private static final lock:Ljava/lang/Object;


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader;->lock:Ljava/lang/Object;

    .line 38
    new-instance v0, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader$1;

    invoke-direct {v0}, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader$1;-><init>()V

    sput-object v0, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader;->CACHE_HEADER_BUILDER:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader;->context:Landroid/content/Context;

    .line 49
    return-void
.end method

.method private static installCacheIfNeeded(Landroid/content/Context;)V
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 112
    sget-object v0, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader;->cache:Ljava/lang/Object;

    if-nez v0, :cond_12

    .line 114
    :try_start_4
    sget-object v1, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader;->lock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_7} :catch_16

    .line 115
    :try_start_7
    sget-object v0, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader;->cache:Ljava/lang/Object;

    if-nez v0, :cond_11

    .line 116
    invoke-static {p0}, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader$ResponseCacheIcs;->install(Landroid/content/Context;)Ljava/lang/Object;

    move-result-object v0

    sput-object v0, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader;->cache:Ljava/lang/Object;

    .line 118
    :cond_11
    monitor-exit v1

    .line 122
    :cond_12
    :goto_12
    return-void

    .line 118
    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_7 .. :try_end_15} :catchall_13

    :try_start_15
    throw v0
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_16} :catch_16

    .line 119
    :catch_16
    move-exception v0

    goto :goto_12
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
    .line 59
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0xe

    if-lt v7, v8, :cond_b

    .line 60
    iget-object v7, p0, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader;->context:Landroid/content/Context;

    invoke-static {v7}, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader;->installCacheIfNeeded(Landroid/content/Context;)V

    .line 63
    :cond_b
    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader;->openConnection(Landroid/net/Uri;)Ljava/net/HttpURLConnection;

    move-result-object v1

    .line 64
    .local v1, "connection":Ljava/net/HttpURLConnection;
    const/4 v7, 0x1

    invoke-virtual {v1, v7}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 66
    if-eqz p2, :cond_22

    .line 69
    invoke-static {p2}, Lit/sephiroth/android/library/picasso/NetworkPolicy;->isOfflineOnly(I)Z

    move-result v7

    if-eqz v7, :cond_4e

    .line 70
    const-string v5, "only-if-cached,max-age=2147483647"

    .line 88
    .local v5, "headerValue":Ljava/lang/String;
    :goto_1d
    const-string v7, "Cache-Control"

    invoke-virtual {v1, v7, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .end local v5    # "headerValue":Ljava/lang/String;
    :cond_22
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v6

    .line 92
    .local v6, "responseCode":I
    const/16 v7, 0x12c

    if-lt v6, v7, :cond_80

    .line 93
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 94
    new-instance v7, Lit/sephiroth/android/library/picasso/Downloader$ResponseException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, p2, v6}, Lit/sephiroth/android/library/picasso/Downloader$ResponseException;-><init>(Ljava/lang/String;II)V

    throw v7

    .line 72
    .end local v6    # "responseCode":I
    :cond_4e
    sget-object v7, Lit/sephiroth/android/library/picasso/UrlConnectionDownloader;->CACHE_HEADER_BUILDER:Ljava/lang/ThreadLocal;

    invoke-virtual {v7}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/StringBuilder;

    .line 73
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 75
    invoke-static {p2}, Lit/sephiroth/android/library/picasso/NetworkPolicy;->shouldReadFromDiskCache(I)Z

    move-result v7

    if-nez v7, :cond_65

    .line 76
    const-string v7, "no-cache"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    :cond_65
    invoke-static {p2}, Lit/sephiroth/android/library/picasso/NetworkPolicy;->shouldWriteToDiskCache(I)Z

    move-result v7

    if-nez v7, :cond_7b

    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-lez v7, :cond_76

    .line 80
    const/16 v7, 0x2c

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 82
    :cond_76
    const-string v7, "no-store"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    :cond_7b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "headerValue":Ljava/lang/String;
    goto :goto_1d

    .line 98
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    .end local v5    # "headerValue":Ljava/lang/String;
    .restart local v6    # "responseCode":I
    :cond_80
    const-string v7, "Content-Length"

    const/4 v8, -0x1

    invoke-virtual {v1, v7, v8}, Ljava/net/HttpURLConnection;->getHeaderFieldInt(Ljava/lang/String;I)I

    move-result v7

    int-to-long v2, v7

    .line 99
    .local v2, "contentLength":J
    const-string v7, "X-Android-Response-Source"

    invoke-virtual {v1, v7}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lit/sephiroth/android/library/picasso/Utils;->parseResponseSourceHeader(Ljava/lang/String;)Z

    move-result v4

    .line 101
    .local v4, "fromCache":Z
    new-instance v7, Lit/sephiroth/android/library/picasso/Downloader$Response;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v7, v8, v4, v2, v3}, Lit/sephiroth/android/library/picasso/Downloader$Response;-><init>(Ljava/io/InputStream;ZJ)V

    return-object v7
.end method

.method protected openConnection(Landroid/net/Uri;)Ljava/net/HttpURLConnection;
    .registers 5
    .param p1, "path"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    new-instance v1, Ljava/net/URL;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 53
    .local v0, "connection":Ljava/net/HttpURLConnection;
    const/16 v1, 0x3a98

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 54
    const/16 v1, 0x4e20

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 55
    return-object v0
.end method
