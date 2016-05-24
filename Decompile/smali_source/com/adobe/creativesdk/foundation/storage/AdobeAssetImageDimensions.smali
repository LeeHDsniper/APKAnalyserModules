.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
.super Ljava/lang/Object;
.source "AdobeAssetImageDimensions.java"


# instance fields
.field public height:F

.field public width:F


# direct methods
.method public constructor <init>(FF)V
    .registers 3
    .param p1, "width"    # F
    .param p2, "height"    # F

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->width:F

    .line 34
    iput p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->height:F

    .line 35
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 44
    instance-of v2, p1, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    if-nez v2, :cond_6

    .line 48
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 47
    check-cast v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;

    .line 48
    .local v0, "size":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;
    iget v2, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->width:F

    iget v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->width:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_5

    iget v2, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->height:F

    iget v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->height:F

    cmpl-float v2, v2, v3

    if-nez v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->width:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetImageDimensions;->height:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
