.class public Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;
.super Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;
.source "AdobeAssetLibraryItemColorTheme.java"


# instance fields
.field private mood:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

.field private rule:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

.field private swatches:Lorg/json/JSONArray;

.field private tags:Lorg/json/JSONArray;


# direct methods
.method protected constructor <init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Lorg/json/JSONArray;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V
    .registers 8
    .param p1, "node"    # Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;
    .param p2, "tags"    # Lorg/json/JSONArray;
    .param p3, "rule"    # Ljava/lang/String;
    .param p4, "mood"    # Ljava/lang/String;
    .param p5, "swatches"    # Lorg/json/JSONArray;
    .param p6, "library"    # Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;

    .prologue
    .line 77
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p6}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItem;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/storage/dcx/AdobeDCXManifestNode;Ljava/lang/String;Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibrary;)V

    .line 79
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;->tags:Lorg/json/JSONArray;

    .line 80
    iput-object p5, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;->swatches:Lorg/json/JSONArray;

    .line 81
    invoke-static {p3}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;->themeRuleForStringRule(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;->rule:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    .line 82
    invoke-static {p4}, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;->themeMoodForStringMood(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;->mood:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    .line 83
    return-void
.end method

.method private static themeMoodForStringMood(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;
    .registers 2
    .param p0, "mood"    # Ljava/lang/String;

    .prologue
    .line 167
    if-eqz p0, :cond_b

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 169
    :goto_6
    if-nez p0, :cond_d

    .line 171
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodNotSet:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    .line 194
    :goto_a
    return-object v0

    .line 167
    :cond_b
    const/4 p0, 0x0

    goto :goto_6

    .line 173
    :cond_d
    const-string v0, "colorful"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 175
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodColorful:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    goto :goto_a

    .line 177
    :cond_18
    const-string v0, "bright"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 179
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodBright:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    goto :goto_a

    .line 181
    :cond_23
    const-string v0, "muted"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 183
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodMuted:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    goto :goto_a

    .line 185
    :cond_2e
    const-string v0, "dark"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 187
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodDark:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    goto :goto_a

    .line 189
    :cond_39
    const-string v0, "custom"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    .line 191
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodCustom:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    goto :goto_a

    .line 194
    :cond_44
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;->AdobeAssetLibraryColorThemeMoodUnknown:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeMood;

    goto :goto_a
.end method

.method private static themeRuleForStringRule(Ljava/lang/String;)Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;
    .registers 2
    .param p0, "rule"    # Ljava/lang/String;

    .prologue
    .line 135
    if-eqz p0, :cond_b

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 137
    :goto_6
    if-nez p0, :cond_d

    .line 139
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleNotSet:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    .line 162
    :goto_a
    return-object v0

    .line 135
    :cond_b
    const/4 p0, 0x0

    goto :goto_6

    .line 141
    :cond_d
    const-string v0, "analogous"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 143
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleAnalogous:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    goto :goto_a

    .line 145
    :cond_18
    const-string v0, "complimentary"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 147
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleComplimentary:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    goto :goto_a

    .line 149
    :cond_23
    const-string v0, "monochromatic"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 151
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleMonochromatic:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    goto :goto_a

    .line 153
    :cond_2e
    const-string v0, "triad"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 155
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleTriad:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    goto :goto_a

    .line 157
    :cond_39
    const-string v0, "custom"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    .line 159
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleCustom:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    goto :goto_a

    .line 162
    :cond_44
    sget-object v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;->AdobeAssetLibraryColorThemeRuleUnknown:Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryColorThemeRule;

    goto :goto_a
.end method


# virtual methods
.method public getRGBColors()Ljava/util/ArrayList;
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 87
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;->swatches:Lorg/json/JSONArray;

    if-nez v13, :cond_8

    .line 88
    const/4 v3, 0x0

    .line 130
    :cond_7
    return-object v3

    .line 90
    :cond_8
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;->swatches:Lorg/json/JSONArray;

    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v9

    .line 92
    .local v9, "swatchesCount":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 94
    .local v3, "colorArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_16
    if-ge v5, v9, :cond_7

    .line 95
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/adobe/creativesdk/foundation/storage/AdobeAssetLibraryItemColorTheme;->swatches:Lorg/json/JSONArray;

    invoke-virtual {v13, v5}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v8

    .line 96
    .local v8, "swatchObj":Ljava/lang/Object;
    const/4 v6, 0x0

    .line 97
    .local v6, "mainObj":Lorg/json/JSONObject;
    instance-of v13, v8, Lorg/json/JSONArray;

    if-eqz v13, :cond_63

    .line 98
    check-cast v8, Lorg/json/JSONArray;

    .end local v8    # "swatchObj":Ljava/lang/Object;
    const/4 v13, 0x0

    invoke-virtual {v8, v13}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 102
    :cond_2c
    :goto_2c
    if-eqz v6, :cond_60

    .line 103
    const-string v13, "value"

    invoke-virtual {v6, v13}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    .line 104
    .local v12, "valueObj":Ljava/lang/Object;
    if-nez v12, :cond_3c

    .line 105
    const-string v13, "values"

    invoke-virtual {v6, v13}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    .line 107
    :cond_3c
    instance-of v13, v12, Lorg/json/JSONObject;

    if-eqz v13, :cond_6b

    move-object v11, v12

    .line 108
    check-cast v11, Lorg/json/JSONObject;

    .line 109
    .local v11, "valueDict":Lorg/json/JSONObject;
    const-string v13, "r"

    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v7

    .line 110
    .local v7, "r":I
    const-string v13, "g"

    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    .line 111
    .local v4, "g":I
    const-string v13, "b"

    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    .line 112
    .local v2, "b":I
    invoke-static {v7, v4, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v3, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 94
    .end local v2    # "b":I
    .end local v4    # "g":I
    .end local v7    # "r":I
    .end local v11    # "valueDict":Lorg/json/JSONObject;
    .end local v12    # "valueObj":Ljava/lang/Object;
    :cond_60
    :goto_60
    add-int/lit8 v5, v5, 0x1

    goto :goto_16

    .line 99
    .restart local v8    # "swatchObj":Ljava/lang/Object;
    :cond_63
    instance-of v13, v8, Lorg/json/JSONObject;

    if-eqz v13, :cond_2c

    move-object v6, v8

    .line 100
    check-cast v6, Lorg/json/JSONObject;

    goto :goto_2c

    .line 114
    .end local v8    # "swatchObj":Ljava/lang/Object;
    .restart local v12    # "valueObj":Ljava/lang/Object;
    :cond_6b
    instance-of v13, v12, Lorg/json/JSONArray;

    if-eqz v13, :cond_60

    move-object v10, v12

    .line 115
    check-cast v10, Lorg/json/JSONArray;

    .line 116
    .local v10, "valueArray":Lorg/json/JSONArray;
    new-instance v13, Ljava/lang/Double;

    const/4 v14, 0x0

    invoke-virtual {v10, v14}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v14

    const-wide v16, 0x406fe00000000000L

    mul-double v14, v14, v16

    invoke-direct {v13, v14, v15}, Ljava/lang/Double;-><init>(D)V

    invoke-virtual {v13}, Ljava/lang/Double;->intValue()I

    move-result v7

    .line 117
    .restart local v7    # "r":I
    new-instance v13, Ljava/lang/Double;

    const/4 v14, 0x1

    invoke-virtual {v10, v14}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v14

    const-wide v16, 0x406fe00000000000L

    mul-double v14, v14, v16

    invoke-direct {v13, v14, v15}, Ljava/lang/Double;-><init>(D)V

    invoke-virtual {v13}, Ljava/lang/Double;->intValue()I

    move-result v4

    .line 118
    .restart local v4    # "g":I
    new-instance v13, Ljava/lang/Double;

    const/4 v14, 0x2

    invoke-virtual {v10, v14}, Lorg/json/JSONArray;->optDouble(I)D

    move-result-wide v14

    const-wide v16, 0x406fe00000000000L

    mul-double v14, v14, v16

    invoke-direct {v13, v14, v15}, Ljava/lang/Double;-><init>(D)V

    invoke-virtual {v13}, Ljava/lang/Double;->intValue()I

    move-result v2

    .line 119
    .restart local v2    # "b":I
    invoke-static {v7, v4, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v3, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_60
.end method
