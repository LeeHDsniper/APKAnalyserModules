.class public Lit/sephiroth/android/library/picasso/Downloader$Response;
.super Ljava/lang/Object;
.source "Downloader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Downloader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Response"
.end annotation


# instance fields
.field final bitmap:Landroid/graphics/Bitmap;

.field final cached:Z

.field final contentLength:J

.field final stream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;ZJ)V
    .registers 8
    .param p1, "stream"    # Ljava/io/InputStream;
    .param p2, "loadedFromCache"    # Z
    .param p3, "contentLength"    # J

    .prologue
    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    if-nez p1, :cond_d

    .line 117
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Stream may not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 119
    :cond_d
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/Downloader$Response;->stream:Ljava/io/InputStream;

    .line 120
    const/4 v0, 0x0

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/Downloader$Response;->bitmap:Landroid/graphics/Bitmap;

    .line 121
    iput-boolean p2, p0, Lit/sephiroth/android/library/picasso/Downloader$Response;->cached:Z

    .line 122
    iput-wide p3, p0, Lit/sephiroth/android/library/picasso/Downloader$Response;->contentLength:J

    .line 123
    return-void
.end method


# virtual methods
.method public getBitmap()Landroid/graphics/Bitmap;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 143
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Downloader$Response;->bitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getContentLength()J
    .registers 3

    .prologue
    .line 148
    iget-wide v0, p0, Lit/sephiroth/android/library/picasso/Downloader$Response;->contentLength:J

    return-wide v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/Downloader$Response;->stream:Ljava/io/InputStream;

    return-object v0
.end method
