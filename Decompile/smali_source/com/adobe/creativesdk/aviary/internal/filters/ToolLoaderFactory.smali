.class public final Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;
.super Ljava/lang/Object;
.source "ToolLoaderFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    }
.end annotation


# direct methods
.method public static findToolByName(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 65
    :try_start_0
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->valueOf(Ljava/lang/String;)Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;
    :try_end_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v1

    .line 67
    :goto_a
    return-object v1

    .line 66
    :catch_b
    move-exception v0

    .line 67
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public static get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;
    .registers 4
    .param p0, "type"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .prologue
    .line 165
    sget-object v0, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$filters$ToolLoaderFactory$Tools:[I

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_98

    .line 223
    const/4 v0, 0x0

    :goto_c
    return-object v0

    .line 167
    :pswitch_d
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustExposureFilter;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustExposureFilter;-><init>()V

    goto :goto_c

    .line 170
    :pswitch_13
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustColorFilter;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/AdjustColorFilter;-><init>()V

    goto :goto_c

    .line 173
    :pswitch_19
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/CropFilter;-><init>()V

    goto :goto_c

    .line 176
    :pswitch_1f
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;-><init>()V

    goto :goto_c

    .line 179
    :pswitch_25
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/EnhanceFilter;-><init>()V

    goto :goto_c

    .line 182
    :pswitch_2b
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/AdjustFilter;-><init>()V

    goto :goto_c

    .line 185
    :pswitch_31
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeRangeFilter;

    const-string v1, "sharpness"

    const-string v2, "value"

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeRangeFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_c

    .line 188
    :pswitch_3b
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    const-string v1, "whiten"

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;->Whiten:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;-><init>(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;)V

    goto :goto_c

    .line 191
    :pswitch_45
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    const-string v1, "redeye"

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;->RedEye:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;-><init>(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;)V

    goto :goto_c

    .line 194
    :pswitch_4f
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    const-string v1, "blur"

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;->Blur:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;-><init>(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;)V

    goto :goto_c

    .line 197
    :pswitch_59
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    const-string v1, "blemish"

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;->Blemish:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;-><init>(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;)V

    goto :goto_c

    .line 200
    :pswitch_63
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;-><init>()V

    goto :goto_c

    .line 203
    :pswitch_69
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/BorderFilter;-><init>()V

    goto :goto_c

    .line 206
    :pswitch_6f
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/OverlayFilter;-><init>()V

    goto :goto_c

    .line 209
    :pswitch_75
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    const-string v1, "colorsplash"

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;->ColorSplash:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;-><init>(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;)V

    goto :goto_c

    .line 212
    :pswitch_7f
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;

    const-string v1, "tiltshift"

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;->TiltShift:Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;

    invoke-direct {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter;-><init>(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeToolFilter$NativeToolType;)V

    goto :goto_c

    .line 215
    :pswitch_89
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;-><init>()V

    goto/16 :goto_c

    .line 218
    :pswitch_90
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeVignetteToolFilter;-><init>()V

    goto/16 :goto_c

    .line 165
    nop

    :pswitch_data_98
    .packed-switch 0x1
        :pswitch_d
        :pswitch_13
        :pswitch_19
        :pswitch_1f
        :pswitch_25
        :pswitch_2b
        :pswitch_31
        :pswitch_3b
        :pswitch_45
        :pswitch_4f
        :pswitch_59
        :pswitch_63
        :pswitch_69
        :pswitch_6f
        :pswitch_75
        :pswitch_7f
        :pswitch_89
        :pswitch_90
    .end packed-switch
.end method

.method public static getAllTools()[Ljava/lang/String;
    .registers 3

    .prologue
    .line 118
    const/16 v0, 0x14

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ENHANCE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 119
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->EFFECTS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 120
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->FRAMES:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 121
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->STICKERS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 122
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->OVERLAYS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 123
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->VIGNETTE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 124
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->CROP:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 125
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->FOCUS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 126
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ORIENTATION:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 127
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->LIGHTING:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 128
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->COLOR:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 129
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->SHARPNESS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 130
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->SPLASH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 131
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->DRAW:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 132
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->TEXT:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 133
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->REDEYE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 134
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->WHITEN:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 135
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->BLUR:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 136
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->BLEMISH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 137
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->MEME:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 138
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0
.end method

.method public static getDefaultTools()[Ljava/lang/String;
    .registers 3

    .prologue
    .line 86
    const/16 v0, 0x14

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ENHANCE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 87
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->EFFECTS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 88
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->FRAMES:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 89
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->STICKERS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 90
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->OVERLAYS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 91
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->VIGNETTE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 92
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->CROP:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 93
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->FOCUS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 94
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ORIENTATION:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 95
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->LIGHTING:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 96
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->COLOR:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 97
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->SHARPNESS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 98
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->SPLASH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 99
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->DRAW:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 100
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->TEXT:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 101
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->REDEYE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 102
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->WHITEN:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 103
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->BLUR:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 104
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->BLEMISH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 105
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->MEME:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .line 106
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0
.end method

.method public static getToolId(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Ljava/lang/String;
    .registers 2
    .param p0, "tool"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .prologue
    .line 72
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->getToolName(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getToolName(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Ljava/lang/String;
    .registers 3
    .param p0, "filter"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .prologue
    .line 60
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getToolVersion(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)I
    .registers 2
    .param p0, "tool"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .prologue
    .line 76
    const/4 v0, 0x1

    return v0
.end method
