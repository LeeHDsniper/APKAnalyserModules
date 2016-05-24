.class public Lit/sephiroth/android/library/picasso/Downloader$ResponseException;
.super Ljava/io/IOException;
.source "Downloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Downloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ResponseException"
.end annotation


# instance fields
.field final localCacheOnly:Z

.field final responseCode:I


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .registers 5
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "networkPolicy"    # I
    .param p3, "responseCode"    # I

    .prologue
    .line 49
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 50
    invoke-static {p2}, Lit/sephiroth/android/library/picasso/NetworkPolicy;->isOfflineOnly(I)Z

    move-result v0

    iput-boolean v0, p0, Lit/sephiroth/android/library/picasso/Downloader$ResponseException;->localCacheOnly:Z

    .line 51
    iput p3, p0, Lit/sephiroth/android/library/picasso/Downloader$ResponseException;->responseCode:I

    .line 52
    return-void
.end method
