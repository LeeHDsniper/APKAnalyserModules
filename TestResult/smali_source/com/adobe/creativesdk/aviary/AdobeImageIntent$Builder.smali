.class public final Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
.super Ljava/lang/Object;
.source "AdobeImageIntent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/AdobeImageIntent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field final intent:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 168
    new-instance v0, Landroid/content/Intent;

    const-string v1, "aviary.intent.action.EDIT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    .line 169
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v1, "app-id"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 170
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    new-instance v1, Landroid/content/ComponentName;

    const-class v2, Lcom/adobe/creativesdk/aviary/AdobeImageEditorActivity;

    invoke-direct {v1, p1, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 171
    return-void
.end method


# virtual methods
.method public build()Landroid/content/Intent;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 370
    :try_start_1
    const-string v2, "Intent data cannot be null"

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    invoke-virtual {v3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    invoke-static {v2, v3}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/String;Ljava/lang/Object;)V

    .line 371
    const-string v2, "Preview size must be > than 0"

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v4, "max-image-size"

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    if-lez v3, :cond_1f

    :goto_19
    invoke-static {v2, v1}, Ljunit/framework/Assert;->assertTrue(Ljava/lang/String;Z)V
    :try_end_1c
    .catch Ljunit/framework/AssertionFailedError; {:try_start_1 .. :try_end_1c} :catch_21

    .line 376
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    return-object v1

    .line 371
    :cond_1f
    const/4 v1, 0x0

    goto :goto_19

    .line 373
    :catch_21
    move-exception v0

    .line 374
    .local v0, "e":Ljunit/framework/AssertionFailedError;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public quickLaunchTool(Ljava/lang/String;Landroid/os/Bundle;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
    .registers 5
    .param p1, "tool"    # Ljava/lang/String;
    .param p2, "options"    # Landroid/os/Bundle;

    .prologue
    .line 313
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v1, "extra-in-quick-tool"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 314
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v1, "extra-in-quick-tool-options"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 315
    return-object p0
.end method

.method public saveWithNoChanges(Z)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
    .registers 4
    .param p1, "value"    # Z

    .prologue
    .line 288
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v1, "save-on-no-changes"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 289
    return-object p0
.end method

.method public setData(Landroid/net/Uri;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
    .registers 3
    .param p1, "data"    # Landroid/net/Uri;

    .prologue
    .line 177
    sget-boolean v0, Lcom/adobe/creativesdk/aviary/internal/utils/ApiHelper;->AT_LEAST_16:Z

    if-eqz v0, :cond_a

    .line 178
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setDataAndNormalize(Landroid/net/Uri;)Landroid/content/Intent;

    .line 182
    :goto_9
    return-object p0

    .line 180
    :cond_a
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_9
.end method

.method public withAccentColor(I)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 347
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v1, "extra-accent-color"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 348
    return-object p0
.end method

.method public withAutoColorEnabled(Z)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
    .registers 4
    .param p1, "enabled"    # Z

    .prologue
    .line 357
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v1, "extra-enable-auto-accent-color"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 358
    return-object p0
.end method

.method public withNoExitConfirmation(Z)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
    .registers 4
    .param p1, "value"    # Z

    .prologue
    .line 336
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v1, "hide-exit-unsave-confirmation"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 337
    return-object p0
.end method

.method public withOptions(Landroid/os/Bundle;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
    .registers 4
    .param p1, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 300
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v1, "extra-in-extras"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 301
    return-object p0
.end method

.method public withOutput(Landroid/net/Uri;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
    .registers 5
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 192
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v1, "output"

    invoke-virtual {p1}, Landroid/net/Uri;->normalizeScheme()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 193
    return-object p0
.end method

.method public withOutput(Ljava/io/File;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
    .registers 5
    .param p1, "output"    # Ljava/io/File;

    .prologue
    .line 202
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v1, "output"

    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 203
    return-object p0
.end method

.method public withOutputFormat(Landroid/graphics/Bitmap$CompressFormat;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
    .registers 5
    .param p1, "format"    # Landroid/graphics/Bitmap$CompressFormat;

    .prologue
    .line 213
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v1, "output-format"

    invoke-virtual {p1}, Landroid/graphics/Bitmap$CompressFormat;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 214
    return-object p0
.end method

.method public withOutputQuality(I)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
    .registers 4
    .param p1, "quality"    # I

    .prologue
    .line 225
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v1, "output-quality"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 226
    return-object p0
.end method

.method public withOutputSize(Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
    .registers 5
    .param p1, "mp"    # Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;

    .prologue
    .line 237
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v1, "output-hires-megapixels"

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/internal/headless/utils/MegaPixels;->ordinal()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 238
    return-object p0
.end method

.method public withPreviewSize(I)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
    .registers 4
    .param p1, "size"    # I

    .prologue
    .line 324
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v1, "max-image-size"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 325
    return-object p0
.end method

.method public withToolList([Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
    .registers 6
    .param p1, "tools"    # [Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    .prologue
    .line 265
    array-length v2, p1

    new-array v0, v2, [Ljava/lang/String;

    .line 266
    .local v0, "array":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    array-length v2, p1

    if-ge v1, v2, :cond_12

    .line 267
    aget-object v2, p1, v1

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->name()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 266
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 269
    :cond_12
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v3, "tools-list"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 270
    return-object p0
.end method

.method public withVibrationEnabled(Z)Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;
    .registers 5
    .param p1, "enabled"    # Z

    .prologue
    .line 254
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;->intent:Landroid/content/Intent;

    const-string v2, "tools-vibration-disabled"

    if-nez p1, :cond_b

    const/4 v0, 0x1

    :goto_7
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 255
    return-object p0

    .line 254
    :cond_b
    const/4 v0, 0x0

    goto :goto_7
.end method
