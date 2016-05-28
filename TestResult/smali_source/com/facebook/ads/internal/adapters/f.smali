.class public Lcom/facebook/ads/internal/adapters/f;
.super Ljava/lang/Object;


# static fields
.field private static final a:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/facebook/ads/internal/adapters/h;",
            ">;"
        }
    .end annotation
.end field

.field private static final b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/facebook/ads/internal/server/AdPlacementType;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/facebook/ads/internal/adapters/f;->a:Ljava/util/Set;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/facebook/ads/internal/adapters/f;->b:Ljava/util/Map;

    invoke-static {}, Lcom/facebook/ads/internal/adapters/h;->values()[Lcom/facebook/ads/internal/adapters/h;

    move-result-object v3

    array-length v4, v3

    const/4 v0, 0x0

    move v2, v0

    :goto_15
    if-ge v2, v4, :cond_51

    aget-object v5, v3, v2

    const/4 v0, 0x0

    sget-object v1, Lcom/facebook/ads/internal/adapters/f$1;->a:[I

    iget-object v6, v5, Lcom/facebook/ads/internal/adapters/h;->g:Lcom/facebook/ads/internal/server/AdPlacementType;

    invoke-virtual {v6}, Lcom/facebook/ads/internal/server/AdPlacementType;->ordinal()I

    move-result v6

    aget v1, v1, v6

    packed-switch v1, :pswitch_data_54

    move-object v1, v0

    :goto_28
    if-eqz v1, :cond_41

    iget-object v0, v5, Lcom/facebook/ads/internal/adapters/h;->d:Ljava/lang/Class;

    if-nez v0, :cond_34

    :try_start_2e
    iget-object v6, v5, Lcom/facebook/ads/internal/adapters/h;->e:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_33
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2e .. :try_end_33} :catch_52

    move-result-object v0

    :cond_34
    :goto_34
    if-eqz v0, :cond_41

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_41

    sget-object v0, Lcom/facebook/ads/internal/adapters/f;->a:Ljava/util/Set;

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_41
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_15

    :pswitch_45
    const-class v0, Lcom/facebook/ads/internal/adapters/BannerAdapter;

    move-object v1, v0

    goto :goto_28

    :pswitch_49
    const-class v0, Lcom/facebook/ads/internal/adapters/InterstitialAdapter;

    move-object v1, v0

    goto :goto_28

    :pswitch_4d
    const-class v0, Lcom/facebook/ads/internal/adapters/p;

    move-object v1, v0

    goto :goto_28

    :cond_51
    return-void

    :catch_52
    move-exception v6

    goto :goto_34

    :pswitch_data_54
    .packed-switch 0x1
        :pswitch_45
        :pswitch_49
        :pswitch_4d
    .end packed-switch
.end method

.method public static a(Lcom/facebook/ads/internal/adapters/g;Lcom/facebook/ads/internal/server/AdPlacementType;)Lcom/facebook/ads/internal/adapters/AdAdapter;
    .registers 5

    const/4 v1, 0x0

    :try_start_1
    invoke-static {p0, p1}, Lcom/facebook/ads/internal/adapters/f;->b(Lcom/facebook/ads/internal/adapters/g;Lcom/facebook/ads/internal/server/AdPlacementType;)Lcom/facebook/ads/internal/adapters/h;

    move-result-object v2

    if-eqz v2, :cond_24

    sget-object v0, Lcom/facebook/ads/internal/adapters/f;->a:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    iget-object v0, v2, Lcom/facebook/ads/internal/adapters/h;->d:Ljava/lang/Class;

    if-nez v0, :cond_19

    iget-object v0, v2, Lcom/facebook/ads/internal/adapters/h;->e:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    :cond_19
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/ads/internal/adapters/AdAdapter;
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1f} :catch_20

    :goto_1f
    return-object v0

    :catch_20
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_24
    move-object v0, v1

    goto :goto_1f
.end method

.method public static a(Ljava/lang/String;Lcom/facebook/ads/internal/server/AdPlacementType;)Lcom/facebook/ads/internal/adapters/AdAdapter;
    .registers 3

    invoke-static {p0}, Lcom/facebook/ads/internal/adapters/g;->a(Ljava/lang/String;)Lcom/facebook/ads/internal/adapters/g;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/facebook/ads/internal/adapters/f;->a(Lcom/facebook/ads/internal/adapters/g;Lcom/facebook/ads/internal/server/AdPlacementType;)Lcom/facebook/ads/internal/adapters/AdAdapter;

    move-result-object v0

    return-object v0
.end method

.method public static a(Lcom/facebook/ads/internal/server/AdPlacementType;)Ljava/lang/String;
    .registers 5

    sget-object v0, Lcom/facebook/ads/internal/adapters/f;->b:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    sget-object v0, Lcom/facebook/ads/internal/adapters/f;->b:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_10
    return-object v0

    :cond_11
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    sget-object v0, Lcom/facebook/ads/internal/adapters/f;->a:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1c
    :goto_1c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_36

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/ads/internal/adapters/h;

    iget-object v3, v0, Lcom/facebook/ads/internal/adapters/h;->g:Lcom/facebook/ads/internal/server/AdPlacementType;

    if-ne v3, p0, :cond_1c

    iget-object v0, v0, Lcom/facebook/ads/internal/adapters/h;->f:Lcom/facebook/ads/internal/adapters/g;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/g;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    :cond_36
    const-string v0, ","

    invoke-static {v1, v0}, Lcom/facebook/ads/internal/util/t;->a(Ljava/util/Set;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/facebook/ads/internal/adapters/f;->b:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_10
.end method

.method private static b(Lcom/facebook/ads/internal/adapters/g;Lcom/facebook/ads/internal/server/AdPlacementType;)Lcom/facebook/ads/internal/adapters/h;
    .registers 5

    sget-object v0, Lcom/facebook/ads/internal/adapters/f;->a:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/ads/internal/adapters/h;

    iget-object v2, v0, Lcom/facebook/ads/internal/adapters/h;->f:Lcom/facebook/ads/internal/adapters/g;

    if-ne v2, p0, :cond_6

    iget-object v2, v0, Lcom/facebook/ads/internal/adapters/h;->g:Lcom/facebook/ads/internal/server/AdPlacementType;

    if-ne v2, p1, :cond_6

    :goto_1a
    return-object v0

    :cond_1b
    const/4 v0, 0x0

    goto :goto_1a
.end method
