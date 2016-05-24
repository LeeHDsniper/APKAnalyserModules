.class public Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;
.super Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;
.source "CdsContentParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;
    }
.end annotation


# instance fields
.field author:Ljava/lang/String;

.field authorHyperlink:Ljava/lang/String;

.field contentURL:Ljava/lang/String;

.field contentVersion:Ljava/lang/String;

.field detailImageURL:Ljava/lang/String;

.field detailImageVersion:Ljava/lang/String;

.field displayDescription:Ljava/lang/String;

.field displayName:Ljava/lang/String;

.field featureImageURL:Ljava/lang/String;

.field featureImageVersion:Ljava/lang/String;

.field free:Z

.field freeWithLogin:Z

.field iconURL:Ljava/lang/String;

.field iconVersion:Ljava/lang/String;

.field identifier:Ljava/lang/String;

.field mItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;",
            ">;"
        }
    .end annotation
.end field

.field packType:Ljava/lang/String;

.field previewURL:Ljava/lang/String;

.field previewVersion:Ljava/lang/String;

.field shopBackgroundColor:Ljava/lang/String;

.field socialMediaString:Ljava/lang/String;

.field versionKey:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 77
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;-><init>()V

    .line 78
    return-void
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->author:Ljava/lang/String;

    return-object v0
.end method

.method public getAuthorHyperlink()Ljava/lang/String;
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->authorHyperlink:Ljava/lang/String;

    return-object v0
.end method

.method public getContentURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->contentURL:Ljava/lang/String;

    return-object v0
.end method

.method public getContentVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->contentVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getDetailImageURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->detailImageURL:Ljava/lang/String;

    return-object v0
.end method

.method public getDetailImageVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->detailImageVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->displayDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getFeatureImageURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->featureImageURL:Ljava/lang/String;

    return-object v0
.end method

.method public getFeatureImageVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 157
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->featureImageVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getIconURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->iconURL:Ljava/lang/String;

    return-object v0
.end method

.method public getIconVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->iconVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public getItems()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->mItems:Ljava/util/List;

    return-object v0
.end method

.method public getPackType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->packType:Ljava/lang/String;

    return-object v0
.end method

.method public getPreviewURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->previewURL:Ljava/lang/String;

    return-object v0
.end method

.method public getPreviewVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->previewVersion:Ljava/lang/String;

    return-object v0
.end method

.method public getShopBackgroundColor()Ljava/lang/String;
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->shopBackgroundColor:Ljava/lang/String;

    return-object v0
.end method

.method public getSocialMediaString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 145
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->socialMediaString:Ljava/lang/String;

    return-object v0
.end method

.method public getVersionKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->versionKey:Ljava/lang/String;

    return-object v0
.end method

.method public isFree()Z
    .registers 2

    .prologue
    .line 129
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->free:Z

    return v0
.end method

.method public isFreeWithLogin()Z
    .registers 2

    .prologue
    .line 133
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->freeWithLogin:Z

    return v0
.end method

.method protected onParseJson(Lorg/json/JSONObject;)V
    .registers 9
    .param p1, "json"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 170
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->mItems:Ljava/util/List;

    .line 172
    const-string v4, "identifier"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->identifier:Ljava/lang/String;

    .line 173
    const-string v4, "versionKey"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->versionKey:Ljava/lang/String;

    .line 174
    const-string v4, "packType"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->packType:Ljava/lang/String;

    .line 175
    const-string v4, "displayName"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->displayName:Ljava/lang/String;

    .line 176
    const-string v4, "displayDescription"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->displayDescription:Ljava/lang/String;

    .line 177
    const-string v4, "icon"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->iconURL:Ljava/lang/String;

    .line 178
    const-string v4, "iconVersion"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->iconVersion:Ljava/lang/String;

    .line 179
    const-string v4, "previewURL"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->previewURL:Ljava/lang/String;

    .line 180
    const-string v4, "previewVersion"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->previewVersion:Ljava/lang/String;

    .line 181
    const-string v4, "contentURL"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->contentURL:Ljava/lang/String;

    .line 182
    const-string v4, "contentVersion"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->contentVersion:Ljava/lang/String;

    .line 183
    const-string v4, "isFree"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->free:Z

    .line 184
    const-string v4, "isFreeWithLogin"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v4

    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->freeWithLogin:Z

    .line 185
    const-string v4, "author"

    const-string v5, ""

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->author:Ljava/lang/String;

    .line 186
    const-string v4, "authorHyperlink"

    const-string v5, ""

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->authorHyperlink:Ljava/lang/String;

    .line 187
    const-string v4, "socialMediaString"

    const-string v5, ""

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->socialMediaString:Ljava/lang/String;

    .line 188
    const-string v4, "shopBackgroundColor"

    const-string v5, ""

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->shopBackgroundColor:Ljava/lang/String;

    .line 189
    const-string v4, "featureImageURL"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->featureImageURL:Ljava/lang/String;

    .line 190
    const-string v4, "featureImageVersion"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->featureImageVersion:Ljava/lang/String;

    .line 191
    const-string v4, "detailImageURL"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->detailImageURL:Ljava/lang/String;

    .line 192
    const-string v4, "detailImageVersion"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->detailImageVersion:Ljava/lang/String;

    .line 194
    iget-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->freeWithLogin:Z

    if-eqz v4, :cond_e7

    .line 195
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->displayName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->packType:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ") is free with AdobeID"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    :cond_e7
    const-string v4, "items"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 199
    .local v0, "array":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_ee
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_104

    .line 200
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 201
    .local v1, "arrayItem":Lorg/json/JSONObject;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;->create(Lorg/json/JSONObject;)Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;

    move-result-object v2

    .line 202
    .local v2, "contentItem":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->mItems:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 199
    add-int/lit8 v3, v3, 0x1

    goto :goto_ee

    .line 204
    .end local v1    # "arrayItem":Lorg/json/JSONObject;
    .end local v2    # "contentItem":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser$ContentItem;
    :cond_104
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 208
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ContentParser:\n"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 209
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v1, "  identifier: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->identifier:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    const-string v1, "  versionKey: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->versionKey:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    const-string v1, "  packType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->packType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    const-string v1, "  displayName: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->displayName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    const-string v1, "  displayDescription: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->displayDescription:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    const-string v1, "  iconURL: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->iconURL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", iconVersion: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->iconVersion:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    const-string v1, "  previewURL: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->previewURL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", previewVersion: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->previewVersion:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    const-string v1, "  contentURL: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->contentURL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", contentVersion: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->contentVersion:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    const-string v1, "  isFree: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->free:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    const-string v1, "  isFreeWithLogin: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->freeWithLogin:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    const-string v1, "  items: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->mItems:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    const-string v1, "    author: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->author:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    const-string v1, "    authorHyperlink: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->authorHyperlink:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    const-string v1, "    socialMediaString: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->socialMediaString:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    const-string v1, "    shopBackgroundColor: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->shopBackgroundColor:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    const-string v1, "    featureImageURL: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->featureImageURL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    const-string v1, "    featureImageVersion: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->featureImageVersion:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    const-string v1, "    detailImageURL: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->detailImageURL:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    const-string v1, "    detailImageVersion: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsContentParser;->detailImageVersion:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
