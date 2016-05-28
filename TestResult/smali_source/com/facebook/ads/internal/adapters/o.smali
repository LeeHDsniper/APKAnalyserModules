.class public Lcom/facebook/ads/internal/adapters/o;
.super Lcom/facebook/ads/internal/adapters/b;


# instance fields
.field private final b:Lcom/facebook/ads/internal/adapters/p;

.field private c:Lcom/facebook/ads/NativeAdView$Type;

.field private d:Z

.field private e:Z

.field private f:Z

.field private g:Landroid/view/View;

.field private h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private b(Landroid/view/View;)Ljava/lang/String;
    .registers 3

    :try_start_0
    invoke-direct {p0, p1}, Lcom/facebook/ads/internal/adapters/o;->c(Landroid/view/View;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v0

    :goto_8
    return-object v0

    :catch_9
    move-exception v0

    const-string v0, "Json exception"

    goto :goto_8
.end method

.method private c(Landroid/view/View;)Lorg/json/JSONObject;
    .registers 10

    const/4 v7, 0x2

    const/4 v0, 0x1

    const/4 v1, 0x0

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "id"

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "class"

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "origin"

    const-string v4, "{x:%d, y:%d}"

    new-array v5, v7, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v0

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "size"

    const-string v4, "{h:%d, w:%d}"

    new-array v5, v7, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v0

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v3, p0, Lcom/facebook/ads/internal/adapters/o;->h:Ljava/util/List;

    if-eqz v3, :cond_a1

    iget-object v3, p0, Lcom/facebook/ads/internal/adapters/o;->h:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a1

    :goto_6c
    const-string v3, "clickable"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "unknown"

    instance-of v3, p1, Landroid/widget/TextView;

    if-eqz v3, :cond_a3

    const-string v0, "text"

    :cond_7d
    :goto_7d
    const-string v3, "type"

    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_c4

    check-cast p1, Landroid/view/ViewGroup;

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    :goto_8d
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_bf

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/facebook/ads/internal/adapters/o;->c(Landroid/view/View;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v1, v1, 0x1

    goto :goto_8d

    :cond_a1
    move v0, v1

    goto :goto_6c

    :cond_a3
    instance-of v3, p1, Landroid/widget/Button;

    if-eqz v3, :cond_aa

    const-string v0, "button"

    goto :goto_7d

    :cond_aa
    instance-of v3, p1, Landroid/widget/ImageView;

    if-eqz v3, :cond_b1

    const-string v0, "image"

    goto :goto_7d

    :cond_b1
    instance-of v3, p1, Lcom/facebook/ads/MediaView;

    if-eqz v3, :cond_b8

    const-string v0, "mediaview"

    goto :goto_7d

    :cond_b8
    instance-of v3, p1, Landroid/view/ViewGroup;

    if-eqz v3, :cond_7d

    const-string v0, "viewgroup"

    goto :goto_7d

    :cond_bf
    const-string v1, "list"

    invoke-virtual {v2, v1, v0}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_c4
    return-object v2
.end method

.method private d(Landroid/view/View;)Ljava/lang/String;
    .registers 6

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    if-lez v0, :cond_c

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    if-gtz v0, :cond_f

    :cond_c
    const-string v0, ""

    :goto_e
    return-object v0

    :cond_f
    :try_start_f
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    invoke-virtual {v0, v1}, Landroid/graphics/Bitmap;->setDensity(I)V

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p1, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    iget-object v3, p0, Lcom/facebook/ads/internal/adapters/o;->b:Lcom/facebook/ads/internal/adapters/p;

    invoke-virtual {v3}, Lcom/facebook/ads/internal/adapters/p;->e()I

    move-result v3

    invoke-virtual {v0, v2, v3, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;
    :try_end_4a
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_4a} :catch_4c

    move-result-object v0

    goto :goto_e

    :catch_4c
    move-exception v0

    const-string v0, ""

    goto :goto_e
.end method


# virtual methods
.method protected b()V
    .registers 4

    iget-object v0, p0, Lcom/facebook/ads/internal/adapters/o;->b:Lcom/facebook/ads/internal/adapters/p;

    if-nez v0, :cond_5

    :goto_4
    return-void

    :cond_5
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/facebook/ads/internal/adapters/o;->a:Lcom/facebook/ads/internal/adapters/c;

    if-eqz v1, :cond_37

    const-string v1, "mil"

    iget-object v2, p0, Lcom/facebook/ads/internal/adapters/o;->a:Lcom/facebook/ads/internal/adapters/c;

    invoke-virtual {v2}, Lcom/facebook/ads/internal/adapters/c;->a()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "eil"

    iget-object v2, p0, Lcom/facebook/ads/internal/adapters/o;->a:Lcom/facebook/ads/internal/adapters/c;

    invoke-virtual {v2}, Lcom/facebook/ads/internal/adapters/c;->b()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "eil_source"

    iget-object v2, p0, Lcom/facebook/ads/internal/adapters/o;->a:Lcom/facebook/ads/internal/adapters/c;

    invoke-virtual {v2}, Lcom/facebook/ads/internal/adapters/c;->c()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_37
    iget-object v1, p0, Lcom/facebook/ads/internal/adapters/o;->c:Lcom/facebook/ads/NativeAdView$Type;

    if-eqz v1, :cond_4a

    const-string v1, "nti"

    iget-object v2, p0, Lcom/facebook/ads/internal/adapters/o;->c:Lcom/facebook/ads/NativeAdView$Type;

    invoke-virtual {v2}, Lcom/facebook/ads/NativeAdView$Type;->getValue()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4a
    iget-boolean v1, p0, Lcom/facebook/ads/internal/adapters/o;->d:Z

    if-eqz v1, :cond_59

    const-string v1, "nhs"

    iget-boolean v2, p0, Lcom/facebook/ads/internal/adapters/o;->d:Z

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_59
    iget-boolean v1, p0, Lcom/facebook/ads/internal/adapters/o;->e:Z

    if-eqz v1, :cond_68

    const-string v1, "nmv"

    iget-boolean v2, p0, Lcom/facebook/ads/internal/adapters/o;->e:Z

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_68
    iget-boolean v1, p0, Lcom/facebook/ads/internal/adapters/o;->f:Z

    if-eqz v1, :cond_77

    const-string v1, "nmvap"

    iget-boolean v2, p0, Lcom/facebook/ads/internal/adapters/o;->f:Z

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_77
    iget-object v1, p0, Lcom/facebook/ads/internal/adapters/o;->g:Landroid/view/View;

    if-eqz v1, :cond_8e

    iget-object v1, p0, Lcom/facebook/ads/internal/adapters/o;->b:Lcom/facebook/ads/internal/adapters/p;

    invoke-virtual {v1}, Lcom/facebook/ads/internal/adapters/p;->b()Z

    move-result v1

    if-eqz v1, :cond_8e

    const-string v1, "view"

    iget-object v2, p0, Lcom/facebook/ads/internal/adapters/o;->g:Landroid/view/View;

    invoke-direct {p0, v2}, Lcom/facebook/ads/internal/adapters/o;->b(Landroid/view/View;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8e
    iget-object v1, p0, Lcom/facebook/ads/internal/adapters/o;->g:Landroid/view/View;

    if-eqz v1, :cond_a5

    iget-object v1, p0, Lcom/facebook/ads/internal/adapters/o;->b:Lcom/facebook/ads/internal/adapters/p;

    invoke-virtual {v1}, Lcom/facebook/ads/internal/adapters/p;->d()Z

    move-result v1

    if-eqz v1, :cond_a5

    const-string v1, "snapshot"

    iget-object v2, p0, Lcom/facebook/ads/internal/adapters/o;->g:Landroid/view/View;

    invoke-direct {p0, v2}, Lcom/facebook/ads/internal/adapters/o;->d(Landroid/view/View;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a5
    iget-object v1, p0, Lcom/facebook/ads/internal/adapters/o;->b:Lcom/facebook/ads/internal/adapters/p;

    invoke-virtual {v1, v0}, Lcom/facebook/ads/internal/adapters/p;->a(Ljava/util/Map;)V

    goto/16 :goto_4
.end method
