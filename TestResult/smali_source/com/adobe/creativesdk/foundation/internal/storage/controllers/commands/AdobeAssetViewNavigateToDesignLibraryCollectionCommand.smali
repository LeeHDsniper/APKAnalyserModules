.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateToDesignLibraryCollectionCommand;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandData;
.source "AdobeAssetViewNavigateToDesignLibraryCollectionCommand.java"


# instance fields
.field public collectionGUID:Ljava/lang/String;

.field public collectionHref:Ljava/lang/String;

.field public collectionName:Ljava/lang/String;

.field public library:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

.field public parentHref:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewCommandData;-><init>()V

    return-void
.end method
