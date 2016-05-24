.class public Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;
.super Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;
.source "AbstractPanelLoaderService.java"


# static fields
.field static final ALL_ENTRIES:[Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    .line 127
    const/16 v0, 0x14

    new-array v0, v0, [Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    const/4 v1, 0x0

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ENHANCE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_enhance:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_enhance:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->FOCUS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_focus:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_tool_tiltshift:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->EFFECTS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_effects:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_effects:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->FRAMES:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_frames:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_borders:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/4 v1, 0x4

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->STICKERS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_stickers:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_stickers:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/4 v1, 0x5

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->OVERLAYS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_overlay:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_overlays:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/4 v1, 0x6

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->CROP:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_crop:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_crop:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/4 v1, 0x7

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ORIENTATION:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_orientation:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_adjust:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/16 v1, 0x8

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->LIGHTING:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_lighting:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_tool_lighting:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/16 v1, 0x9

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->COLOR:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_color:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_tool_color:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/16 v1, 0xa

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->SHARPNESS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_sharpen:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_sharpen:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/16 v1, 0xb

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->SPLASH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_colorsplash:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_tool_colorsplash:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/16 v1, 0xc

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->DRAW:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_draw:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_draw:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/16 v1, 0xd

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->TEXT:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_text:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_text:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/16 v1, 0xe

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->REDEYE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_redeye:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_red_eye:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/16 v1, 0xf

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->WHITEN:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_whiten:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_whiten:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/16 v1, 0x10

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->BLEMISH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_blemish:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_blemish:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/16 v1, 0x11

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->MEME:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_meme:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_meme:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/16 v1, 0x12

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->BLUR:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_blur:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_blur:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    const/16 v1, 0x13

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->VIGNETTE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    sget v4, Lcom/aviary/android/feather/sdk/R$drawable;->com_adobe_image_tool_ic_vignette:I

    sget v5, Lcom/aviary/android/feather/sdk/R$string;->feather_vignette:I

    invoke-direct {v2, v3, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;-><init>(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;II)V

    aput-object v2, v0, v1

    sput-object v0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;->ALL_ENTRIES:[Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .line 173
    return-void
.end method

.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V
    .registers 2
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V

    .line 19
    return-void
.end method

.method public static getToolDisplayName(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)I
    .registers 3
    .param p0, "tool"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .prologue
    .line 208
    sget-object v0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$filters$ToolLoaderFactory$Tools:[I

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_4a

    .line 251
    const/4 v0, 0x0

    :goto_c
    return v0

    .line 211
    :pswitch_d
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_sharpen:I

    goto :goto_c

    .line 213
    :pswitch_10
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_effects:I

    goto :goto_c

    .line 215
    :pswitch_13
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_red_eye:I

    goto :goto_c

    .line 217
    :pswitch_16
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_crop:I

    goto :goto_c

    .line 219
    :pswitch_19
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_whiten:I

    goto :goto_c

    .line 221
    :pswitch_1c
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_draw:I

    goto :goto_c

    .line 223
    :pswitch_1f
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_stickers:I

    goto :goto_c

    .line 225
    :pswitch_22
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_text:I

    goto :goto_c

    .line 227
    :pswitch_25
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_blemish:I

    goto :goto_c

    .line 229
    :pswitch_28
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_meme:I

    goto :goto_c

    .line 231
    :pswitch_2b
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_adjust:I

    goto :goto_c

    .line 233
    :pswitch_2e
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_enhance:I

    goto :goto_c

    .line 235
    :pswitch_31
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_borders:I

    goto :goto_c

    .line 237
    :pswitch_34
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_tool_colorsplash:I

    goto :goto_c

    .line 239
    :pswitch_37
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_tool_tiltshift:I

    goto :goto_c

    .line 241
    :pswitch_3a
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_blur:I

    goto :goto_c

    .line 243
    :pswitch_3d
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_vignette:I

    goto :goto_c

    .line 245
    :pswitch_40
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_tool_lighting:I

    goto :goto_c

    .line 247
    :pswitch_43
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_tool_color:I

    goto :goto_c

    .line 249
    :pswitch_46
    sget v0, Lcom/aviary/android/feather/sdk/R$string;->feather_overlays:I

    goto :goto_c

    .line 208
    nop

    :pswitch_data_4a
    .packed-switch 0x1
        :pswitch_2b
        :pswitch_40
        :pswitch_43
        :pswitch_d
        :pswitch_2e
        :pswitch_10
        :pswitch_31
        :pswitch_16
        :pswitch_13
        :pswitch_19
        :pswitch_3a
        :pswitch_25
        :pswitch_1c
        :pswitch_1f
        :pswitch_22
        :pswitch_28
        :pswitch_34
        :pswitch_37
        :pswitch_3d
        :pswitch_46
    .end packed-switch
.end method

.method public static getToolsEntries()[Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    .registers 1

    .prologue
    .line 181
    sget-object v0, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;->ALL_ENTRIES:[Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    return-object v0
.end method


# virtual methods
.method public createNew(Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    .registers 7
    .param p1, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    .line 31
    const/4 v2, 0x0

    .line 32
    .local v2, "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    .line 34
    .local v0, "context":Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    sget-object v3, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService$1;->$SwitchMap$com$adobe$creativesdk$aviary$internal$filters$ToolLoaderFactory$Tools:[I

    iget-object v4, p1, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->name:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_c0

    .line 116
    const-string v3, "EffectLoaderService"

    sget-object v4, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    invoke-static {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v1

    .line 117
    .local v1, "logger":Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Effect with "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p1, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->name:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " could not be found"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->error(Ljava/lang/String;)V

    .line 120
    .end local v1    # "logger":Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;
    :goto_38
    return-object v2

    .line 36
    :pswitch_39
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ORIENTATION:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-direct {v2, v0, p1, v3}, Lcom/adobe/creativesdk/aviary/panels/OrientationPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)V

    .line 37
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 40
    :pswitch_41
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    invoke-direct {v2, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 41
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 44
    :pswitch_47
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    invoke-direct {v2, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/ConsolidatedAdjustToolsPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 45
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 48
    :pswitch_4d
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->SHARPNESS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-direct {v2, v0, p1, v3}, Lcom/adobe/creativesdk/aviary/panels/NativeEffectRangePanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)V

    .line 49
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 52
    :pswitch_55
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->ENHANCE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-direct {v2, v0, p1, v3}, Lcom/adobe/creativesdk/aviary/panels/EnhanceEffectPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)V

    .line 53
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 56
    :pswitch_5d
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    invoke-direct {v2, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 57
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 60
    :pswitch_63
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    invoke-direct {v2, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/BordersPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 61
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 64
    :pswitch_69
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/CropPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    invoke-direct {v2, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/CropPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 65
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 68
    :pswitch_6f
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->REDEYE:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-direct {v2, v0, p1, v3}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)V

    .line 69
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 72
    :pswitch_77
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->WHITEN:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-direct {v2, v0, p1, v3}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)V

    .line 73
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 76
    :pswitch_7f
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->BLUR:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-direct {v2, v0, p1, v3}, Lcom/adobe/creativesdk/aviary/panels/DelayedSpotDrawPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)V

    .line 77
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 80
    :pswitch_87
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->BLEMISH:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-direct {v2, v0, p1, v3}, Lcom/adobe/creativesdk/aviary/panels/BlemishPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)V

    .line 81
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 84
    :pswitch_8f
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    invoke-direct {v2, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 85
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 88
    :pswitch_95
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    invoke-direct {v2, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/StickersPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 89
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 92
    :pswitch_9b
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/TextPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    invoke-direct {v2, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 93
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 96
    :pswitch_a1
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    invoke-direct {v2, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 97
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 100
    :pswitch_a7
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    invoke-direct {v2, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/ColorSplashPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 101
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 104
    :pswitch_ad
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    invoke-direct {v2, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/FocusPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 105
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 108
    :pswitch_b3
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    invoke-direct {v2, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/VignettePanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 109
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto :goto_38

    .line 112
    :pswitch_b9
    new-instance v2, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;

    .end local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    invoke-direct {v2, v0, p1}, Lcom/adobe/creativesdk/aviary/panels/OverlaysPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 113
    .restart local v2    # "panel":Lcom/adobe/creativesdk/aviary/panels/AbstractPanel;
    goto/16 :goto_38

    .line 34
    :pswitch_data_c0
    .packed-switch 0x1
        :pswitch_39
        :pswitch_41
        :pswitch_47
        :pswitch_4d
        :pswitch_55
        :pswitch_5d
        :pswitch_63
        :pswitch_69
        :pswitch_6f
        :pswitch_77
        :pswitch_7f
        :pswitch_87
        :pswitch_8f
        :pswitch_95
        :pswitch_9b
        :pswitch_a1
        :pswitch_a7
        :pswitch_ad
        :pswitch_b3
        :pswitch_b9
    .end packed-switch
.end method

.method public dispose()V
    .registers 1

    .prologue
    .line 256
    return-void
.end method

.method public findEntry(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    .registers 7
    .param p1, "name"    # Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .prologue
    .line 185
    sget-object v2, Lcom/adobe/creativesdk/aviary/panels/AbstractPanelLoaderService;->ALL_ENTRIES:[Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_4
    if-ge v1, v3, :cond_14

    aget-object v0, v2, v1

    .line 186
    .local v0, "entry":Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    iget-object v4, v0, Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;->name:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-virtual {v4, p1}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 190
    .end local v0    # "entry":Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    :goto_10
    return-object v0

    .line 185
    .restart local v0    # "entry":Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    :cond_11
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 190
    .end local v0    # "entry":Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;
    :cond_14
    const/4 v0, 0x0

    goto :goto_10
.end method
