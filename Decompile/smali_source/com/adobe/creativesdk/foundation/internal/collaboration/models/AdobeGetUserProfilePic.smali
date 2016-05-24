.class public Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;
.super Ljava/lang/Object;
.source "AdobeGetUserProfilePic.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$IAdobeUserProfilePictureResponse;
    }
.end annotation


# static fields
.field private static MAX_ITEMS:I

.field private static _mPictureCache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache",
            "<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private static api_key:Ljava/lang/String;

.field private static client_id:Ljava/lang/String;

.field private static pictureRequestQueue:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;",
            ">;"
        }
    .end annotation
.end field

.field private static service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    const-string v0, "spFzOBHcTLsIoXWyKjayKRW5gBZ55wWh"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->api_key:Ljava/lang/String;

    .line 34
    const-string v0, "TU7NfEJ94OGF29SkePTunHHM8QOImepU"

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->client_id:Ljava/lang/String;

    .line 35
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .line 37
    const/16 v0, 0xa

    sput v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->MAX_ITEMS:I

    return-void
.end method

.method static synthetic access$000(Lorg/json/JSONObject;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;)V
    .registers 3
    .param p0, "x0"    # Lorg/json/JSONObject;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;

    .prologue
    .line 31
    invoke-static {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->getRendition(Lorg/json/JSONObject;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;)V

    return-void
.end method

.method static synthetic access$100()Landroid/util/LruCache;
    .registers 1

    .prologue
    .line 31
    sget-object v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->_mPictureCache:Landroid/util/LruCache;

    return-object v0
.end method

.method static synthetic access$200(Ljava/lang/String;Landroid/graphics/Bitmap;Z)V
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Landroid/graphics/Bitmap;
    .param p2, "x2"    # Z

    .prologue
    .line 31
    invoke-static {p0, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->handleOtherPictureRequests(Ljava/lang/String;Landroid/graphics/Bitmap;Z)V

    return-void
.end method

.method public static getAvatarFromURL(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;)V
    .registers 5
    .param p0, "imageURL"    # Ljava/lang/String;
    .param p1, "callback"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;

    .prologue
    .line 89
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->pictureRequestQueue:Ljava/util/HashMap;

    if-nez v1, :cond_b

    .line 90
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->pictureRequestQueue:Ljava/util/HashMap;

    .line 91
    :cond_b
    if-eqz p0, :cond_13

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_17

    .line 92
    :cond_13
    invoke-interface {p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;->onError()V

    .line 128
    :goto_16
    return-void

    .line 95
    :cond_17
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->_mPictureCache:Landroid/util/LruCache;

    if-nez v1, :cond_36

    .line 96
    new-instance v1, Landroid/util/LruCache;

    sget v2, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->MAX_ITEMS:I

    invoke-direct {v1, v2}, Landroid/util/LruCache;-><init>(I)V

    sput-object v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->_mPictureCache:Landroid/util/LruCache;

    .line 105
    :cond_24
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->pictureRequestQueue:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_49

    .line 106
    const/4 v1, 0x0

    new-instance v2, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$2;

    invoke-direct {v2, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$2;-><init>(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;)V

    invoke-static {p0, v1, v2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->getResponse(Ljava/lang/String;ZLcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$IAdobeUserProfilePictureResponse;)V

    goto :goto_16

    .line 99
    :cond_36
    if-eqz p0, :cond_47

    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->_mPictureCache:Landroid/util/LruCache;

    invoke-virtual {v1, p0}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    move-object v0, v1

    .line 100
    .local v0, "profilePic":Landroid/graphics/Bitmap;
    :goto_41
    if-eqz v0, :cond_24

    .line 101
    invoke-interface {p1, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;->onComplete(Landroid/graphics/Bitmap;)V

    goto :goto_16

    .line 99
    .end local v0    # "profilePic":Landroid/graphics/Bitmap;
    :cond_47
    const/4 v0, 0x0

    goto :goto_41

    .line 127
    :cond_49
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->pictureRequestQueue:Ljava/util/HashMap;

    invoke-virtual {v1, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_16
.end method

.method public static getAvatarFromUserID(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;)V
    .registers 6
    .param p0, "userId"    # Ljava/lang/String;
    .param p1, "callback"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;

    .prologue
    .line 41
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->pictureRequestQueue:Ljava/util/HashMap;

    if-nez v2, :cond_b

    .line 42
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    sput-object v2, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->pictureRequestQueue:Ljava/util/HashMap;

    .line 43
    :cond_b
    if-eqz p0, :cond_13

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_17

    .line 44
    :cond_13
    invoke-interface {p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;->onError()V

    .line 86
    :goto_16
    return-void

    .line 47
    :cond_17
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->_mPictureCache:Landroid/util/LruCache;

    if-nez v2, :cond_68

    .line 48
    new-instance v2, Landroid/util/LruCache;

    sget v3, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->MAX_ITEMS:I

    invoke-direct {v2, v3}, Landroid/util/LruCache;-><init>(I)V

    sput-object v2, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->_mPictureCache:Landroid/util/LruCache;

    .line 57
    :cond_24
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->pictureRequestQueue:Ljava/util/HashMap;

    invoke-virtual {v2, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_76

    .line 58
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https://www.behance.net/v2/users/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 60
    .local v1, "webUrl":Ljava/lang/String;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    move-result-object v2

    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->AdobeAuthIMSEnvironmentStageUS:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    if-ne v2, v3, :cond_5e

    .line 61
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https://net.s2stagehance.com/v2/users/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 63
    :cond_5e
    const/4 v2, 0x1

    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$1;

    invoke-direct {v3, p0, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$1;-><init>(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;)V

    invoke-static {v1, v2, v3}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->getResponse(Ljava/lang/String;ZLcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$IAdobeUserProfilePictureResponse;)V

    goto :goto_16

    .line 51
    .end local v1    # "webUrl":Ljava/lang/String;
    :cond_68
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->_mPictureCache:Landroid/util/LruCache;

    invoke-virtual {v2, p0}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 52
    .local v0, "profilePic":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_24

    .line 53
    invoke-interface {p1, v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;->onComplete(Landroid/graphics/Bitmap;)V

    goto :goto_16

    .line 85
    .end local v0    # "profilePic":Landroid/graphics/Bitmap;
    :cond_76
    sget-object v2, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->pictureRequestQueue:Ljava/util/HashMap;

    invoke-virtual {v2, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_16
.end method

.method private static getRendition(Lorg/json/JSONObject;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;)V
    .registers 13
    .param p0, "object"    # Lorg/json/JSONObject;
    .param p1, "userID"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;

    .prologue
    .line 133
    :try_start_0
    const-string v8, "user"

    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 134
    .local v7, "user":Lorg/json/JSONObject;
    const-string v8, "images"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONObject;
    :try_end_e
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_e} :catch_40

    .line 135
    .local v2, "images":Lorg/json/JSONObject;
    const/4 v1, 0x0

    .line 136
    .local v1, "imageURL":Ljava/lang/String;
    const/16 v6, 0x32

    .line 138
    .local v6, "max":I
    :try_start_11
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 139
    .local v5, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_15
    :goto_15
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_36

    .line 141
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 142
    .local v3, "key":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 143
    .local v4, "keyNum":I
    if-lt v4, v6, :cond_15

    .line 145
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_2a
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_2a} :catch_2d

    move-result-object v1

    .line 146
    move v6, v4

    goto :goto_15

    .line 150
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "keyNum":I
    .end local v5    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :catch_2d
    move-exception v0

    .line 152
    .local v0, "exp":Lorg/json/JSONException;
    :try_start_2e
    const-string v8, "50"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "imageURL":Ljava/lang/String;
    check-cast v1, Ljava/lang/String;

    .line 154
    .end local v0    # "exp":Lorg/json/JSONException;
    .restart local v1    # "imageURL":Ljava/lang/String;
    :cond_36
    const/4 v8, 0x0

    new-instance v9, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$3;

    invoke-direct {v9, p1, p2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$3;-><init>(Ljava/lang/String;Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;)V

    invoke-static {v1, v8, v9}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->getResponse(Ljava/lang/String;ZLcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$IAdobeUserProfilePictureResponse;)V
    :try_end_3f
    .catch Lorg/json/JSONException; {:try_start_2e .. :try_end_3f} :catch_40

    .line 178
    .end local v1    # "imageURL":Ljava/lang/String;
    .end local v2    # "images":Lorg/json/JSONObject;
    .end local v6    # "max":I
    .end local v7    # "user":Lorg/json/JSONObject;
    :goto_3f
    return-void

    .line 174
    :catch_40
    move-exception v0

    .line 176
    .restart local v0    # "exp":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    goto :goto_3f
.end method

.method private static getResponse(Ljava/lang/String;ZLcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$IAdobeUserProfilePictureResponse;)V
    .registers 15
    .param p0, "webUrl"    # Ljava/lang/String;
    .param p1, "addKey"    # Z
    .param p2, "callback"    # Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$IAdobeUserProfilePictureResponse;

    .prologue
    const/4 v11, 0x0

    .line 223
    :try_start_1
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 224
    .local v6, "url":Ljava/net/URL;
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    if-nez v7, :cond_14

    .line 225
    new-instance v7, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct {v7, v8, v9, v10}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    sput-object v7, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    .line 226
    :cond_14
    new-instance v5, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;

    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;->AdobeNetworkHttpRequestMethodGET:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;

    const/4 v8, 0x0

    invoke-direct {v5, v6, v7, v8}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;-><init>(Ljava/net/URL;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequestMethod;Ljava/util/Map;)V

    .line 227
    .local v5, "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    if-eqz p1, :cond_39

    .line 228
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 229
    .local v4, "queryParams":Ljava/util/Map;
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getSharedInstance()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;

    move-result-object v7

    invoke-virtual {v7}, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIdentityManagementService;->getEnvironment()Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    move-result-object v7

    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;->AdobeAuthIMSEnvironmentStageUS:Lcom/adobe/creativesdk/foundation/internal/auth/AdobeAuthIMSEnvironment;

    if-ne v7, v8, :cond_4c

    .line 230
    const-string v7, "client_id"

    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->client_id:Ljava/lang/String;

    invoke-interface {v4, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    :goto_36
    invoke-virtual {v5, v4}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;->setQueryParams(Ljava/util/Map;)V
    :try_end_39
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_39} :catch_54

    .line 235
    .end local v4    # "queryParams":Ljava/util/Map;
    :cond_39
    const/4 v0, 0x0

    .line 237
    .local v0, "callBackRequiredForHandler":Landroid/os/Handler;
    :try_start_3a
    new-instance v0, Landroid/os/Handler;

    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_3f} :catch_59
    .catch Ljava/net/MalformedURLException; {:try_start_3a .. :try_end_3f} :catch_54

    .line 242
    .restart local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    :goto_3f
    :try_start_3f
    new-instance v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$4;

    invoke-direct {v1, p2}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$4;-><init>(Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$IAdobeUserProfilePictureResponse;)V

    .line 254
    .local v1, "completionHandler":Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    sget-object v7, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->service:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;

    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;->NORMAL:Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;

    invoke-virtual {v7, v5, v8, v1, v0}, Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpService;->getResponseForDataRequest(Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkRequestPriority;Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;Landroid/os/Handler;)Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpTaskHandle;

    .line 263
    .end local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    .end local v1    # "completionHandler":Lcom/adobe/creativesdk/foundation/internal/net/IAdobeNetworkCompletionHandler;
    .end local v5    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v6    # "url":Ljava/net/URL;
    :goto_4b
    return-void

    .line 232
    .restart local v4    # "queryParams":Ljava/util/Map;
    .restart local v5    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .restart local v6    # "url":Ljava/net/URL;
    :cond_4c
    const-string v7, "api_key"

    sget-object v8, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->api_key:Ljava/lang/String;

    invoke-interface {v4, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_53
    .catch Ljava/net/MalformedURLException; {:try_start_3f .. :try_end_53} :catch_54

    goto :goto_36

    .line 258
    .end local v4    # "queryParams":Ljava/util/Map;
    .end local v5    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .end local v6    # "url":Ljava/net/URL;
    :catch_54
    move-exception v3

    .line 260
    .local v3, "exp":Ljava/net/MalformedURLException;
    invoke-interface {p2, v11}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic$IAdobeUserProfilePictureResponse;->onError(Lcom/adobe/creativesdk/foundation/network/AdobeNetworkException;)V

    goto :goto_4b

    .line 238
    .end local v3    # "exp":Ljava/net/MalformedURLException;
    .restart local v5    # "request":Lcom/adobe/creativesdk/foundation/internal/net/AdobeNetworkHttpRequest;
    .restart local v6    # "url":Ljava/net/URL;
    :catch_59
    move-exception v2

    .line 239
    .local v2, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    .restart local v0    # "callBackRequiredForHandler":Landroid/os/Handler;
    goto :goto_3f
.end method

.method private static handleOtherPictureRequests(Ljava/lang/String;Landroid/graphics/Bitmap;Z)V
    .registers 5
    .param p0, "ID"    # Ljava/lang/String;
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "success"    # Z

    .prologue
    .line 181
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->pictureRequestQueue:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 183
    if-eqz p2, :cond_1b

    .line 184
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->pictureRequestQueue:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;

    .line 185
    .local v0, "callback":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;
    invoke-interface {v0, p1}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;->onComplete(Landroid/graphics/Bitmap;)V

    .line 192
    :goto_15
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->pictureRequestQueue:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    .end local v0    # "callback":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;
    :cond_1a
    return-void

    .line 189
    :cond_1b
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/AdobeGetUserProfilePic;->pictureRequestQueue:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;

    .line 190
    .restart local v0    # "callback":Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;
    invoke-interface {v0}, Lcom/adobe/creativesdk/foundation/internal/collaboration/models/IAdobeProfilePicCallback;->onError()V

    goto :goto_15
.end method
