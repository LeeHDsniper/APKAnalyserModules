.class public Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;
.super Ljava/lang/Object;
.source "AdobeCCFilesUploadMgr.java"


# static fields
.field public static UPLOAD_SESSION_KEY:Ljava/lang/String;

.field private static _sInstance:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;


# instance fields
.field private _activeSessionsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    const-string v0, "uploadsessionkey"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;->UPLOAD_SESSION_KEY:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;->_activeSessionsList:Ljava/util/ArrayList;

    .line 47
    return-void
.end method

.method public static getInstance()Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;
    .registers 1

    .prologue
    .line 39
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;

    if-nez v0, :cond_b

    .line 40
    new-instance v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;

    .line 42
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;->_sInstance:Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;

    return-object v0
.end method

.method public static isUploadSessionDestinationFolderEqual(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)Z
    .registers 6
    .param p0, "uploadSession"    # Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;
    .param p1, "folder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .prologue
    .line 132
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;->getDestinationFolder()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    move-result-object v1

    .line 133
    .local v1, "uploadFolder":Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getHref()Ljava/net/URI;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, "inFolderHref":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;->getHref()Ljava/net/URI;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v2

    .line 136
    .local v2, "uploadFolderHref":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    return v3
.end method


# virtual methods
.method public getUploadSessionOfFolder(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;
    .registers 7
    .param p1, "folder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .prologue
    .line 50
    const/4 v1, 0x0

    .line 51
    .local v1, "uploadSession":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;->_activeSessionsList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-nez v3, :cond_b

    move-object v2, v1

    .line 60
    .end local v1    # "uploadSession":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;
    .local v2, "uploadSession":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;
    :goto_a
    return-object v2

    .line 54
    .end local v2    # "uploadSession":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;
    .restart local v1    # "uploadSession":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;
    :cond_b
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;->_activeSessionsList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_11
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_24

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;

    .line 55
    .local v0, "session":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;
    invoke-static {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadMgr;->isUploadSessionDestinationFolderEqual(Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 56
    move-object v1, v0

    .end local v0    # "session":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;
    :cond_24
    move-object v2, v1

    .line 60
    .end local v1    # "uploadSession":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;
    .restart local v2    # "uploadSession":Lcom/adobe/creativesdk/foundation/internal/storage/controllers/upload/AdobeCCFilesUploadSession;
    goto :goto_a
.end method
