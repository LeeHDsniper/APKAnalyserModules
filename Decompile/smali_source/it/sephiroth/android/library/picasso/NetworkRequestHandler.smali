.class Lit/sephiroth/android/library/picasso/NetworkRequestHandler;
.super Lit/sephiroth/android/library/picasso/RequestHandler;
.source "NetworkRequestHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/picasso/NetworkRequestHandler$ContentLengthException;
    }
.end annotation


# instance fields
.field private final downloader:Lit/sephiroth/android/library/picasso/Downloader;

.field private final stats:Lit/sephiroth/android/library/picasso/Stats;


# direct methods
.method public constructor <init>(Lit/sephiroth/android/library/picasso/Downloader;Lit/sephiroth/android/library/picasso/Stats;)V
    .registers 3
    .param p1, "downloader"    # Lit/sephiroth/android/library/picasso/Downloader;
    .param p2, "stats"    # Lit/sephiroth/android/library/picasso/Stats;

    .prologue
    .line 34
    invoke-direct {p0}, Lit/sephiroth/android/library/picasso/RequestHandler;-><init>()V

    .line 35
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/NetworkRequestHandler;->downloader:Lit/sephiroth/android/library/picasso/Downloader;

    .line 36
    iput-object p2, p0, Lit/sephiroth/android/library/picasso/NetworkRequestHandler;->stats:Lit/sephiroth/android/library/picasso/Stats;

    .line 37
    return-void
.end method


# virtual methods
.method public canHandleRequest(Lit/sephiroth/android/library/picasso/Request;)Z
    .registers 4
    .param p1, "data"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 40
    iget-object v1, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    .line 41
    .local v0, "scheme":Ljava/lang/String;
    const-string v1, "http"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    const-string v1, "https"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    :cond_16
    const/4 v1, 0x1

    :goto_17
    return v1

    :cond_18
    const/4 v1, 0x0

    goto :goto_17
.end method

.method getRetryCount()I
    .registers 2

    .prologue
    .line 74
    const/4 v0, 0x2

    return v0
.end method

.method public load(Lit/sephiroth/android/library/picasso/Request;I)Lit/sephiroth/android/library/picasso/RequestHandler$Result;
    .registers 13
    .param p1, "request"    # Lit/sephiroth/android/library/picasso/Request;
    .param p2, "networkPolicy"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v8, 0x0

    const/4 v4, 0x0

    .line 45
    iget-object v5, p0, Lit/sephiroth/android/library/picasso/NetworkRequestHandler;->downloader:Lit/sephiroth/android/library/picasso/Downloader;

    iget-object v6, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    iget v7, p1, Lit/sephiroth/android/library/picasso/Request;->networkPolicy:I

    invoke-interface {v5, v6, v7}, Lit/sephiroth/android/library/picasso/Downloader;->load(Landroid/net/Uri;I)Lit/sephiroth/android/library/picasso/Downloader$Response;

    move-result-object v3

    .line 46
    .local v3, "response":Lit/sephiroth/android/library/picasso/Downloader$Response;
    if-nez v3, :cond_10

    .line 70
    :cond_f
    :goto_f
    return-object v4

    .line 50
    :cond_10
    iget-boolean v5, v3, Lit/sephiroth/android/library/picasso/Downloader$Response;->cached:Z

    if-eqz v5, :cond_22

    sget-object v2, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->DISK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    .line 52
    .local v2, "loadedFrom":Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;
    :goto_16
    invoke-virtual {v3}, Lit/sephiroth/android/library/picasso/Downloader$Response;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 53
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_25

    .line 54
    new-instance v4, Lit/sephiroth/android/library/picasso/RequestHandler$Result;

    invoke-direct {v4, v0, v2}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;-><init>(Landroid/graphics/Bitmap;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;)V

    goto :goto_f

    .line 50
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "loadedFrom":Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;
    :cond_22
    sget-object v2, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->NETWORK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    goto :goto_16

    .line 57
    .restart local v0    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v2    # "loadedFrom":Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;
    :cond_25
    invoke-virtual {v3}, Lit/sephiroth/android/library/picasso/Downloader$Response;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 58
    .local v1, "is":Ljava/io/InputStream;
    if-eqz v1, :cond_f

    .line 63
    sget-object v4, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->DISK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    if-ne v2, v4, :cond_42

    invoke-virtual {v3}, Lit/sephiroth/android/library/picasso/Downloader$Response;->getContentLength()J

    move-result-wide v4

    cmp-long v4, v4, v8

    if-nez v4, :cond_42

    .line 64
    invoke-static {v1}, Lit/sephiroth/android/library/picasso/Utils;->closeQuietly(Ljava/io/InputStream;)V

    .line 65
    new-instance v4, Lit/sephiroth/android/library/picasso/NetworkRequestHandler$ContentLengthException;

    const-string v5, "Received response with 0 content-length header."

    invoke-direct {v4, v5}, Lit/sephiroth/android/library/picasso/NetworkRequestHandler$ContentLengthException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 67
    :cond_42
    sget-object v4, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->NETWORK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    if-ne v2, v4, :cond_57

    invoke-virtual {v3}, Lit/sephiroth/android/library/picasso/Downloader$Response;->getContentLength()J

    move-result-wide v4

    cmp-long v4, v4, v8

    if-lez v4, :cond_57

    .line 68
    iget-object v4, p0, Lit/sephiroth/android/library/picasso/NetworkRequestHandler;->stats:Lit/sephiroth/android/library/picasso/Stats;

    invoke-virtual {v3}, Lit/sephiroth/android/library/picasso/Downloader$Response;->getContentLength()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Lit/sephiroth/android/library/picasso/Stats;->dispatchDownloadFinished(J)V

    .line 70
    :cond_57
    new-instance v4, Lit/sephiroth/android/library/picasso/RequestHandler$Result;

    invoke-direct {v4, v1, v2}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;-><init>(Ljava/io/InputStream;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;)V

    goto :goto_f
.end method

.method shouldRetry(ZLandroid/net/NetworkInfo;)Z
    .registers 4
    .param p1, "airplaneMode"    # Z
    .param p2, "info"    # Landroid/net/NetworkInfo;

    .prologue
    .line 78
    if-eqz p2, :cond_8

    invoke-virtual {p2}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method supportsReplay()Z
    .registers 2

    .prologue
    .line 82
    const/4 v0, 0x1

    return v0
.end method
