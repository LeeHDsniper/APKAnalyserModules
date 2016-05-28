.class Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$SlowNetworkImageDownloader;
.super Ljava/lang/Object;
.source "ImageLoaderConfiguration.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/download/ImageDownloader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SlowNetworkImageDownloader"
.end annotation


# instance fields
.field private final wrappedDownloader:Lcom/nostra13/universalimageloader/core/download/ImageDownloader;


# direct methods
.method public constructor <init>(Lcom/nostra13/universalimageloader/core/download/ImageDownloader;)V
    .registers 2
    .param p1, "wrappedDownloader"    # Lcom/nostra13/universalimageloader/core/download/ImageDownloader;

    .prologue
    .line 639
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 640
    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$SlowNetworkImageDownloader;->wrappedDownloader:Lcom/nostra13/universalimageloader/core/download/ImageDownloader;

    .line 641
    return-void
.end method


# virtual methods
.method public getStream(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;
    .registers 6
    .param p1, "imageUri"    # Ljava/lang/String;
    .param p2, "extra"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 645
    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$SlowNetworkImageDownloader;->wrappedDownloader:Lcom/nostra13/universalimageloader/core/download/ImageDownloader;

    invoke-interface {v1, p1, p2}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader;->getStream(Ljava/lang/String;Ljava/lang/Object;)Ljava/io/InputStream;

    move-result-object v0

    .line 646
    .local v0, "imageStream":Ljava/io/InputStream;
    sget-object v1, Lcom/nostra13/universalimageloader/core/ImageLoaderConfiguration$1;->$SwitchMap$com$nostra13$universalimageloader$core$download$ImageDownloader$Scheme:[I

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ofUri(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_1e

    .line 651
    .end local v0    # "imageStream":Ljava/io/InputStream;
    :goto_15
    return-object v0

    .line 649
    .restart local v0    # "imageStream":Ljava/io/InputStream;
    :pswitch_16
    new-instance v1, Lcom/nostra13/universalimageloader/core/assist/FlushedInputStream;

    invoke-direct {v1, v0}, Lcom/nostra13/universalimageloader/core/assist/FlushedInputStream;-><init>(Ljava/io/InputStream;)V

    move-object v0, v1

    goto :goto_15

    .line 646
    nop

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_16
        :pswitch_16
    .end packed-switch
.end method
