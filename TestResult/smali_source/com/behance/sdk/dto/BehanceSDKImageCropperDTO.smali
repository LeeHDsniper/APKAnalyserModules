.class public Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;
.super Ljava/lang/Object;
.source "BehanceSDKImageCropperDTO.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x3469bbd7264759a5L


# instance fields
.field private height:I

.field private imageModule:Lcom/behance/sdk/project/modules/ImageModule;

.field private includeControls:Z

.field private minSize:I

.field private width:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, -0x1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput v0, p0, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->height:I

    iput v0, p0, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->width:I

    iput v0, p0, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->minSize:I

    return-void
.end method


# virtual methods
.method public getHeight()I
    .registers 2

    .prologue
    .line 19
    iget v0, p0, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->height:I

    return v0
.end method

.method public getImageModule()Lcom/behance/sdk/project/modules/ImageModule;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->imageModule:Lcom/behance/sdk/project/modules/ImageModule;

    return-object v0
.end method

.method public getMinSize()I
    .registers 2

    .prologue
    .line 35
    iget v0, p0, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->minSize:I

    return v0
.end method

.method public getWidth()I
    .registers 2

    .prologue
    .line 27
    iget v0, p0, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->width:I

    return v0
.end method

.method public isIncludeControls()Z
    .registers 2

    .prologue
    .line 51
    iget-boolean v0, p0, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->includeControls:Z

    return v0
.end method

.method public setHeight(I)V
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 23
    iput p1, p0, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->height:I

    .line 24
    return-void
.end method

.method public setImageModule(Lcom/behance/sdk/project/modules/ImageModule;)V
    .registers 2
    .param p1, "imageModule"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->imageModule:Lcom/behance/sdk/project/modules/ImageModule;

    .line 48
    return-void
.end method

.method public setIncludeControls(Z)V
    .registers 2
    .param p1, "includeControls"    # Z

    .prologue
    .line 55
    iput-boolean p1, p0, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->includeControls:Z

    .line 56
    return-void
.end method

.method public setMinSize(I)V
    .registers 2
    .param p1, "minSize"    # I

    .prologue
    .line 39
    iput p1, p0, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->minSize:I

    .line 40
    return-void
.end method

.method public setWidth(I)V
    .registers 2
    .param p1, "width"    # I

    .prologue
    .line 31
    iput p1, p0, Lcom/behance/sdk/dto/BehanceSDKImageCropperDTO;->width:I

    .line 32
    return-void
.end method
