.class Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRequestHandler;
.super Lit/sephiroth/android/library/picasso/RequestHandler;
.source "EffectsPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/aviary/panels/EffectsPanel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "EffectsRequestHandler"
.end annotation


# instance fields
.field private srcBitmap:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .registers 2
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 172
    invoke-direct {p0}, Lit/sephiroth/android/library/picasso/RequestHandler;-><init>()V

    .line 173
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRequestHandler;->srcBitmap:Landroid/graphics/Bitmap;

    .line 174
    return-void
.end method

.method private loadFilter(Ljava/lang/CharSequence;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeFilter;
    .registers 5
    .param p1, "effectFileName"    # Ljava/lang/CharSequence;

    .prologue
    .line 222
    sget-object v1, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->EFFECTS:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;

    .line 223
    .local v0, "filter":Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;
    check-cast p1, Ljava/lang/String;

    .end local p1    # "effectFileName":Ljava/lang/CharSequence;
    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;->setMoaLiteEffect(Ljava/lang/String;)V

    .line 224
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRequestHandler;->srcBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRequestHandler;->srcBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/impl/EffectFilter;->setPreviewSize(II)V

    .line 230
    return-object v0
.end method


# virtual methods
.method public call(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 11
    .param p1, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 205
    const/4 v2, 0x1

    .line 206
    .local v2, "isValid":Z
    const/4 v1, 0x0

    .line 208
    .local v1, "filter":Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeFilter;
    :try_start_3
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRequestHandler;->loadFilter(Ljava/lang/CharSequence;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeFilter;
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_6} :catch_18

    move-result-object v1

    .line 214
    :goto_7
    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/INativeFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    .line 215
    .local v0, "actionList":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRequestHandler;->srcBitmap:Landroid/graphics/Bitmap;

    const/4 v7, 0x0

    invoke-static {v0, v6, v7, v8, v8}, Lcom/adobe/creativesdk/aviary/internal/headless/filters/NativeFilterProxy;->prepareActions(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;

    move-result-object v3

    .line 216
    .local v3, "moaresult":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;
    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->execute()V

    .line 217
    iget-object v4, v3, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;->outputBitmap:Landroid/graphics/Bitmap;

    .line 218
    .local v4, "result":Landroid/graphics/Bitmap;
    return-object v4

    .line 209
    .end local v0    # "actionList":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    .end local v3    # "moaresult":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaResult;
    .end local v4    # "result":Landroid/graphics/Bitmap;
    :catch_18
    move-exception v5

    .line 210
    .local v5, "t":Ljava/lang/Throwable;
    invoke-virtual {v5}, Ljava/lang/Throwable;->printStackTrace()V

    .line 211
    const/4 v2, 0x0

    goto :goto_7
.end method

.method public canHandleRequest(Lit/sephiroth/android/library/picasso/Request;)Z
    .registers 5
    .param p1, "request"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    const/4 v1, 0x0

    .line 178
    iget-object v2, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    if-eqz v2, :cond_16

    .line 179
    iget-object v2, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    .line 180
    .local v0, "scheme":Ljava/lang/String;
    if-eqz v0, :cond_16

    const-string v2, "aviary_effect"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_16

    const/4 v1, 0x1

    .line 182
    .end local v0    # "scheme":Ljava/lang/String;
    :cond_16
    return v1
.end method

.method public decode(Landroid/net/Uri;)Landroid/graphics/Bitmap;
    .registers 4
    .param p1, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    :try_start_0
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRequestHandler;->call(Ljava/lang/String;)Landroid/graphics/Bitmap;
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    return-object v1

    .line 198
    :catch_9
    move-exception v0

    .line 199
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 200
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public load(Lit/sephiroth/android/library/picasso/Request;I)Lit/sephiroth/android/library/picasso/RequestHandler$Result;
    .registers 7
    .param p1, "request"    # Lit/sephiroth/android/library/picasso/Request;
    .param p2, "paramInt"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 187
    iget-object v1, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    if-eqz v1, :cond_36

    .line 188
    const-string v1, "EffectsPanel"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "uri: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", param: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    iget-object v1, p1, Lit/sephiroth/android/library/picasso/Request;->uri:Landroid/net/Uri;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/EffectsPanel$EffectsRequestHandler;->decode(Landroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 190
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v1, Lit/sephiroth/android/library/picasso/RequestHandler$Result;

    sget-object v2, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;->NETWORK:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    invoke-direct {v1, v0, v2}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;-><init>(Landroid/graphics/Bitmap;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;)V

    .line 192
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    :goto_35
    return-object v1

    :cond_36
    const/4 v1, 0x0

    goto :goto_35
.end method
