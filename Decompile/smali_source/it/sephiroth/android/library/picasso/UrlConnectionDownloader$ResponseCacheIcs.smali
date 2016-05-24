.class Lit/sephiroth/android/library/picasso/UrlConnectionDownloader$ResponseCacheIcs;
.super Ljava/lang/Object;
.source "UrlConnectionDownloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/UrlConnectionDownloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ResponseCacheIcs"
.end annotation


# direct methods
.method static install(Landroid/content/Context;)Ljava/lang/Object;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    invoke-static {p0}, Lit/sephiroth/android/library/picasso/Utils;->createDefaultCacheDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    .line 127
    .local v1, "cacheDir":Ljava/io/File;
    invoke-static {}, Landroid/net/http/HttpResponseCache;->getInstalled()Landroid/net/http/HttpResponseCache;

    move-result-object v0

    .line 128
    .local v0, "cache":Landroid/net/http/HttpResponseCache;
    if-nez v0, :cond_12

    .line 129
    invoke-static {v1}, Lit/sephiroth/android/library/picasso/Utils;->calculateDiskCacheSize(Ljava/io/File;)J

    move-result-wide v2

    .line 130
    .local v2, "maxSize":J
    invoke-static {v1, v2, v3}, Landroid/net/http/HttpResponseCache;->install(Ljava/io/File;J)Landroid/net/http/HttpResponseCache;

    move-result-object v0

    .line 132
    .end local v2    # "maxSize":J
    :cond_12
    return-object v0
.end method
