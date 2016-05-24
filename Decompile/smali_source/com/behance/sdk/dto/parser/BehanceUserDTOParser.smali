.class public Lcom/behance/sdk/dto/parser/BehanceUserDTOParser;
.super Ljava/lang/Object;
.source "BehanceUserDTOParser.java"


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const-class v0, Lcom/behance/sdk/dto/parser/BehanceUserDTOParser;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/dto/parser/BehanceUserDTOParser;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;
    .registers 31
    .param p1, "userJsonObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 46
    if-eqz p1, :cond_2f0

    .line 47
    :try_start_2
    new-instance v4, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;

    invoke-direct {v4}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;-><init>()V

    .line 48
    .local v4, "behanceUserDTO":Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;
    const-string v26, "id"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setId(I)V

    .line 49
    const-string v26, "first_name"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setFirstName(Ljava/lang/String;)V

    .line 50
    const-string v26, "last_name"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setLastName(Ljava/lang/String;)V

    .line 51
    const-string v26, "username"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setUserName(Ljava/lang/String;)V

    .line 52
    const-string v26, "url"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setProfileUrl(Ljava/lang/String;)V

    .line 53
    const-string v26, "display_name"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setDisplayName(Ljava/lang/String;)V

    .line 54
    const-string v26, "city"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setCity(Ljava/lang/String;)V

    .line 55
    const-string v26, "state"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setState(Ljava/lang/String;)V

    .line 56
    const-string v26, "country"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setCountry(Ljava/lang/String;)V

    .line 57
    const-string v26, "company"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setCompany(Ljava/lang/String;)V

    .line 58
    const-string v26, "occupation"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setOccupation(Ljava/lang/String;)V

    .line 59
    const-string v26, "created_on"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v26

    move-wide/from16 v0, v26

    invoke-virtual {v4, v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setCreatedOn(J)V

    .line 60
    const-string v26, "twitter"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setTwitterHandle(Ljava/lang/String;)V

    .line 62
    const-string v26, "links"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v17

    .line 63
    .local v17, "linksJSONArray":Lorg/json/JSONArray;
    if-eqz v17, :cond_10f

    .line 64
    const/16 v16, 0x0

    .local v16, "linksCounter":I
    :goto_d8
    invoke-virtual/range {v17 .. v17}, Lorg/json/JSONArray;->length()I

    move-result v26

    move/from16 v0, v16

    move/from16 v1, v26

    if-ge v0, v1, :cond_10f

    .line 65
    move-object/from16 v0, v17

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v15

    .line 66
    .local v15, "linkJsonObject":Lorg/json/JSONObject;
    if-eqz v15, :cond_10c

    .line 67
    new-instance v25, Lcom/behance/sdk/dto/search/BehanceSDKWebLinkDTO;

    invoke-direct/range {v25 .. v25}, Lcom/behance/sdk/dto/search/BehanceSDKWebLinkDTO;-><init>()V

    .line 68
    .local v25, "userLink":Lcom/behance/sdk/dto/search/BehanceSDKWebLinkDTO;
    const-string v26, "title"

    move-object/from16 v0, v26

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/behance/sdk/dto/search/BehanceSDKWebLinkDTO;->setTitle(Ljava/lang/String;)V

    .line 69
    const-string v26, "url"

    move-object/from16 v0, v26

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Lcom/behance/sdk/dto/search/BehanceSDKWebLinkDTO;->setUrl(Ljava/lang/String;)V

    .line 70
    move-object/from16 v0, v25

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->addWebLink(Lcom/behance/sdk/dto/search/BehanceSDKWebLinkDTO;)V

    .line 64
    .end local v25    # "userLink":Lcom/behance/sdk/dto/search/BehanceSDKWebLinkDTO;
    :cond_10c
    add-int/lit8 v16, v16, 0x1

    goto :goto_d8

    .line 75
    .end local v15    # "linkJsonObject":Lorg/json/JSONObject;
    .end local v16    # "linksCounter":I
    :cond_10f
    const-string v26, "sections"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v22

    .line 76
    .local v22, "sectionsJSONObject":Lorg/json/JSONObject;
    if-eqz v22, :cond_161

    .line 77
    invoke-virtual/range {v22 .. v22}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v21

    .line 78
    .local v21, "sectionKeysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_11f
    :goto_11f
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->hasNext()Z

    move-result v26

    if-eqz v26, :cond_161

    .line 79
    invoke-interface/range {v21 .. v21}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    invoke-static/range {v26 .. v26}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v23

    .line 80
    .local v23, "sectionsTitle":Ljava/lang/String;
    if-eqz v23, :cond_11f

    .line 81
    invoke-virtual/range {v22 .. v23}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 82
    .local v20, "sectionDescription":Ljava/lang/String;
    if-eqz v20, :cond_11f

    .line 83
    new-instance v19, Lcom/behance/sdk/dto/search/BehanceSDKUserDetailsSectionDTO;

    invoke-direct/range {v19 .. v19}, Lcom/behance/sdk/dto/search/BehanceSDKUserDetailsSectionDTO;-><init>()V

    .line 84
    .local v19, "sectionDTO":Lcom/behance/sdk/dto/search/BehanceSDKUserDetailsSectionDTO;
    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKUserDetailsSectionDTO;->setTitle(Ljava/lang/String;)V

    .line 85
    invoke-virtual/range {v19 .. v20}, Lcom/behance/sdk/dto/search/BehanceSDKUserDetailsSectionDTO;->setDescription(Ljava/lang/String;)V

    .line 86
    move-object/from16 v0, v19

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->addDetailsSection(Lcom/behance/sdk/dto/search/BehanceSDKUserDetailsSectionDTO;)V
    :try_end_149
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_149} :catch_14a

    goto :goto_11f

    .line 153
    .end local v4    # "behanceUserDTO":Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;
    .end local v17    # "linksJSONArray":Lorg/json/JSONArray;
    .end local v19    # "sectionDTO":Lcom/behance/sdk/dto/search/BehanceSDKUserDetailsSectionDTO;
    .end local v20    # "sectionDescription":Ljava/lang/String;
    .end local v21    # "sectionKeysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v22    # "sectionsJSONObject":Lorg/json/JSONObject;
    .end local v23    # "sectionsTitle":Ljava/lang/String;
    :catch_14a
    move-exception v7

    .line 154
    .local v7, "e":Lorg/json/JSONException;
    sget-object v26, Lcom/behance/sdk/dto/parser/BehanceUserDTOParser;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v27, "Problem parsing User JSON"

    const/16 v28, 0x0

    move/from16 v0, v28

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v28, v0

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    move-object/from16 v2, v28

    invoke-interface {v0, v7, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 155
    throw v7

    .line 92
    .end local v7    # "e":Lorg/json/JSONException;
    .restart local v4    # "behanceUserDTO":Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;
    .restart local v17    # "linksJSONArray":Lorg/json/JSONArray;
    .restart local v22    # "sectionsJSONObject":Lorg/json/JSONObject;
    :cond_161
    :try_start_161
    const-string v26, "is_following"

    const/16 v27, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v6

    .line 93
    .local v6, "currentUserFollowingValue":I
    const/16 v26, 0x1

    move/from16 v0, v26

    if-ne v6, v0, :cond_246

    .line 94
    const/16 v26, 0x1

    move/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setCurrentUserFollowing(Z)V

    .line 100
    :goto_17c
    const-string v26, "stats"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v24

    .line 101
    .local v24, "statsJSONObject":Lorg/json/JSONObject;
    if-eqz v24, :cond_1d3

    .line 102
    const-string v26, "following"

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setFollowingCount(I)V

    .line 103
    const-string v26, "followers"

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setFollowersCount(I)V

    .line 104
    const-string v26, "appreciations"

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setAppreciationsCount(I)V

    .line 105
    const-string v26, "comments"

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setCommentsCount(I)V

    .line 106
    const-string v26, "views"

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v26

    move/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setViewsCount(I)V

    .line 110
    :cond_1d3
    const-string v26, "images"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v14

    .line 111
    .local v14, "imagesJSONObject":Lorg/json/JSONObject;
    if-eqz v14, :cond_223

    .line 112
    const/16 v26, 0x32

    const-string v27, "50"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    move/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v4, v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->addImage(ILjava/lang/String;)V

    .line 113
    const/16 v26, 0x73

    const-string v27, "115"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    move/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v4, v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->addImage(ILjava/lang/String;)V

    .line 114
    const/16 v26, 0x8a

    const-string v27, "138"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    move/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v4, v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->addImage(ILjava/lang/String;)V

    .line 115
    const/16 v26, 0x114

    const-string v27, "276"

    move-object/from16 v0, v27

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    move/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v4, v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->addImage(ILjava/lang/String;)V

    .line 119
    :cond_223
    const-string v26, "fields"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v18

    .line 120
    .local v18, "ownerFields":Lorg/json/JSONArray;
    if-eqz v18, :cond_24f

    .line 121
    const/4 v5, 0x0

    .local v5, "counter":I
    :goto_230
    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONArray;->length()I

    move-result v26

    move/from16 v0, v26

    if-ge v5, v0, :cond_24f

    .line 122
    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->addField(Ljava/lang/String;)V

    .line 121
    add-int/lit8 v5, v5, 0x1

    goto :goto_230

    .line 96
    .end local v5    # "counter":I
    .end local v14    # "imagesJSONObject":Lorg/json/JSONObject;
    .end local v18    # "ownerFields":Lorg/json/JSONArray;
    .end local v24    # "statsJSONObject":Lorg/json/JSONObject;
    :cond_246
    const/16 v26, 0x0

    move/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->setCurrentUserFollowing(Z)V

    goto/16 :goto_17c

    .line 127
    .restart local v14    # "imagesJSONObject":Lorg/json/JSONObject;
    .restart local v18    # "ownerFields":Lorg/json/JSONArray;
    .restart local v24    # "statsJSONObject":Lorg/json/JSONObject;
    :cond_24f
    const-string v26, "features"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    .line 128
    .local v13, "featuresJSONArray":Lorg/json/JSONArray;
    if-eqz v13, :cond_2f1

    .line 129
    const/4 v9, 0x0

    .local v9, "featureCount":I
    :goto_25c
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v26

    move/from16 v0, v26

    if-ge v9, v0, :cond_2f1

    .line 130
    invoke-virtual {v13, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 132
    .local v8, "feature":Lorg/json/JSONObject;
    const-string v26, "site"

    move-object/from16 v0, v26

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    .line 133
    .local v11, "featureSite":Lorg/json/JSONObject;
    if-eqz v11, :cond_2ec

    .line 134
    new-instance v10, Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;

    invoke-direct {v10}, Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;-><init>()V

    .line 135
    .local v10, "featureDTO":Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;
    const-string v26, "domain"

    move-object/from16 v0, v26

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;->setSiteDomain(Ljava/lang/String;)V

    .line 136
    const-string v26, "icon"

    move-object/from16 v0, v26

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;->setSiteIcon(Ljava/lang/String;)V

    .line 137
    const-string v26, "id"

    move-object/from16 v0, v26

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;->setSiteId(Ljava/lang/String;)V

    .line 138
    const-string v26, "key"

    move-object/from16 v0, v26

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;->setSiteKey(Ljava/lang/String;)V

    .line 139
    const-string v26, "name"

    move-object/from16 v0, v26

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;->setSiteName(Ljava/lang/String;)V

    .line 140
    const-string v26, "url"

    move-object/from16 v0, v26

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;->setSiteUrl(Ljava/lang/String;)V

    .line 142
    const-string v26, "ribbon"

    move-object/from16 v0, v26

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    .line 143
    .local v12, "featureSiteRibbon":Lorg/json/JSONObject;
    if-eqz v12, :cond_2e9

    .line 144
    const-string v26, "image"

    move-object/from16 v0, v26

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;->setSiteRibbonImage(Ljava/lang/String;)V

    .line 145
    const-string v26, "image_2x"

    move-object/from16 v0, v26

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v10, v0}, Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;->setSiteRibbonBiggerImage(Ljava/lang/String;)V

    .line 147
    :cond_2e9
    invoke-virtual {v4, v10}, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->addFeaturedDetail(Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;)V
    :try_end_2ec
    .catch Lorg/json/JSONException; {:try_start_161 .. :try_end_2ec} :catch_14a

    .line 129
    .end local v10    # "featureDTO":Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;
    .end local v12    # "featureSiteRibbon":Lorg/json/JSONObject;
    :cond_2ec
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_25c

    .line 157
    .end local v4    # "behanceUserDTO":Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;
    .end local v6    # "currentUserFollowingValue":I
    .end local v8    # "feature":Lorg/json/JSONObject;
    .end local v9    # "featureCount":I
    .end local v11    # "featureSite":Lorg/json/JSONObject;
    .end local v13    # "featuresJSONArray":Lorg/json/JSONArray;
    .end local v14    # "imagesJSONObject":Lorg/json/JSONObject;
    .end local v17    # "linksJSONArray":Lorg/json/JSONArray;
    .end local v18    # "ownerFields":Lorg/json/JSONArray;
    .end local v22    # "sectionsJSONObject":Lorg/json/JSONObject;
    .end local v24    # "statsJSONObject":Lorg/json/JSONObject;
    :cond_2f0
    const/4 v4, 0x0

    :cond_2f1
    return-object v4
.end method
