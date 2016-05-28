.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToPhotoCollectionCommand;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandData;
.source "AdobeAssetViewNavigateToPhotoCollectionCommand.java"


# instance fields
.field public catalogGUID:Ljava/lang/String;

.field public catalogName:Ljava/lang/String;

.field public collectionGUID:Ljava/lang/String;

.field public collectionName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandData;-><init>()V

    return-void
.end method
