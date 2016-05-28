.class public Lcom/behance/sdk/project/modules/CreativeCloudAssetModule;
.super Lcom/behance/sdk/project/modules/ImageModule;
.source "CreativeCloudAssetModule.java"


# static fields
.field private static final serialVersionUID:J = 0x661f29c80c4e578dL


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/behance/sdk/project/modules/ImageModule;-><init>(Ljava/io/File;)V

    .line 20
    return-void
.end method


# virtual methods
.method public deleteFromFileSystem()V
    .registers 2

    .prologue
    .line 29
    invoke-virtual {p0}, Lcom/behance/sdk/project/modules/CreativeCloudAssetModule;->getFile()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/behance/sdk/util/BehanceSDKUtils;->deleteRecursive(Ljava/io/File;)V

    .line 30
    return-void
.end method

.method public getType()Lcom/behance/sdk/project/modules/ProjectModuleTypes;
    .registers 2

    .prologue
    .line 24
    sget-object v0, Lcom/behance/sdk/project/modules/ProjectModuleTypes;->CREATIVECLOUD_ASSET:Lcom/behance/sdk/project/modules/ProjectModuleTypes;

    return-object v0
.end method
