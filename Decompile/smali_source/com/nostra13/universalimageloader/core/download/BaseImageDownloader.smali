.class public Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;
.super Ljava/lang/Object;
.source "BaseImageDownloader.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/download/ImageDownloader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader$1;
    }
.end annotation


# instance fields
.field protected final connectTimeout:I

.field protected final context:Landroid/content/Context;

.field protected final readTimeout:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->context:Landroid/content/Context;

    .line 69
    const/16 v0, 0x1388

    iput v0, p0, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->connectTimeout:I

    .line 70
    const/16 v0, 0x4e20

    iput v0, p0, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->readTimeout:I

    .line 71
    return-void
.end method


# virtual methods
.method protected createConnection(Ljava/lang/String;Ljava/lang/Object;)Ljava/net/HttpURLConnection;
    .registers 6
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "extra"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 140
    const-string v2, "@#&=*+-_.,:!?()/~\'%"

    invoke-static {p1, v2}, Landroid/net/Uri;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 141
    .local v1, "encodedUrl":Ljava/lang/String;
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 142
    .local v0, "conn":Ljava/net/HttpURLConnection;
    iget v2, p0, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->connectTimeout:I

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 143
    iget v2, p0, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->readTimeout:I

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 144
    return-object v0
.end method

.method public getStream(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;
    .registers 5
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "extra"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 81
    sget-object v0, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader$1;->$SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme:[I

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ofUri(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_2e

    .line 95
    invoke-virtual {p0, p1, p2}, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->getStreamFromOtherSource(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;

    move-result-object v0

    :goto_13
    return-object v0

    .line 84
    :pswitch_14
    invoke-virtual {p0, p1, p2}, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->getStreamFromNetwork(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;

    move-result-object v0

    goto :goto_13

    .line 86
    :pswitch_19
    invoke-virtual {p0, p1, p2}, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->getStreamFromFile(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;

    move-result-object v0

    goto :goto_13

    .line 88
    :pswitch_1e
    invoke-virtual {p0, p1, p2}, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->getStreamFromContent(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;

    move-result-object v0

    goto :goto_13

    .line 90
    :pswitch_23
    invoke-virtual {p0, p1, p2}, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->getStreamFromAssets(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;

    move-result-object v0

    goto :goto_13

    .line 92
    :pswitch_28
    invoke-virtual {p0, p1, p2}, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->getStreamFromDrawable(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;

    move-result-object v0

    goto :goto_13

    .line 81
    nop

    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_14
        :pswitch_14
        :pswitch_19
        :pswitch_1e
        :pswitch_23
        :pswitch_28
    .end packed-switch
.end method

.method protected getStreamFromAssets(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;
    .registers 5
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "extra"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 191
    sget-object v1, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ASSETS:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v1, p1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->crop(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 192
    .local v0, "filePath":Ljava/lang/String;
    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    return-object v1
.end method

.method protected getStreamFromContent(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;
    .registers 6
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "extra"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 172
    iget-object v2, p0, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 173
    .local v0, "res":Landroid/content/ContentResolver;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 174
    .local v1, "uri":Landroid/net/Uri;
    const-string v2, "content://com.android.contacts/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 175
    invoke-static {v0, v1}, Landroid/provider/ContactsContract$Contacts;->openContactPhotoInputStream(Landroid/content/ContentResolver;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    .line 177
    :goto_16
    return-object v2

    :cond_17
    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v2

    goto :goto_16
.end method

.method protected getStreamFromDrawable(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;
    .registers 6
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "extra"    # Ljava/lang/Object;

    .prologue
    .line 204
    sget-object v2, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->DRAWABLE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v2, p1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->crop(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 205
    .local v1, "drawableIdString":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 206
    .local v0, "drawableId":I
    iget-object v2, p0, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v2

    return-object v2
.end method

.method protected getStreamFromFile(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;
    .registers 9
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "extra"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 157
    sget-object v1, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v1, p1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->crop(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 158
    .local v0, "filePath":Ljava/lang/String;
    new-instance v1, Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;

    new-instance v2, Ljava/io/BufferedInputStream;

    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    const v4, 0x8000

    invoke-direct {v2, v3, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v4

    long-to-int v3, v4

    invoke-direct {v1, v2, v3}, Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;-><init>(Ljava/io/InputStream;I)V

    return-object v1
.end method

.method protected getStreamFromNetwork(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;
    .registers 10
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "extra"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 110
    invoke-virtual {p0, p1, p2}, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->createConnection(Ljava/lang/String;Ljava/lang/Object;)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 112
    .local v0, "conn":Ljava/net/HttpURLConnection;
    const/4 v3, 0x0

    .line 113
    .local v3, "redirectCount":I
    :goto_5
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    div-int/lit8 v4, v4, 0x64

    const/4 v5, 0x3

    if-ne v4, v5, :cond_1e

    const/4 v4, 0x5

    if-ge v3, v4, :cond_1e

    .line 114
    const-string v4, "Location"

    invoke-virtual {v0, v4}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, p2}, Lcom/nostra13/universalimageloader/core/download/BaseImageDownloader;->createConnection(Ljava/lang/String;Ljava/lang/Object;)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 115
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 120
    :cond_1e
    :try_start_1e
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_21} :catch_34

    move-result-object v2

    .line 126
    .local v2, "imageStream":Ljava/io/InputStream;
    new-instance v4, Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;

    new-instance v5, Ljava/io/BufferedInputStream;

    const v6, 0x8000

    invoke-direct {v5, v2, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v6

    invoke-direct {v4, v5, v6}, Lcom/nostra13/universalimageloader/core/assist/ContentLengthInputStream;-><init>(Ljava/io/InputStream;I)V

    return-object v4

    .line 121
    .end local v2    # "imageStream":Ljava/io/InputStream;
    :catch_34
    move-exception v1

    .line 123
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-static {v4}, Lcom/nostra13/universalimageloader/utils/IoUtils;->readAndCloseStream(Ljava/io/InputStream;)V

    .line 124
    throw v1
.end method

.method protected getStreamFromOtherSource(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;
    .registers 7
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "extra"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 223
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "UIL doesn\'t support scheme(protocol) by default [%s]. You should implement this support yourself (BaseImageDownloader.getStreamFromOtherSource(...))"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
