.class public final Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
.super Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;
.source "LocalDataService.java"


# instance fields
.field private destImageUri:Landroid/net/Uri;

.field private mAccentColor:I

.field private mGetAccentColorEnabled:Z

.field private mGetAccentColorEnabledDirty:Z

.field private mGetAccentColorFromIntent:I

.field private mGetAccentColorFromIntentDirty:Z

.field private mHasAccentColor:Z

.field private mHasAccentColorFromIntent:Z

.field private mHasAccentColorFromIntentDirty:Z

.field private mImageInfo:Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

.field private final mOriginalIntent:Landroid/content/Intent;

.field private final mRecipe:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;",
            ">;"
        }
    .end annotation
.end field

.field private outputFormat:Landroid/graphics/Bitmap$CompressFormat;

.field private final preferencesUtils:Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

.field private sourceImageUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V
    .registers 5
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    .prologue
    const/4 v1, 0x1

    .line 38
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/BaseContextService;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;)V

    .line 233
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mGetAccentColorFromIntentDirty:Z

    .line 234
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mHasAccentColorFromIntentDirty:Z

    .line 235
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mGetAccentColorEnabledDirty:Z

    .line 40
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->preferencesUtils:Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    .line 42
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseActivity()Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 43
    .local v0, "intent":Landroid/content/Intent;
    if-eqz v0, :cond_29

    .line 44
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mOriginalIntent:Landroid/content/Intent;

    .line 48
    :goto_20
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mRecipe:Ljava/util/List;

    .line 49
    return-void

    .line 46
    :cond_29
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mOriginalIntent:Landroid/content/Intent;

    goto :goto_20
.end method

.method private getAccentColorFromIntent(I)I
    .registers 4
    .param p1, "defaultColor"    # I

    .prologue
    .line 281
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mGetAccentColorFromIntentDirty:Z

    if-eqz v0, :cond_11

    .line 282
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mOriginalIntent:Landroid/content/Intent;

    const-string v1, "extra-accent-color"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mGetAccentColorFromIntent:I

    .line 283
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mGetAccentColorFromIntentDirty:Z

    .line 285
    :cond_11
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mGetAccentColorFromIntent:I

    return v0
.end method

.method private hasAccentColorFromIntent()Z
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 273
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mHasAccentColorFromIntentDirty:Z

    if-eqz v0, :cond_1a

    .line 274
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getAccentColorEnabled()Z

    move-result v0

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mOriginalIntent:Landroid/content/Intent;

    const-string v2, "extra-accent-color"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1d

    const/4 v0, 0x1

    :goto_16
    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mHasAccentColorFromIntent:Z

    .line 275
    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mHasAccentColorFromIntentDirty:Z

    .line 277
    :cond_1a
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mHasAccentColorFromIntent:Z

    return v0

    :cond_1d
    move v0, v1

    .line 274
    goto :goto_16
.end method

.method private setAccentColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 268
    iput p1, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mAccentColor:I

    .line 269
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mHasAccentColor:Z

    .line 270
    return-void
.end method


# virtual methods
.method public addRecipe(Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;)V
    .registers 3
    .param p1, "value"    # Lcom/adobe/creativesdk/aviary/internal/vo/EditToolVO;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mRecipe:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    return-void
.end method

.method public dispose()V
    .registers 1

    .prologue
    .line 52
    return-void
.end method

.method public getAccentColor(I)I
    .registers 3
    .param p1, "defaultColor"    # I

    .prologue
    .line 261
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mHasAccentColor:Z

    if-eqz v0, :cond_7

    .line 262
    iget v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mAccentColor:I

    .line 264
    :goto_6
    return v0

    :cond_7
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getAccentColorFromIntent(I)I

    move-result v0

    goto :goto_6
.end method

.method getAccentColorEnabled()Z
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 242
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mGetAccentColorEnabledDirty:Z

    if-eqz v0, :cond_1e

    .line 243
    sget-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_16:Z

    if-eqz v0, :cond_21

    const-string v0, "extra-enable-auto-accent-color"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getIntentExtra(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_21

    move v0, v1

    :goto_1c
    iput-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mGetAccentColorEnabled:Z

    .line 245
    :cond_1e
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mGetAccentColorEnabled:Z

    return v0

    .line 243
    :cond_21
    const/4 v0, 0x0

    goto :goto_1c
.end method

.method public getDestImageUri()Landroid/net/Uri;
    .registers 3

    .prologue
    .line 146
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->destImageUri:Landroid/net/Uri;

    if-nez v0, :cond_1a

    .line 147
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mOriginalIntent:Landroid/content/Intent;

    const-string v1, "output"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 148
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mOriginalIntent:Landroid/content/Intent;

    const-string v1, "output"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->destImageUri:Landroid/net/Uri;

    .line 151
    :cond_1a
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->destImageUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getImageInfo()Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mImageInfo:Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    return-object v0
.end method

.method public getIntentExtra(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "TT;)TT;"
        }
    .end annotation

    .prologue
    .line 196
    .local p2, "defaultValue":Ljava/lang/Object;, "TT;"
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mOriginalIntent:Landroid/content/Intent;

    invoke-virtual {v3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 197
    .local v0, "bundle":Landroid/os/Bundle;
    if-eqz v0, :cond_15

    .line 198
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 201
    :try_start_e
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;
    :try_end_11
    .catch Ljava/lang/ClassCastException; {:try_start_e .. :try_end_11} :catch_16

    move-result-object v2

    .line 206
    .local v2, "value":Ljava/lang/Object;, "TT;"
    if-eqz v2, :cond_15

    move-object p2, v2

    .line 212
    .end local v2    # "value":Ljava/lang/Object;, "TT;"
    .end local p2    # "defaultValue":Ljava/lang/Object;, "TT;"
    :cond_15
    :goto_15
    return-object p2

    .line 202
    .restart local p2    # "defaultValue":Ljava/lang/Object;, "TT;"
    :catch_16
    move-exception v1

    .line 203
    .local v1, "e":Ljava/lang/ClassCastException;
    goto :goto_15
.end method

.method public getIntentHasExtra(Ljava/lang/String;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 226
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mOriginalIntent:Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public getOutputFormat()Landroid/graphics/Bitmap$CompressFormat;
    .registers 4

    .prologue
    .line 162
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->outputFormat:Landroid/graphics/Bitmap$CompressFormat;

    if-nez v1, :cond_1a

    .line 163
    const-string v1, "output-format"

    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v2}, Landroid/graphics/Bitmap$CompressFormat;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getIntentExtra(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 164
    .local v0, "outputFormatString":Ljava/lang/String;
    if-eqz v0, :cond_1d

    .line 165
    invoke-static {v0}, Landroid/graphics/Bitmap$CompressFormat;->valueOf(Ljava/lang/String;)Landroid/graphics/Bitmap$CompressFormat;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->outputFormat:Landroid/graphics/Bitmap$CompressFormat;

    .line 170
    .end local v0    # "outputFormatString":Ljava/lang/String;
    :cond_1a
    :goto_1a
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->outputFormat:Landroid/graphics/Bitmap$CompressFormat;

    return-object v1

    .line 167
    .restart local v0    # "outputFormatString":Ljava/lang/String;
    :cond_1d
    sget-object v1, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->outputFormat:Landroid/graphics/Bitmap$CompressFormat;

    goto :goto_1a
.end method

.method public getOutputQuality()I
    .registers 3

    .prologue
    .line 179
    const-string v0, "output-quality"

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getIntentHasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 180
    const-string v0, "output-quality"

    const/16 v1, 0x61

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getIntentExtra(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 182
    :goto_1a
    return v0

    :cond_1b
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->preferencesUtils:Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getOutputImageQuality()I

    move-result v0

    goto :goto_1a
.end method

.method public getRequestedMegaPixels()I
    .registers 6

    .prologue
    .line 125
    const-string v3, "output-hires-megapixels"

    const/4 v4, -0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getIntentExtra(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 126
    .local v1, "mp":I
    if-gez v1, :cond_1d

    .line 128
    :try_start_13
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->preferencesUtils:Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/utils/SharedPreferencesUtils;->getOutputImageSize()Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    move-result-object v2

    .line 129
    .local v2, "standaloneMp":Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->ordinal()I
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_1c} :catch_28

    move-result v1

    .line 134
    .end local v2    # "standaloneMp":Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;
    :cond_1d
    :goto_1d
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->Mp30:Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->ordinal()I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    return v3

    .line 130
    :catch_28
    move-exception v0

    .line 131
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1d
.end method

.method public hasAccentColor()Z
    .registers 2

    .prologue
    .line 252
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getAccentColorEnabled()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->hasAccentColorFromIntent()Z

    move-result v0

    if-nez v0, :cond_10

    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mHasAccentColor:Z

    if-eqz v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public setDestImageUri(Landroid/net/Uri;)V
    .registers 2
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 155
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->destImageUri:Landroid/net/Uri;

    .line 156
    return-void
.end method

.method public setImageInfo(Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;)V
    .registers 6
    .param p1, "info"    # Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    .prologue
    .line 95
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->mImageInfo:Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    .line 96
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->hasAccentColorFromIntent()Z

    move-result v2

    if-nez v2, :cond_22

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getAccentColorEnabled()Z

    move-result v2

    if-eqz v2, :cond_22

    .line 97
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getPalette()Landroid/support/v7/graphics/Palette;

    move-result-object v0

    .line 98
    .local v0, "palette":Landroid/support/v7/graphics/Palette;
    if-eqz v0, :cond_21

    .line 99
    invoke-virtual {v0}, Landroid/support/v7/graphics/Palette;->getVibrantSwatch()Landroid/support/v7/graphics/Palette$Swatch;

    move-result-object v1

    .line 100
    .local v1, "swatch":Landroid/support/v7/graphics/Palette$Swatch;
    if-eqz v1, :cond_21

    .line 101
    invoke-virtual {v1}, Landroid/support/v7/graphics/Palette$Swatch;->getRgb()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->setAccentColor(I)V

    .line 107
    .end local v0    # "palette":Landroid/support/v7/graphics/Palette;
    .end local v1    # "swatch":Landroid/support/v7/graphics/Palette$Swatch;
    :cond_21
    :goto_21
    return-void

    .line 105
    :cond_22
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v3, "accent color already defined!"

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->warn(Ljava/lang/String;)V

    goto :goto_21
.end method

.method public declared-synchronized setSourceImageUri(Landroid/net/Uri;)V
    .registers 3
    .param p1, "sourceImageUri"    # Landroid/net/Uri;

    .prologue
    .line 142
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->sourceImageUri:Landroid/net/Uri;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 143
    monitor-exit p0

    return-void

    .line 142
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method
