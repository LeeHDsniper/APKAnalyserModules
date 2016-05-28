.class public Lcom/behance/sdk/dto/parser/BehanceSDKProjectModuleFactory;
.super Ljava/lang/Object;
.source "BehanceSDKProjectModuleFactory.java"


# direct methods
.method private static getAudioModuleInstance(Lorg/json/JSONObject;)Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;
    .registers 3
    .param p0, "module"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 62
    new-instance v0, Lcom/behance/sdk/dto/search/BehanceSDKAudioModuleDTO;

    invoke-direct {v0}, Lcom/behance/sdk/dto/search/BehanceSDKAudioModuleDTO;-><init>()V

    .line 63
    .local v0, "audioModule":Lcom/behance/sdk/dto/search/BehanceSDKAudioModuleDTO;
    const-string v1, "id"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKAudioModuleDTO;->setId(Ljava/lang/String;)V

    .line 64
    const-string v1, "embed"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKAudioModuleDTO;->setEmbedHTML(Ljava/lang/String;)V

    .line 65
    const-string v1, "src"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKAudioModuleDTO;->setSrcURL(Ljava/lang/String;)V

    .line 66
    return-object v0
.end method

.method private static getEmbedModuleInstance(Lorg/json/JSONObject;)Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;
    .registers 3
    .param p0, "module"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 83
    new-instance v0, Lcom/behance/sdk/dto/search/BehanceSDKEmbedModuleDTO;

    invoke-direct {v0}, Lcom/behance/sdk/dto/search/BehanceSDKEmbedModuleDTO;-><init>()V

    .line 84
    .local v0, "moduleDTO1":Lcom/behance/sdk/dto/search/BehanceSDKEmbedModuleDTO;
    const-string v1, "id"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKEmbedModuleDTO;->setId(Ljava/lang/String;)V

    .line 85
    const-string v1, "embed"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKEmbedModuleDTO;->setEmbedHTML(Ljava/lang/String;)V

    .line 86
    return-object v0
.end method

.method private static getImageModuleInstance(Lorg/json/JSONObject;)Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;
    .registers 6
    .param p0, "module"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 90
    new-instance v0, Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;

    invoke-direct {v0}, Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;-><init>()V

    .line 91
    .local v0, "moduleDTO":Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;
    const-string v4, "height"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;->setHeight(I)V

    .line 92
    const-string v4, "id"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;->setId(Ljava/lang/String;)V

    .line 93
    const-string v4, "src"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;->setSrcUrl(Ljava/lang/String;)V

    .line 94
    const-string v4, "full_bleed"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    if-ne v4, v3, :cond_4c

    :goto_29
    invoke-virtual {v0, v3}, Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;->setFullBleed(Z)V

    .line 95
    const-string v3, "width"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;->setWidth(I)V

    .line 96
    const-string v3, "sizes"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 97
    .local v2, "sizesObject":Ljava/lang/Object;
    instance-of v3, v2, Lorg/json/JSONObject;

    if-eqz v3, :cond_4b

    move-object v1, v2

    .line 98
    check-cast v1, Lorg/json/JSONObject;

    .line 99
    .local v1, "moduleSizes":Lorg/json/JSONObject;
    const-string v3, "max_1240"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/behance/sdk/dto/search/BehanceSDKImageModuleDTO;->setHDSrcUrl(Ljava/lang/String;)V

    .line 101
    .end local v1    # "moduleSizes":Lorg/json/JSONObject;
    :cond_4b
    return-object v0

    .line 94
    .end local v2    # "sizesObject":Ljava/lang/Object;
    :cond_4c
    const/4 v3, 0x0

    goto :goto_29
.end method

.method public static getProjectModuleInstance(Lorg/json/JSONObject;)Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;
    .registers 4
    .param p0, "module"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 36
    const-string v1, "type"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->fromString(Ljava/lang/String;)Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;

    move-result-object v0

    .line 37
    .local v0, "moduleType":Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;
    sget-object v1, Lcom/behance/sdk/dto/parser/BehanceSDKProjectModuleFactory$1;->$SwitchMap$com$behance$sdk$enums$BehanceSDKProjectModuleType:[I

    invoke-virtual {v0}, Lcom/behance/sdk/enums/BehanceSDKProjectModuleType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_30

    .line 49
    const/4 v1, 0x0

    :goto_16
    return-object v1

    .line 39
    :pswitch_17
    invoke-static {p0}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectModuleFactory;->getImageModuleInstance(Lorg/json/JSONObject;)Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;

    move-result-object v1

    goto :goto_16

    .line 41
    :pswitch_1c
    invoke-static {p0}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectModuleFactory;->getEmbedModuleInstance(Lorg/json/JSONObject;)Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;

    move-result-object v1

    goto :goto_16

    .line 43
    :pswitch_21
    invoke-static {p0}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectModuleFactory;->getVideoModuleInstance(Lorg/json/JSONObject;)Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;

    move-result-object v1

    goto :goto_16

    .line 45
    :pswitch_26
    invoke-static {p0}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectModuleFactory;->getTextModuleInstance(Lorg/json/JSONObject;)Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;

    move-result-object v1

    goto :goto_16

    .line 47
    :pswitch_2b
    invoke-static {p0}, Lcom/behance/sdk/dto/parser/BehanceSDKProjectModuleFactory;->getAudioModuleInstance(Lorg/json/JSONObject;)Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;

    move-result-object v1

    goto :goto_16

    .line 37
    :pswitch_data_30
    .packed-switch 0x1
        :pswitch_17
        :pswitch_1c
        :pswitch_21
        :pswitch_26
        :pswitch_2b
    .end packed-switch
.end method

.method private static getTextModuleInstance(Lorg/json/JSONObject;)Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;
    .registers 3
    .param p0, "module"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 54
    new-instance v0, Lcom/behance/sdk/dto/search/BehanceSDKTextModuleDTO;

    invoke-direct {v0}, Lcom/behance/sdk/dto/search/BehanceSDKTextModuleDTO;-><init>()V

    .line 55
    .local v0, "moduleDTO3":Lcom/behance/sdk/dto/search/BehanceSDKTextModuleDTO;
    const-string v1, "id"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKTextModuleDTO;->setId(Ljava/lang/String;)V

    .line 56
    const-string v1, "text"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKTextModuleDTO;->setFormattedText(Ljava/lang/String;)V

    .line 57
    const-string v1, "text_plain"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKTextModuleDTO;->setPlainText(Ljava/lang/String;)V

    .line 58
    return-object v0
.end method

.method private static getVideoModuleInstance(Lorg/json/JSONObject;)Lcom/behance/sdk/dto/search/BehanceSDKAbstractProjectModuleDTO;
    .registers 3
    .param p0, "module"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 70
    new-instance v0, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;

    invoke-direct {v0}, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;-><init>()V

    .line 71
    .local v0, "moduleDTO2":Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;
    const-string v1, "id"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->setId(Ljava/lang/String;)V

    .line 72
    const-string v1, "embed"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->setEmbedHTML(Ljava/lang/String;)V

    .line 73
    const-string v1, "height"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->setHeight(I)V

    .line 74
    const-string v1, "width"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->setWidth(I)V

    .line 75
    const-string v1, "image_src"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->setImageSrc(Ljava/lang/String;)V

    .line 76
    const-string v1, "player_skin"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->setPlayerSkin(Ljava/lang/String;)V

    .line 77
    const-string v1, "player"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->setPlayerUrl(Ljava/lang/String;)V

    .line 78
    const-string v1, "src"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/dto/search/BehanceSDKVideoModuleDTO;->setVideoSrc(Ljava/lang/String;)V

    .line 79
    return-object v0
.end method
