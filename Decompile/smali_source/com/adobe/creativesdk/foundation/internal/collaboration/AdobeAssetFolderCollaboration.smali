.class public Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;
.super Ljava/lang/Object;
.source "AdobeAssetFolderCollaboration.java"


# instance fields
.field _folder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;->_folder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .line 11
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;)V
    .registers 2
    .param p1, "folder"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;->_folder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    .line 15
    return-void
.end method


# virtual methods
.method public getCollaboratedFolder()Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;->_folder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    return-object v0
.end method

.method public getCollaboration(Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;)V
    .registers 4
    .param p1, "getCollaborationCallback"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;

    .prologue
    .line 22
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;->_folder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    if-nez v1, :cond_5

    .line 27
    :goto_4
    return-void

    .line 24
    :cond_5
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getSharedSession()Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    move-result-object v0

    .line 25
    .local v0, "sharedSession":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeAssetFolderCollaboration;->_folder:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getCollaboration(Lcom/adobe/creativesdk/foundation/storage/AdobeAssetFolder;Lcom/adobe/creativesdk/foundation/internal/collaboration/IAdobeCollaborationGetCollaborationCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    goto :goto_4
.end method
