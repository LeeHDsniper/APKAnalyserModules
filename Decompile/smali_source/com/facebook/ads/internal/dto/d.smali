.class public Lcom/facebook/ads/internal/dto/d;
.super Ljava/lang/Object;


# static fields
.field private static final k:Lcom/facebook/ads/internal/server/AdPlacementType;


# instance fields
.field protected a:Lcom/facebook/ads/internal/server/AdPlacementType;

.field protected b:I

.field protected c:I

.field protected d:I

.field protected e:I

.field protected f:I

.field protected g:I

.field protected h:Z

.field public i:I

.field public j:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lcom/facebook/ads/internal/server/AdPlacementType;->UNKNOWN:Lcom/facebook/ads/internal/server/AdPlacementType;

    sput-object v0, Lcom/facebook/ads/internal/dto/d;->k:Lcom/facebook/ads/internal/server/AdPlacementType;

    return-void
.end method

.method private constructor <init>(Ljava/util/Map;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v4, 0x1

    const/4 v3, -0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/facebook/ads/internal/dto/d;->k:Lcom/facebook/ads/internal/server/AdPlacementType;

    iput-object v0, p0, Lcom/facebook/ads/internal/dto/d;->a:Lcom/facebook/ads/internal/server/AdPlacementType;

    iput v4, p0, Lcom/facebook/ads/internal/dto/d;->b:I

    iput v2, p0, Lcom/facebook/ads/internal/dto/d;->d:I

    const/16 v0, 0x14

    iput v0, p0, Lcom/facebook/ads/internal/dto/d;->e:I

    iput v2, p0, Lcom/facebook/ads/internal/dto/d;->f:I

    const/16 v0, 0x3e8

    iput v0, p0, Lcom/facebook/ads/internal/dto/d;->g:I

    iput-boolean v2, p0, Lcom/facebook/ads/internal/dto/d;->h:Z

    iput v3, p0, Lcom/facebook/ads/internal/dto/d;->i:I

    iput v3, p0, Lcom/facebook/ads/internal/dto/d;->j:I

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_26
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_139

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_13a

    :cond_3f
    move v1, v3

    :goto_40
    packed-switch v1, :pswitch_data_164

    goto :goto_26

    :pswitch_44
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/facebook/ads/internal/server/AdPlacementType;->fromString(Ljava/lang/String;)Lcom/facebook/ads/internal/server/AdPlacementType;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/ads/internal/dto/d;->a:Lcom/facebook/ads/internal/server/AdPlacementType;

    goto :goto_26

    :sswitch_51
    const-string v6, "type"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    move v1, v2

    goto :goto_40

    :sswitch_5b
    const-string v6, "min_viewability_percentage"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    move v1, v4

    goto :goto_40

    :sswitch_65
    const-string v6, "min_viewability_duration"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    const/4 v1, 0x2

    goto :goto_40

    :sswitch_6f
    const-string v6, "refresh"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    const/4 v1, 0x3

    goto :goto_40

    :sswitch_79
    const-string v6, "refresh_threshold"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    const/4 v1, 0x4

    goto :goto_40

    :sswitch_83
    const-string v6, "cacheable"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    const/4 v1, 0x5

    goto :goto_40

    :sswitch_8d
    const-string v6, "placement_width"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    const/4 v1, 0x6

    goto :goto_40

    :sswitch_97
    const-string v6, "placement_height"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    const/4 v1, 0x7

    goto :goto_40

    :sswitch_a1
    const-string v6, "viewability_check_initial_delay"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    const/16 v1, 0x8

    goto :goto_40

    :sswitch_ac
    const-string v6, "viewability_check_interval"

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3f

    const/16 v1, 0x9

    goto :goto_40

    :pswitch_b7
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/facebook/ads/internal/dto/d;->b:I

    goto/16 :goto_26

    :pswitch_c5
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/facebook/ads/internal/dto/d;->c:I

    goto/16 :goto_26

    :pswitch_d3
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/facebook/ads/internal/dto/d;->d:I

    goto/16 :goto_26

    :pswitch_e1
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/facebook/ads/internal/dto/d;->e:I

    goto/16 :goto_26

    :pswitch_ef
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/facebook/ads/internal/dto/d;->h:Z

    goto/16 :goto_26

    :pswitch_101
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/facebook/ads/internal/dto/d;->i:I

    goto/16 :goto_26

    :pswitch_10f
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/facebook/ads/internal/dto/d;->j:I

    goto/16 :goto_26

    :pswitch_11d
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/facebook/ads/internal/dto/d;->f:I

    goto/16 :goto_26

    :pswitch_12b
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/facebook/ads/internal/dto/d;->g:I

    goto/16 :goto_26

    :cond_139
    return-void

    :sswitch_data_13a
    .sparse-switch
        -0x5d1423f9 -> :sswitch_79
        -0x3311a54a -> :sswitch_ac
        -0x20f94c24 -> :sswitch_83
        0x368f3a -> :sswitch_51
        0x279a457b -> :sswitch_65
        0x29c58cc1 -> :sswitch_5b
        0x40b292db -> :sswitch_6f
        0x468b8977 -> :sswitch_a1
        0x599f5fc1 -> :sswitch_97
        0x775623ec -> :sswitch_8d
    .end sparse-switch

    :pswitch_data_164
    .packed-switch 0x0
        :pswitch_44
        :pswitch_b7
        :pswitch_c5
        :pswitch_d3
        :pswitch_e1
        :pswitch_ef
        :pswitch_101
        :pswitch_10f
        :pswitch_11d
        :pswitch_12b
    .end packed-switch
.end method

.method public static a(Lorg/json/JSONObject;)Lcom/facebook/ads/internal/dto/d;
    .registers 5

    if-nez p0, :cond_4

    const/4 v0, 0x0

    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    :cond_25
    new-instance v0, Lcom/facebook/ads/internal/dto/d;

    invoke-direct {v0, v2}, Lcom/facebook/ads/internal/dto/d;-><init>(Ljava/util/Map;)V

    goto :goto_3
.end method


# virtual methods
.method public a()Lcom/facebook/ads/internal/server/AdPlacementType;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/dto/d;->a:Lcom/facebook/ads/internal/server/AdPlacementType;

    return-object v0
.end method

.method public b()J
    .registers 3

    iget v0, p0, Lcom/facebook/ads/internal/dto/d;->d:I

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v0, v0

    return-wide v0
.end method

.method public c()J
    .registers 3

    iget v0, p0, Lcom/facebook/ads/internal/dto/d;->e:I

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v0, v0

    return-wide v0
.end method

.method public d()Z
    .registers 2

    iget-boolean v0, p0, Lcom/facebook/ads/internal/dto/d;->h:Z

    return v0
.end method

.method public e()I
    .registers 2

    iget v0, p0, Lcom/facebook/ads/internal/dto/d;->b:I

    return v0
.end method

.method public f()I
    .registers 2

    iget v0, p0, Lcom/facebook/ads/internal/dto/d;->f:I

    return v0
.end method

.method public g()I
    .registers 2

    iget v0, p0, Lcom/facebook/ads/internal/dto/d;->g:I

    return v0
.end method
