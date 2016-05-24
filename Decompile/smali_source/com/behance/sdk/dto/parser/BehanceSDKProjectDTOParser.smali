.class public Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;
.super Ljava/lang/Object;
.source "BehanceSDKProjectDTOParser.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private isProjectPublic(Lorg/json/JSONObject;)Z
    .registers 4
    .param p1, "projectJsonObject"    # Lorg/json/JSONObject;

    .prologue
    .line 110
    const-string v1, "privacy"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 111
    .local v0, "projectPrivacy":Ljava/lang/String;
    const-string v1, "public"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 112
    const/4 v1, 0x1

    .line 114
    :goto_f
    return v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method private parseProjects(Lorg/json/JSONArray;Z)Ljava/util/List;
    .registers 10
    .param p1, "projectsArray"    # Lorg/json/JSONArray;
    .param p2, "includePrivateProjects"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Z)",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/behance/sdk/exception/BehanceSDKProjectParseException;
        }
    .end annotation

    .prologue
    .line 73
    :try_start_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 74
    .local v4, "projects":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v1, v5, :cond_34

    .line 75
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 76
    .local v3, "projectJsonObject":Lorg/json/JSONObject;
    if-eqz v3, :cond_26

    .line 77
    invoke-direct {p0, v3}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;->isProjectPublic(Lorg/json/JSONObject;)Z

    move-result v5

    if-nez v5, :cond_1e

    if-eqz p2, :cond_26

    .line 78
    :cond_1e
    const/4 v5, 0x1

    invoke-direct {p0, v3, v5}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;->populateProjectDetails(Lorg/json/JSONObject;Z)Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;

    move-result-object v2

    .line 79
    .local v2, "projectDTO":Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_26
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_26} :catch_29

    .line 74
    .end local v2    # "projectDTO":Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;
    :cond_26
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 84
    .end local v1    # "i":I
    .end local v3    # "projectJsonObject":Lorg/json/JSONObject;
    .end local v4    # "projects":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;>;"
    :catch_29
    move-exception v0

    .line 85
    .local v0, "e":Lorg/json/JSONException;
    new-instance v5, Lcom/behance/sdk/exception/BehanceSDKProjectParseException;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Lcom/behance/sdk/exception/BehanceSDKProjectParseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 83
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "i":I
    .restart local v4    # "projects":Ljava/util/List;, "Ljava/util/List<Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;>;"
    :cond_34
    return-object v4
.end method

.method private populateProjectCopyright(Lorg/json/JSONObject;Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;)V
    .registers 5
    .param p1, "copyrightJSONObject"    # Lorg/json/JSONObject;
    .param p2, "projectDTOObject"    # Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 240
    if-eqz p1, :cond_1c

    .line 241
    new-instance v0, Lcom/behance/sdk/dto/search/BehanceSDKProjectCopyrightDTO;

    invoke-direct {v0}, Lcom/behance/sdk/dto/search/BehanceSDKProjectCopyrightDTO;-><init>()V

    .line 242
    .local v0, "copyrightDTO":Lcom/behance/sdk/dto/search/BehanceSDKProjectCopyrightDTO;
    const-string v1, "license"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKProjectCopyrightDTO;->setLicenseType(Ljava/lang/String;)V

    .line 243
    const-string v1, "description"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKProjectCopyrightDTO;->setLicenseDescription(Ljava/lang/String;)V

    .line 244
    invoke-virtual {p2, v0}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setCopyright(Lcom/behance/sdk/dto/search/BehanceSDKProjectCopyrightDTO;)V

    .line 246
    .end local v0    # "copyrightDTO":Lcom/behance/sdk/dto/search/BehanceSDKProjectCopyrightDTO;
    :cond_1c
    return-void
.end method

.method private populateProjectCovers(Lorg/json/JSONObject;Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;)V
    .registers 9
    .param p1, "coversJSON"    # Lorg/json/JSONObject;
    .param p2, "projectDTOObject"    # Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x194

    const/16 v4, 0xe6

    const/16 v3, 0xca

    const/16 v2, 0x73

    .line 201
    if-eqz p1, :cond_3e

    .line 202
    new-instance v0, Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;

    invoke-direct {v0}, Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;-><init>()V

    .line 203
    .local v0, "covers":Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;->addCoverImages(ILjava/lang/String;)V

    .line 204
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;->addCoverImages(ILjava/lang/String;)V

    .line 205
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v4, v1}, Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;->addCoverImages(ILjava/lang/String;)V

    .line 206
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v5, v1}, Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;->addCoverImages(ILjava/lang/String;)V

    .line 207
    invoke-virtual {p2, v0}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setCovers(Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;)V

    .line 209
    .end local v0    # "covers":Lcom/behance/sdk/dto/search/BehanceSDKProjectCoversDTO;
    :cond_3e
    return-void
.end method

.method private populateProjectDetails(Lorg/json/JSONObject;Z)Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;
    .registers 9
    .param p1, "projectJsonObject"    # Lorg/json/JSONObject;
    .param p2, "parseFullProjectDetails"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 119
    if-eqz p1, :cond_d6

    .line 120
    new-instance v1, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;

    invoke-direct {v1}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;-><init>()V

    .line 121
    .local v1, "projectDTOObject":Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;
    const-string v4, "id"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setId(Ljava/lang/String;)V

    .line 122
    const-string v4, "name"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setName(Ljava/lang/String;)V

    .line 123
    const-string v4, "published_on"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setPublishedDate(J)V

    .line 124
    const-string v4, "created_on"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setCreatedDate(J)V

    .line 125
    const-string v4, "modified_on"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setModifiedDate(J)V

    .line 126
    const-string v4, "url"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setUrl(Ljava/lang/String;)V

    .line 127
    const-string v4, "privacy"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setPrivacy(Ljava/lang/String;)V

    .line 128
    const-string v4, "covers"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-direct {p0, v4, v1}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;->populateProjectCovers(Lorg/json/JSONObject;Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;)V

    .line 129
    const-string v4, "stats"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-direct {p0, v4, v1}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;->populateProjectStats(Lorg/json/JSONObject;Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;)V

    .line 130
    const-string v4, "owners"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-direct {p0, v4, v1}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;->populateProjectOwners(Lorg/json/JSONArray;Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;)V

    .line 131
    invoke-direct {p0, v1, p1}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;->populateProjectFields(Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;Lorg/json/JSONObject;)V

    .line 132
    if-eqz p2, :cond_d5

    .line 133
    const-string v4, "mature_access"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setMatureAccess(Ljava/lang/String;)V

    .line 134
    const-string v4, "mature_content"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    .line 135
    .local v0, "matureContent":I
    if-nez v0, :cond_b8

    const/4 v4, 0x0

    :goto_78
    invoke-virtual {v1, v4}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setMatureContent(Z)V

    .line 136
    const-string v4, "description"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setDescription(Ljava/lang/String;)V

    .line 137
    const-string v4, "custom_css"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setCustomCSS(Ljava/lang/String;)V

    .line 138
    const-string v4, "short_url"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setShortUrl(Ljava/lang/String;)V

    .line 139
    const-string v4, "html"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setHTML(Ljava/lang/String;)V

    .line 141
    const-string v4, "tags"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 142
    .local v2, "projectTags":Lorg/json/JSONArray;
    if-eqz v2, :cond_ba

    .line 143
    const/4 v3, 0x0

    .local v3, "tagsCount":I
    :goto_a8
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_ba

    .line 144
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->addTag(Ljava/lang/String;)V

    .line 143
    add-int/lit8 v3, v3, 0x1

    goto :goto_a8

    .line 135
    .end local v2    # "projectTags":Lorg/json/JSONArray;
    .end local v3    # "tagsCount":I
    :cond_b8
    const/4 v4, 0x1

    goto :goto_78

    .line 148
    .restart local v2    # "projectTags":Lorg/json/JSONArray;
    :cond_ba
    const-string v4, "modules"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-direct {p0, v4, v1}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;->populateProjectModules(Lorg/json/JSONArray;Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;)V

    .line 149
    const-string v4, "features"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-direct {p0, v4, v1}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;->populateProjectFeaturedDetails(Lorg/json/JSONArray;Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;)V

    .line 150
    const-string v4, "copyright"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-direct {p0, v4, v1}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;->populateProjectCopyright(Lorg/json/JSONObject;Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;)V

    .line 154
    .end local v0    # "matureContent":I
    .end local v1    # "projectDTOObject":Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;
    .end local v2    # "projectTags":Lorg/json/JSONArray;
    :cond_d5
    :goto_d5
    return-object v1

    :cond_d6
    const/4 v1, 0x0

    goto :goto_d5
.end method

.method private populateProjectFeaturedDetails(Lorg/json/JSONArray;Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;)V
    .registers 11
    .param p1, "projectFeatures"    # Lorg/json/JSONArray;
    .param p2, "projectDTOObject"    # Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 212
    if-eqz p1, :cond_8c

    .line 213
    const/4 v1, 0x0

    .local v1, "featureCount":I
    :goto_3
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v1, v5, :cond_8c

    .line 214
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 215
    .local v0, "feature":Lorg/json/JSONObject;
    new-instance v2, Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;

    invoke-direct {v2}, Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;-><init>()V

    .line 216
    .local v2, "featureDTO":Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;
    const-string v5, "featured_on"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v6

    invoke-virtual {v2, v6, v7}, Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;->setFeaturedDate(J)V

    .line 217
    const-string v5, "url"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;->setProjectUrl(Ljava/lang/String;)V

    .line 219
    const-string v5, "site"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 220
    .local v3, "featureSite":Lorg/json/JSONObject;
    if-eqz v3, :cond_88

    .line 221
    const-string v5, "domain"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;->setSiteDomain(Ljava/lang/String;)V

    .line 222
    const-string v5, "icon"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;->setSiteIcon(Ljava/lang/String;)V

    .line 223
    const-string v5, "id"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;->setSiteId(Ljava/lang/String;)V

    .line 224
    const-string v5, "key"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;->setSiteKey(Ljava/lang/String;)V

    .line 225
    const-string v5, "name"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;->setSiteName(Ljava/lang/String;)V

    .line 226
    const-string v5, "url"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;->setSiteUrl(Ljava/lang/String;)V

    .line 227
    const-string v5, "network_id"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;->setNetworkId(Ljava/lang/String;)V

    .line 228
    const-string v5, "ribbon"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 229
    .local v4, "featureSiteRibbon":Lorg/json/JSONObject;
    if-eqz v4, :cond_85

    .line 230
    const-string v5, "image"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;->setSiteRibbonImage(Ljava/lang/String;)V

    .line 231
    const-string v5, "image_2x"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;->setSiteRibbonBiggerImage(Ljava/lang/String;)V

    .line 233
    :cond_85
    invoke-virtual {p2, v2}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->addFeature(Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;)V

    .line 213
    .end local v4    # "featureSiteRibbon":Lorg/json/JSONObject;
    :cond_88
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_3

    .line 237
    .end local v0    # "feature":Lorg/json/JSONObject;
    .end local v1    # "featureCount":I
    .end local v2    # "featureDTO":Lcom/behance/sdk/dto/search/BehanceSDKProjectFeaturedDTO;
    .end local v3    # "featureSite":Lorg/json/JSONObject;
    :cond_8c
    return-void
.end method

.method private populateProjectFields(Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;Lorg/json/JSONObject;)V
    .registers 8
    .param p1, "projectDTOObject"    # Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;
    .param p2, "project"    # Lorg/json/JSONObject;

    .prologue
    .line 158
    const-string v4, "fields"

    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 159
    .local v1, "fields":Lorg/json/JSONArray;
    if-eqz v1, :cond_25

    .line 160
    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 161
    .local v2, "fieldsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_12
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_22

    .line 162
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v0

    .line 163
    .local v0, "field":Ljava/lang/String;
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    .line 165
    .end local v0    # "field":Ljava/lang/String;
    :cond_22
    invoke-virtual {p1, v2}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setFields(Ljava/util/List;)V

    .line 167
    .end local v2    # "fieldsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "j":I
    :cond_25
    return-void
.end method

.method private populateProjectModules(Lorg/json/JSONArray;Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;)V
    .registers 7
    .param p1, "modulesJSON"    # Lorg/json/JSONArray;
    .param p2, "projectDTOObject"    # Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 170
    if-eqz p1, :cond_19

    .line 171
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_19

    .line 172
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 173
    .local v1, "module":Lorg/json/JSONObject;
    invoke-static {v1}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectModuleFactory;->getProjectModuleInstance(Lorg/json/JSONObject;)Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;

    move-result-object v2

    .line 174
    .local v2, "projectModuleInstance":Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;
    if-eqz v2, :cond_16

    .line 175
    invoke-virtual {p2, v2}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->addModule(Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;)V

    .line 171
    :cond_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 178
    .end local v0    # "i":I
    .end local v1    # "module":Lorg/json/JSONObject;
    .end local v2    # "projectModuleInstance":Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;
    :cond_19
    return-void
.end method

.method private populateProjectOwners(Lorg/json/JSONArray;Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;)V
    .registers 7
    .param p1, "ownerArray"    # Lorg/json/JSONArray;
    .param p2, "projectDTOObject"    # Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 191
    if-eqz p1, :cond_1c

    .line 192
    new-instance v2, Lcom/behance/sdk/dto/parser/BehanceUserDTOParser;

    invoke-direct {v2}, Lcom/behance/sdk/dto/parser/BehanceUserDTOParser;-><init>()V

    .line 193
    .local v2, "userParser":Lcom/behance/sdk/dto/parser/BehanceUserDTOParser;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_1c

    .line 194
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 195
    .local v1, "userJsonObject":Lorg/json/JSONObject;
    invoke-virtual {v2, v1}, Lcom/behance/sdk/dto/parser/BehanceUserDTOParser;->parse(Lorg/json/JSONObject;)Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;

    move-result-object v3

    invoke-virtual {p2, v3}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->addOwner(Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;)V

    .line 193
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 198
    .end local v0    # "i":I
    .end local v1    # "userJsonObject":Lorg/json/JSONObject;
    .end local v2    # "userParser":Lcom/behance/sdk/dto/parser/BehanceUserDTOParser;
    :cond_1c
    return-void
.end method

.method private populateProjectStats(Lorg/json/JSONObject;Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;)V
    .registers 5
    .param p1, "statsJSON"    # Lorg/json/JSONObject;
    .param p2, "projectDTOObject"    # Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 181
    if-eqz p1, :cond_25

    .line 182
    new-instance v0, Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;

    invoke-direct {v0}, Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;-><init>()V

    .line 183
    .local v0, "stats":Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;
    const-string v1, "appreciations"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;->setAppreciationsCount(I)V

    .line 184
    const-string v1, "views"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;->setViewsCount(I)V

    .line 185
    const-string v1, "comments"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;->setCommentsCount(I)V

    .line 186
    invoke-virtual {p2, v0}, Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;->setStats(Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;)V

    .line 188
    .end local v0    # "stats":Lcom/behance/sdk/dto/search/BehanceSDKProjectStatsDTO;
    :cond_25
    return-void
.end method


# virtual methods
.method public parseProjects(Ljava/lang/String;)Ljava/util/List;
    .registers 7
    .param p1, "projectsJSON"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/search/BehanceSDKProjectDTO;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/behance/sdk/exception/BehanceSDKProjectParseException;
        }
    .end annotation

    .prologue
    .line 63
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 64
    .local v1, "jsonObject":Lorg/json/JSONObject;
    const-string v3, "projects"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 65
    .local v2, "projectsArray":Lorg/json/JSONArray;
    const/4 v3, 0x1

    invoke-direct {p0, v2, v3}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectDTOParser;->parseProjects(Lorg/json/JSONArray;Z)Ljava/util/List;
    :try_end_f
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_f} :catch_11

    move-result-object v3

    return-object v3

    .line 66
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    .end local v2    # "projectsArray":Lorg/json/JSONArray;
    :catch_11
    move-exception v0

    .line 67
    .local v0, "e":Lorg/json/JSONException;
    new-instance v3, Lcom/behance/sdk/exception/BehanceSDKProjectParseException;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lcom/behance/sdk/exception/BehanceSDKProjectParseException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method
