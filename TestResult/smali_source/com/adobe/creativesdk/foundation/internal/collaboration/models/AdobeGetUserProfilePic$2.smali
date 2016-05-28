.class final Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$2;
.super Ljava/lang/Object;
.source "AdobeGetUserProfilePic.java"

# interfaces
.implements Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$IAdobeUserProfilePictureResponse;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->getAvatarFromURL(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;

.field final synthetic val$imageURL:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;)V
    .registers 3

    .prologue
    .line 106
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$2;->val$imageURL:Ljava/lang/String;

    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$2;->val$callback:Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;)V
    .registers 6
    .param p1, "response"    # Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;

    .prologue
    .line 110
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpResponse;->getDataBytes()[B

    move-result-object v1

    .line 111
    .local v1, "data":[B
    const/4 v2, 0x0

    array-length v3, v1

    invoke-static {v1, v2, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 112
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$2;->val$imageURL:Ljava/lang/String;

    if-eqz v2, :cond_1d

    # getter for: Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->_mPictureCache:Landroid/util/LruCache;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->access$100()Landroid/util/LruCache;

    move-result-object v2

    if-eqz v2, :cond_1d

    .line 113
    # getter for: Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->_mPictureCache:Landroid/util/LruCache;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->access$100()Landroid/util/LruCache;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$2;->val$imageURL:Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    :cond_1d
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$2;->val$callback:Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;

    invoke-interface {v2, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;->onComplete(Landroid/graphics/Bitmap;)V

    .line 115
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$2;->val$imageURL:Ljava/lang/String;

    const/4 v3, 0x1

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->handleOtherPictureRequests(Ljava/lang/String;Landroid/graphics/Bitmap;Z)V
    invoke-static {v2, v0, v3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->access$200(Ljava/lang/String;Landroid/graphics/Bitmap;Z)V

    .line 116
    return-void
.end method

.method public onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V
    .registers 5
    .param p1, "error"    # Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$2;->val$callback:Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;

    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;->onError()V

    .line 122
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$2;->val$imageURL:Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v2, 0x0

    # invokes: Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->handleOtherPictureRequests(Ljava/lang/String;Landroid/graphics/Bitmap;Z)V
    invoke-static {v0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->access$200(Ljava/lang/String;Landroid/graphics/Bitmap;Z)V

    .line 123
    return-void
.end method
