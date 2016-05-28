.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsTargetAssetController;
.super Ljava/lang/Object;
.source "AdobeAssetViewCommentsTargetAssetController.java"


# static fields
.field private static _targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;


# direct methods
.method public static getTargetAsset()Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;
    .registers 1

    .prologue
    .line 16
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsTargetAssetController;->_targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    return-object v0
.end method

.method public static setTargetAsset(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
    .registers 1
    .param p0, "targetAsset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 12
    sput-object p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/comments/AdobeAssetViewCommentsTargetAssetController;->_targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 13
    return-void
.end method
