.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;
.super Ljava/lang/Object;
.source "AdobeAssetDataSourceMgr.java"


# static fields
.field private static _sInstance:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;


# instance fields
.field _ccFilesChangedFolder:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;->_ccFilesChangedFolder:Ljava/util/ArrayList;

    .line 23
    return-void
.end method

.method public static getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;
    .registers 1

    .prologue
    .line 16
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;

    if-nez v0, :cond_b

    .line 17
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;

    .line 18
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;

    return-object v0
.end method


# virtual methods
.method public isFolderMarkedAsChanged(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Z)Z
    .registers 8
    .param p1, "folder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .param p2, "clearIfChanged"    # Z

    .prologue
    const/4 v3, 0x0

    .line 27
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;->_ccFilesChangedFolder:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_a

    .line 42
    :cond_9
    :goto_9
    return v3

    .line 30
    :cond_a
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getHref()Ljava/net/URI;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    .line 31
    .local v0, "folderHref":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_13
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;->_ccFilesChangedFolder:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_9

    .line 32
    iget-object v4, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;->_ccFilesChangedFolder:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 33
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_32

    .line 35
    if-eqz p2, :cond_30

    .line 36
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;->_ccFilesChangedFolder:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 38
    :cond_30
    const/4 v3, 0x1

    goto :goto_9

    .line 31
    :cond_32
    add-int/lit8 v1, v1, 0x1

    goto :goto_13
.end method

.method public setFolderAsChanged(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V
    .registers 4
    .param p1, "folder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .prologue
    .line 46
    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;->isFolderMarkedAsChanged(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Z)Z

    move-result v1

    if-nez v1, :cond_14

    .line 47
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getHref()Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "folderHref":Ljava/lang/String;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/AdobeAssetDataSourceMgr;->_ccFilesChangedFolder:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    .end local v0    # "folderHref":Ljava/lang/String;
    :cond_14
    return-void
.end method
