.class public Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentsDataSource;
.super Ljava/lang/Object;
.source "AdobeAssetCommentsDataSource.java"


# instance fields
.field private comments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;",
            ">;"
        }
    .end annotation
.end field

.field private resource:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;


# direct methods
.method private constructor <init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V
    .registers 3
    .param p1, "resource"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentsDataSource;->comments:Ljava/util/ArrayList;

    .line 21
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentsDataSource;->resource:Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .line 22
    return-void
.end method

.method public static commentsFromJSONData(Lorg/json/JSONArray;Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentsDataSource;
    .registers 19
    .param p0, "commentsData"    # Lorg/json/JSONArray;
    .param p1, "resource"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;

    .prologue
    .line 25
    new-instance v11, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentsDataSource;

    move-object/from16 v0, p1

    invoke-direct {v11, v0}, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentsDataSource;-><init>(Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;)V

    .line 26
    .local v11, "dataSource":Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentsDataSource;
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_8
    invoke-virtual/range {p0 .. p0}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v13, v14, :cond_5e

    .line 29
    :try_start_e
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 30
    .local v2, "comment":Lorg/json/JSONObject;
    const-string v14, "username"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 31
    .local v4, "userName":Ljava/lang/String;
    const-string v14, "url"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 32
    .local v9, "commentURL":Ljava/lang/String;
    const-string v14, "avatar"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 33
    .local v8, "avatarURL":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/foundation/storage/AdobeAsset;->getHref()Ljava/net/URI;

    move-result-object v14

    invoke-virtual {v14}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v10

    .line 34
    .local v10, "resourceURL":Ljava/lang/String;
    const-string v14, "content"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_57

    const-string v14, "content"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v15, "\n"

    const-string v16, "<br/>"

    invoke-virtual/range {v14 .. v16}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    .line 35
    .local v5, "content":Ljava/lang/String;
    :goto_44
    const-string v14, "created"

    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v6

    .line 36
    .local v6, "timestamp":J
    new-instance v3, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;

    invoke-direct/range {v3 .. v10}, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .local v3, "commentData":Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;
    iget-object v14, v11, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentsDataSource;->comments:Ljava/util/ArrayList;

    invoke-virtual {v14, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_54
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_54} :catch_59

    .line 26
    .end local v2    # "comment":Lorg/json/JSONObject;
    .end local v3    # "commentData":Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;
    .end local v4    # "userName":Ljava/lang/String;
    .end local v5    # "content":Ljava/lang/String;
    .end local v6    # "timestamp":J
    .end local v8    # "avatarURL":Ljava/lang/String;
    .end local v9    # "commentURL":Ljava/lang/String;
    .end local v10    # "resourceURL":Ljava/lang/String;
    :goto_54
    add-int/lit8 v13, v13, 0x1

    goto :goto_8

    .line 34
    .restart local v2    # "comment":Lorg/json/JSONObject;
    .restart local v4    # "userName":Ljava/lang/String;
    .restart local v8    # "avatarURL":Ljava/lang/String;
    .restart local v9    # "commentURL":Ljava/lang/String;
    .restart local v10    # "resourceURL":Ljava/lang/String;
    :cond_57
    const/4 v5, 0x0

    goto :goto_44

    .line 39
    .end local v2    # "comment":Lorg/json/JSONObject;
    .end local v4    # "userName":Ljava/lang/String;
    .end local v8    # "avatarURL":Ljava/lang/String;
    .end local v9    # "commentURL":Ljava/lang/String;
    .end local v10    # "resourceURL":Ljava/lang/String;
    :catch_59
    move-exception v12

    .line 41
    .local v12, "exp":Lorg/json/JSONException;
    invoke-virtual {v12}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_54

    .line 44
    .end local v12    # "exp":Lorg/json/JSONException;
    :cond_5e
    return-object v11
.end method


# virtual methods
.method public getComments()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 48
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/internal/comments/models/AdobeAssetCommentsDataSource;->comments:Ljava/util/ArrayList;

    return-object v0
.end method
