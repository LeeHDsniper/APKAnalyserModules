.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavToMobileCreationPackageCollectionData;
.super Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;
.source "AdobeAssetViewNavigateCommands.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NavToMobileCreationPackageCollectionData"
.end annotation


# instance fields
.field public assetPackagePages:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetPackagePages;

.field public collectionGUID:Ljava/lang/String;

.field public collectionHref:Ljava/lang/String;

.field public collectionName:Ljava/lang/String;

.field public dataSourceType:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetDataSourceType;

.field public parentHref:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/commands/AdobeAssetViewNavigateCommands$NavBaseCommandData;-><init>()V

    return-void
.end method
