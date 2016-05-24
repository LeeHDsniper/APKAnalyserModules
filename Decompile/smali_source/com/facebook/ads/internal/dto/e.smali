.class public Lcom/facebook/ads/internal/dto/e;
.super Ljava/lang/Object;


# instance fields
.field protected a:Ljava/lang/String;

.field protected b:Lcom/facebook/ads/internal/server/AdPlacementType;

.field protected c:Lcom/facebook/ads/internal/dto/b;

.field public d:Landroid/content/Context;

.field public e:Lcom/facebook/ads/internal/e;

.field public f:Z

.field private g:Lcom/facebook/ads/internal/c;

.field private h:I

.field private i:Lcom/facebook/ads/AdSize;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/ads/AdSize;Lcom/facebook/ads/internal/e;Lcom/facebook/ads/internal/c;IZ)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/facebook/ads/internal/dto/e;->a:Ljava/lang/String;

    iput-object p3, p0, Lcom/facebook/ads/internal/dto/e;->i:Lcom/facebook/ads/AdSize;

    iput-object p4, p0, Lcom/facebook/ads/internal/dto/e;->e:Lcom/facebook/ads/internal/e;

    invoke-static {p4}, Lcom/facebook/ads/internal/dto/b;->a(Lcom/facebook/ads/internal/e;)Lcom/facebook/ads/internal/dto/b;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/ads/internal/dto/e;->c:Lcom/facebook/ads/internal/dto/b;

    iput-object p5, p0, Lcom/facebook/ads/internal/dto/e;->g:Lcom/facebook/ads/internal/c;

    iput p6, p0, Lcom/facebook/ads/internal/dto/e;->h:I

    iput-boolean p7, p0, Lcom/facebook/ads/internal/dto/e;->f:Z

    invoke-direct {p0, p1}, Lcom/facebook/ads/internal/dto/e;->a(Landroid/content/Context;)V

    return-void
.end method

.method private a(Landroid/content/Context;)V
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/internal/dto/e;->d:Landroid/content/Context;

    invoke-static {p1}, Lcom/facebook/ads/internal/dto/f;->a(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/facebook/ads/internal/dto/e;->f()V

    return-void
.end method

.method private a(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-static {}, Lcom/facebook/ads/internal/util/AdInternalSettings;->shouldUseLiveRailEndpoint()Z

    move-result v0

    if-eqz v0, :cond_1d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "LR_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1c
    return-void

    :cond_1d
    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1c
.end method

.method private static b(Landroid/content/Context;)Ljava/util/Map;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v0, "VIEWABLE"

    const-string v2, "1"

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "SCHEMA"

    const-string v2, "json"

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "SDK"

    const-string v2, "android"

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "SDK_VERSION"

    const-string v2, "4.7.0"

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "LOCALE"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    const-string v4, "DENSITY"

    invoke-static {v0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "SCREEN_WIDTH"

    int-to-float v2, v2

    div-float/2addr v2, v0

    float-to-int v2, v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "SCREEN_HEIGHT"

    int-to-float v3, v3

    div-float v0, v3, v0

    float-to-int v0, v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "IDFA"

    sget-object v2, Lcom/facebook/ads/internal/dto/f;->n:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "IDFA_FLAG"

    sget-boolean v0, Lcom/facebook/ads/internal/dto/f;->o:Z

    if-eqz v0, :cond_e1

    const-string v0, "0"

    :goto_7d
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "ATTRIBUTION_ID"

    sget-object v2, Lcom/facebook/ads/internal/dto/f;->m:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "OS"

    const-string v2, "Android"

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "OSVERS"

    sget-object v2, Lcom/facebook/ads/internal/dto/f;->a:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "BUNDLE"

    sget-object v2, Lcom/facebook/ads/internal/dto/f;->d:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "APPNAME"

    sget-object v2, Lcom/facebook/ads/internal/dto/f;->e:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "APPVERS"

    sget-object v2, Lcom/facebook/ads/internal/dto/f;->f:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "APPBUILD"

    sget v2, Lcom/facebook/ads/internal/dto/f;->g:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "CARRIER"

    sget-object v2, Lcom/facebook/ads/internal/dto/f;->h:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "MAKE"

    sget-object v2, Lcom/facebook/ads/internal/dto/f;->b:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "MODEL"

    sget-object v2, Lcom/facebook/ads/internal/dto/f;->c:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "COPPA"

    invoke-static {}, Lcom/facebook/ads/AdSettings;->isChildDirected()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "SDK_CAPABILITY"

    invoke-static {}, Lcom/facebook/ads/internal/d;->b()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v1

    :cond_e1
    const-string v0, "1"

    goto :goto_7d
.end method

.method private f()V
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/internal/dto/e;->c:Lcom/facebook/ads/internal/dto/b;

    if-nez v0, :cond_8

    sget-object v0, Lcom/facebook/ads/internal/dto/b;->a:Lcom/facebook/ads/internal/dto/b;

    iput-object v0, p0, Lcom/facebook/ads/internal/dto/e;->c:Lcom/facebook/ads/internal/dto/b;

    :cond_8
    sget-object v0, Lcom/facebook/ads/internal/dto/e$1;->a:[I

    iget-object v1, p0, Lcom/facebook/ads/internal/dto/e;->c:Lcom/facebook/ads/internal/dto/b;

    invoke-virtual {v1}, Lcom/facebook/ads/internal/dto/b;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_2a

    sget-object v0, Lcom/facebook/ads/internal/server/AdPlacementType;->UNKNOWN:Lcom/facebook/ads/internal/server/AdPlacementType;

    iput-object v0, p0, Lcom/facebook/ads/internal/dto/e;->b:Lcom/facebook/ads/internal/server/AdPlacementType;

    :goto_19
    return-void

    :pswitch_1a
    sget-object v0, Lcom/facebook/ads/internal/server/AdPlacementType;->INTERSTITIAL:Lcom/facebook/ads/internal/server/AdPlacementType;

    iput-object v0, p0, Lcom/facebook/ads/internal/dto/e;->b:Lcom/facebook/ads/internal/server/AdPlacementType;

    goto :goto_19

    :pswitch_1f
    sget-object v0, Lcom/facebook/ads/internal/server/AdPlacementType;->BANNER:Lcom/facebook/ads/internal/server/AdPlacementType;

    iput-object v0, p0, Lcom/facebook/ads/internal/dto/e;->b:Lcom/facebook/ads/internal/server/AdPlacementType;

    goto :goto_19

    :pswitch_24
    sget-object v0, Lcom/facebook/ads/internal/server/AdPlacementType;->NATIVE:Lcom/facebook/ads/internal/server/AdPlacementType;

    iput-object v0, p0, Lcom/facebook/ads/internal/dto/e;->b:Lcom/facebook/ads/internal/server/AdPlacementType;

    goto :goto_19

    nop

    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_1a
        :pswitch_1f
        :pswitch_24
    .end packed-switch
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/dto/e;->a:Ljava/lang/String;

    return-object v0
.end method

.method public b()Lcom/facebook/ads/internal/dto/b;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/dto/e;->c:Lcom/facebook/ads/internal/dto/b;

    return-object v0
.end method

.method public c()Lcom/facebook/ads/AdSize;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/dto/e;->i:Lcom/facebook/ads/AdSize;

    return-object v0
.end method

.method public d()I
    .registers 2

    iget v0, p0, Lcom/facebook/ads/internal/dto/e;->h:I

    return v0
.end method

.method public e()Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v0, "PLACEMENT_ID"

    iget-object v1, p0, Lcom/facebook/ads/internal/dto/e;->a:Ljava/lang/String;

    invoke-direct {p0, v2, v0, v1}, Lcom/facebook/ads/internal/dto/e;->a(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/dto/e;->b:Lcom/facebook/ads/internal/server/AdPlacementType;

    sget-object v1, Lcom/facebook/ads/internal/server/AdPlacementType;->UNKNOWN:Lcom/facebook/ads/internal/server/AdPlacementType;

    if-eq v0, v1, :cond_21

    const-string v0, "PLACEMENT_TYPE"

    iget-object v1, p0, Lcom/facebook/ads/internal/dto/e;->b:Lcom/facebook/ads/internal/server/AdPlacementType;

    invoke-virtual {v1}, Lcom/facebook/ads/internal/server/AdPlacementType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v2, v0, v1}, Lcom/facebook/ads/internal/dto/e;->a(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :cond_21
    iget-object v0, p0, Lcom/facebook/ads/internal/dto/e;->d:Landroid/content/Context;

    invoke-static {v0}, Lcom/facebook/ads/internal/dto/e;->b(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4b

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {p0, v2, v1, v0}, Lcom/facebook/ads/internal/dto/e;->a(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2f

    :cond_4b
    iget-object v0, p0, Lcom/facebook/ads/internal/dto/e;->i:Lcom/facebook/ads/AdSize;

    if-eqz v0, :cond_6d

    const-string v0, "WIDTH"

    iget-object v1, p0, Lcom/facebook/ads/internal/dto/e;->i:Lcom/facebook/ads/AdSize;

    invoke-virtual {v1}, Lcom/facebook/ads/AdSize;->getWidth()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v2, v0, v1}, Lcom/facebook/ads/internal/dto/e;->a(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "HEIGHT"

    iget-object v1, p0, Lcom/facebook/ads/internal/dto/e;->i:Lcom/facebook/ads/AdSize;

    invoke-virtual {v1}, Lcom/facebook/ads/AdSize;->getHeight()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v2, v0, v1}, Lcom/facebook/ads/internal/dto/e;->a(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :cond_6d
    const-string v0, "ADAPTERS"

    iget-object v1, p0, Lcom/facebook/ads/internal/dto/e;->b:Lcom/facebook/ads/internal/server/AdPlacementType;

    invoke-static {v1}, Lcom/facebook/ads/internal/adapters/f;->a(Lcom/facebook/ads/internal/server/AdPlacementType;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v2, v0, v1}, Lcom/facebook/ads/internal/dto/e;->a(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/ads/internal/dto/e;->e:Lcom/facebook/ads/internal/e;

    if-eqz v0, :cond_8b

    const-string v0, "TEMPLATE_ID"

    iget-object v1, p0, Lcom/facebook/ads/internal/dto/e;->e:Lcom/facebook/ads/internal/e;

    invoke-virtual {v1}, Lcom/facebook/ads/internal/e;->a()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v2, v0, v1}, Lcom/facebook/ads/internal/dto/e;->a(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :cond_8b
    iget-object v0, p0, Lcom/facebook/ads/internal/dto/e;->g:Lcom/facebook/ads/internal/c;

    if-eqz v0, :cond_9e

    const-string v0, "REQUEST_TYPE"

    iget-object v1, p0, Lcom/facebook/ads/internal/dto/e;->g:Lcom/facebook/ads/internal/c;

    invoke-virtual {v1}, Lcom/facebook/ads/internal/c;->a()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v2, v0, v1}, Lcom/facebook/ads/internal/dto/e;->a(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :cond_9e
    iget-boolean v0, p0, Lcom/facebook/ads/internal/dto/e;->f:Z

    if-eqz v0, :cond_a9

    const-string v0, "TEST_MODE"

    const-string v1, "1"

    invoke-direct {p0, v2, v0, v1}, Lcom/facebook/ads/internal/dto/e;->a(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :cond_a9
    iget v0, p0, Lcom/facebook/ads/internal/dto/e;->h:I

    if-eqz v0, :cond_b8

    const-string v0, "NUM_ADS_REQUESTED"

    iget v1, p0, Lcom/facebook/ads/internal/dto/e;->h:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v2, v0, v1}, Lcom/facebook/ads/internal/dto/e;->a(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    :cond_b8
    const-string v0, "CLIENT_EVENTS"

    invoke-static {}, Lcom/facebook/ads/internal/util/c;->a()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v2, v0, v1}, Lcom/facebook/ads/internal/dto/e;->a(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    return-object v2
.end method
