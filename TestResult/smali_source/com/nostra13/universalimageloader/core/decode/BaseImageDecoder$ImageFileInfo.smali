.class public Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;
.super Ljava/lang/Object;
.source "BaseImageDecoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "ImageFileInfo"
.end annotation


# instance fields
.field public final exif:Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;

.field public final imageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;


# direct methods
.method protected constructor <init>(Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;)V
    .registers 3
    .param p1, "imageSize"    # Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .param p2, "exif"    # Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;

    .prologue
    .line 240
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 241
    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;->imageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    .line 242
    iput-object p2, p0, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ImageFileInfo;->exif:Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;

    .line 243
    return-void
.end method
