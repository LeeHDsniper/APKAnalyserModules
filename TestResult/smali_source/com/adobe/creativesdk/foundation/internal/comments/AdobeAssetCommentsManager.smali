.class public Lcom/adobe/creativesdk/foundation/internal/comments/AdobeAssetCommentsManager;
.super Ljava/lang/Object;
.source "AdobeAssetCommentsManager.java"


# instance fields
.field targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
    .registers 2
    .param p1, "targetAsset"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/comments/AdobeAssetCommentsManager;->targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 16
    return-void
.end method


# virtual methods
.method public addComments(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeAddCommentCallback;)V
    .registers 10
    .param p1, "comment"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeAddCommentCallback;

    .prologue
    .line 29
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getSharedSession()Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    move-result-object v0

    .line 30
    .local v0, "collaborationSession":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->getSharedAuthManager()Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;

    move-result-object v6

    .line 31
    .local v6, "authManager":Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;
    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getDisplayName()Ljava/lang/String;

    move-result-object v2

    .line 32
    .local v2, "userName":Ljava/lang/String;
    invoke-virtual {v6}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->getEmail()Ljava/lang/String;

    move-result-object v3

    .line 33
    .local v3, "emailAddress":Ljava/lang/String;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/comments/AdobeAssetCommentsManager;->targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    move-object v4, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->createComment(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeAddCommentCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .line 34
    return-void
.end method

.method public deleteComment(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeDeleteCommentCallback;)V
    .registers 4
    .param p1, "commentURL"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeDeleteCommentCallback;

    .prologue
    .line 24
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getSharedSession()Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    move-result-object v0

    .line 25
    .local v0, "collaborationSession":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
    invoke-virtual {v0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->deleteComment(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeDeleteCommentCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .line 26
    return-void
.end method

.method public getComments(Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeGetCommentsCallback;)V
    .registers 4
    .param p1, "callback"    # Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeGetCommentsCallback;

    .prologue
    .line 19
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getSharedSession()Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;

    move-result-object v0

    .line 20
    .local v0, "collaborationSession":Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/internal/comments/AdobeAssetCommentsManager;->targetAsset:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    invoke-virtual {v0, v1, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/AdobeCollaborationSession;->getComments(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;Lcom/adobe/creativesdk/foundation/internal/comments/IAdobeGetCommentsCallback;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    .line 21
    return-void
.end method
