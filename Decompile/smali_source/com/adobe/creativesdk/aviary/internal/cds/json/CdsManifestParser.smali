.class public Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;
.super Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;
.source "CdsManifestParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;
    }
.end annotation


# instance fields
.field private assetsBaseURL:Ljava/lang/String;

.field final deletedPacks:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;",
            ">;>;"
        }
    .end annotation
.end field

.field final enabledMessages:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;",
            ">;>;"
        }
    .end annotation
.end field

.field final enabledMessagesNames:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final enabledPacks:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;",
            ">;>;"
        }
    .end annotation
.end field

.field final enabledPacksNames:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private formatListId:Ljava/lang/String;

.field private mHasContent:Z

.field final permissions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private versionKey:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsJsonParser;-><init>()V

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->enabledPacks:Ljava/util/HashMap;

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->deletedPacks:Ljava/util/HashMap;

    .line 59
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->enabledPacksNames:Ljava/util/HashMap;

    .line 60
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->enabledMessages:Ljava/util/HashMap;

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->enabledMessagesNames:Ljava/util/HashMap;

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->permissions:Ljava/util/List;

    .line 63
    return-void
.end method

.method private parsePackArray(Lorg/json/JSONArray;Ljava/util/List;Ljava/util/HashMap;Z)V
    .registers 10
    .param p1, "array"    # Lorg/json/JSONArray;
    .param p4, "versionKeyRequired"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 250
    .local p2, "target":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    .local p3, "targetHash":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Boolean;>;"
    if-eqz p1, :cond_26

    .line 251
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_26

    .line 252
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 253
    .local v1, "item":Lorg/json/JSONObject;
    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;

    invoke-direct {v2, v1, p4}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;-><init>(Lorg/json/JSONObject;Z)V

    .line 254
    .local v2, "packItem":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    if-eqz p3, :cond_23

    .line 257
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {p3, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 261
    .end local v0    # "i":I
    .end local v1    # "item":Lorg/json/JSONObject;
    .end local v2    # "packItem":Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;
    :cond_26
    return-void
.end method

.method private parsePackArray(Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/List;Ljava/util/HashMap;Z)V
    .registers 7
    .param p1, "object"    # Lorg/json/JSONObject;
    .param p2, "type"    # Ljava/lang/String;
    .param p5, "versionKeyRequired"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;Z)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 241
    .local p3, "target":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    .local p4, "targetHash":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Boolean;>;"
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 242
    .local v0, "array":Lorg/json/JSONArray;
    invoke-direct {p0, v0, p3, p4, p5}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->parsePackArray(Lorg/json/JSONArray;Ljava/util/List;Ljava/util/HashMap;Z)V

    .line 243
    return-void
.end method


# virtual methods
.method public containsEnabledPack(Ljava/lang/String;)Z
    .registers 3
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->enabledPacksNames:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsMessage(Ljava/lang/String;)Z
    .registers 3
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->enabledMessagesNames:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public getAssetsBaseURL()Ljava/lang/String;
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->assetsBaseURL:Ljava/lang/String;

    return-object v0
.end method

.method public getDeletedPacks()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 131
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 133
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    const-string v2, "effects"

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getDeletedPacks(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 134
    .local v1, "newlist":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    if-eqz v1, :cond_10

    .line 135
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 138
    :cond_10
    const-string v2, "frames"

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getDeletedPacks(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 139
    if-eqz v1, :cond_1b

    .line 140
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 143
    :cond_1b
    const-string v2, "stickers"

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getDeletedPacks(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 144
    if-eqz v1, :cond_26

    .line 145
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 148
    :cond_26
    const-string v2, "overlays"

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->getDeletedPacks(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 149
    if-eqz v1, :cond_31

    .line 150
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 153
    :cond_31
    return-object v0
.end method

.method public getDeletedPacks(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 106
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->deletedPacks:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getEnabledPacks()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->enabledPacks:Ljava/util/HashMap;

    return-object v0
.end method

.method public getFormatListId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->formatListId:Ljava/lang/String;

    return-object v0
.end method

.method public getMessages()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 114
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->enabledMessages:Ljava/util/HashMap;

    return-object v0
.end method

.method public getPermissions()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 122
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->permissions:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 123
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->permissions:Ljava/util/List;

    return-object v0
.end method

.method public getPermissionsKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->permissions:Ljava/util/List;

    invoke-static {v0}, Lcom/adobe/creativesdk/aviary/internal/utils/StringUtils;->hashCode(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVersionKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->versionKey:Ljava/lang/String;

    return-object v0
.end method

.method public hasContent()Z
    .registers 2

    .prologue
    .line 98
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->mHasContent:Z

    return v0
.end method

.method public hasDeletedPacks()Z
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->deletedPacks:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public hasEnabledPacks()Z
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->enabledPacks:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public hasMessages()Z
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->enabledMessages:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected onParseJson(Lorg/json/JSONObject;)V
    .registers 7
    .param p1, "json"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 158
    const-string v4, "assetsBaseURL"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->assetsBaseURL:Ljava/lang/String;

    .line 159
    const-string v4, "versionKey"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->versionKey:Ljava/lang/String;

    .line 160
    const-string v4, "formatListId"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->formatListId:Ljava/lang/String;

    .line 162
    const-string v4, "packs"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 163
    .local v2, "object":Lorg/json/JSONObject;
    if-eqz v2, :cond_78

    const/4 v4, 0x1

    :goto_21
    iput-boolean v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->mHasContent:Z

    .line 166
    if-eqz v2, :cond_59

    .line 167
    const-string v4, "effects"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 168
    .local v3, "packEntry":Lorg/json/JSONObject;
    if-eqz v3, :cond_32

    .line 169
    const-string v4, "effects"

    invoke-virtual {p0, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->onParsePackEntry(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 172
    :cond_32
    const-string v4, "frames"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 173
    if-eqz v3, :cond_3f

    .line 174
    const-string v4, "frames"

    invoke-virtual {p0, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->onParsePackEntry(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 177
    :cond_3f
    const-string v4, "stickers"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 178
    if-eqz v3, :cond_4c

    .line 179
    const-string v4, "stickers"

    invoke-virtual {p0, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->onParsePackEntry(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 182
    :cond_4c
    const-string v4, "overlays"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 183
    if-eqz v3, :cond_59

    .line 184
    const-string v4, "overlays"

    invoke-virtual {p0, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->onParsePackEntry(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 189
    .end local v3    # "packEntry":Lorg/json/JSONObject;
    :cond_59
    const-string v4, "messages"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 192
    if-eqz v2, :cond_6c

    .line 193
    const-string v4, "launch"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 194
    .local v1, "messageEntry":Lorg/json/JSONObject;
    const-string v4, "launch"

    invoke-virtual {p0, v1, v4}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->onParseMessageEntry(Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 198
    .end local v1    # "messageEntry":Lorg/json/JSONObject;
    :cond_6c
    const-string v4, "permissions"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 199
    .local v0, "array":Lorg/json/JSONArray;
    if-eqz v0, :cond_77

    .line 200
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->onParsePermissions(Lorg/json/JSONArray;)V

    .line 202
    :cond_77
    return-void

    .line 163
    .end local v0    # "array":Lorg/json/JSONArray;
    :cond_78
    const/4 v4, 0x0

    goto :goto_21
.end method

.method protected onParseMessageEntry(Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 9
    .param p1, "object"    # Lorg/json/JSONObject;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 215
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 216
    .local v3, "listEnabled":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    const-string v2, "enabled"

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->enabledMessagesNames:Ljava/util/HashMap;

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->parsePackArray(Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/List;Ljava/util/HashMap;Z)V

    .line 217
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1a

    .line 218
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->enabledMessages:Ljava/util/HashMap;

    invoke-virtual {v0, p2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    :cond_1a
    return-void
.end method

.method protected onParsePackEntry(Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 13
    .param p1, "object"    # Lorg/json/JSONObject;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 223
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 224
    .local v3, "listEnabled":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    const-string v2, "enabled"

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->enabledPacksNames:Ljava/util/HashMap;

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->parsePackArray(Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/List;Ljava/util/HashMap;Z)V

    .line 225
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1a

    .line 226
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->enabledPacks:Ljava/util/HashMap;

    invoke-virtual {v0, p2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    :cond_1a
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 230
    .local v7, "listDeleted":Ljava/util/List;, "Ljava/util/List<Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser$ManifestPackItem;>;"
    const-string v6, "deleted"

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v4, p0

    move-object v5, p1

    invoke-direct/range {v4 .. v9}, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->parsePackArray(Lorg/json/JSONObject;Ljava/lang/String;Ljava/util/List;Ljava/util/HashMap;Z)V

    .line 231
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_33

    .line 232
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->deletedPacks:Ljava/util/HashMap;

    invoke-virtual {v0, p2, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    :cond_33
    return-void
.end method

.method protected onParsePermissions(Lorg/json/JSONArray;)V
    .registers 6
    .param p1, "array"    # Lorg/json/JSONArray;

    .prologue
    .line 205
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_18

    .line 207
    :try_start_7
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/cds/json/CdsManifestParser;->permissions:Ljava/util/List;

    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_10
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_10} :catch_13

    .line 205
    :goto_10
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 208
    :catch_13
    move-exception v0

    .line 209
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_10

    .line 212
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_18
    return-void
.end method
