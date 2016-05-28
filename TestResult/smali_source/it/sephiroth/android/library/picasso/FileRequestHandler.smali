.class Lit/sephiroth/android/library/picasso/FileRequestHandler;
.super Lit/sephiroth/android/library/picasso/ContentStreamRequestHandler;
.source "FileRequestHandler.java"


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    invoke-direct {p0, p1}, Lit/sephiroth/android/library/picasso/ContentStreamRequestHandler;-><init>(Landroid/content/Context;)V

    .line 34
    return-void
.end method

.method static getFileExifRotation(Landroid/net/Uri;)I
    .registers 5
    .param p0, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    new-instance v0, Landroid/media/ExifInterface;

    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 46
    .local v0, "exifInterface":Landroid/media/ExifInterface;
    const-string v2, "Orientation"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v1

    .line 47
    .local v1, "orientation":I
    packed-switch v1, :pswitch_data_1e

    .line 55
    :pswitch_13
    const/4 v2, 0x0

    :goto_14
    return v2

    .line 49
    :pswitch_15
    const/16 v2, 0x5a

    goto :goto_14

    .line 51
    :pswitch_18
    const/16 v2, 0xb4

    goto :goto_14

    .line 53
    :pswitch_1b
    const/16 v2, 0x10e

    goto :goto_14

    .line 47
    :pswitch_data_1e
    .packed-switch 0x3
        :pswitch_18
        :pswitch_13
        :pswitch_13
        :pswitch_15
        :pswitch_13
        :pswitch_1b
    .end packed-switch
.end method


# virtual methods
.method public canHandleRequest(Lit/sephiroth/android/library/picasso/Request;)Z
    .registers 4
    .param p1, "data"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 37
    const-string v0, "file"

    iget-object v1, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public load(Lit/sephiroth/android/library/picasso/Request;I)Lit/sephiroth/android/library/picasso/RequestHandler$Result;
    .registers 8
    .param p1, "request"    # Lit/sephiroth/android/library/picasso/Request;
    .param p2, "networkPolicy"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 41
    new-instance v0, Lit/sephiroth/android/library/picasso/RequestHandler$Result;

    const/4 v1, 0x0

    invoke-virtual {p0, p1}, Lit/sephiroth/android/library/picasso/FileRequestHandler;->getInputStream(Lit/sephiroth/android/library/picasso/Request;)Ljava/io/InputStream;

    move-result-object v2

    sget-object v3, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->DISK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    iget-object v4, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-static {v4}, Lit/sephiroth/android/library/picasso/FileRequestHandler;->getFileExifRotation(Landroid/net/Uri;)I

    move-result v4

    invoke-direct {v0, v1, v2, v3, v4}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;-><init>(Landroid/graphics/Bitmap;Ljava/io/InputStream;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;I)V

    return-object v0
.end method
