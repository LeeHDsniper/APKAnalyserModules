.class public Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;
.super Ljava/lang/Object;
.source "BaseImageDecoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "ExifInfo"
.end annotation


# instance fields
.field public final flipHorizontal:Z

.field public final rotation:I


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 225
    iput v0, p0, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;->rotation:I

    .line 226
    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;->flipHorizontal:Z

    .line 227
    return-void
.end method

.method protected constructor <init>(IZ)V
    .registers 3
    .param p1, "rotation"    # I
    .param p2, "flipHorizontal"    # Z

    .prologue
    .line 229
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 230
    iput p1, p0, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;->rotation:I

    .line 231
    iput-boolean p2, p0, Lcom/nostra13/universalimageloader/core/decode/BaseImageDecoder$ExifInfo;->flipHorizontal:Z

    .line 232
    return-void
.end method
