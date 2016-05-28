.class public Lcom/facebook/ads/internal/util/f;
.super Ljava/lang/Object;


# direct methods
.method public static a(Lorg/json/JSONArray;)Ljava/util/Collection;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    if-eqz p0, :cond_8

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-nez v0, :cond_a

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return-object v0

    :cond_a
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    const/4 v0, 0x0

    :goto_10
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_20

    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    :cond_20
    move-object v0, v1

    goto :goto_9
.end method

.method public static a(Landroid/content/Context;Lcom/facebook/ads/internal/adapters/a;)Z
    .registers 7

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-interface {p1}, Lcom/facebook/ads/internal/adapters/a;->a()Lcom/facebook/ads/internal/util/e;

    move-result-object v3

    if-eqz v3, :cond_c

    sget-object v0, Lcom/facebook/ads/internal/util/e;->a:Lcom/facebook/ads/internal/util/e;

    if-ne v3, v0, :cond_d

    :cond_c
    :goto_c
    return v2

    :cond_d
    invoke-interface {p1}, Lcom/facebook/ads/internal/adapters/a;->c()Ljava/util/Collection;

    move-result-object v0

    if-eqz v0, :cond_c

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_c

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1d
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_52

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/facebook/ads/internal/util/f;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1d

    move v0, v1

    :goto_30
    sget-object v4, Lcom/facebook/ads/internal/util/e;->b:Lcom/facebook/ads/internal/util/e;

    if-ne v3, v4, :cond_4e

    move v3, v1

    :goto_35
    if-ne v0, v3, :cond_c

    invoke-interface {p1}, Lcom/facebook/ads/internal/adapters/a;->b()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_50

    new-instance v3, Lcom/facebook/ads/internal/util/o;

    invoke-direct {v3}, Lcom/facebook/ads/internal/util/o;-><init>()V

    new-array v1, v1, [Ljava/lang/String;

    aput-object v0, v1, v2

    invoke-virtual {v3, v1}, Lcom/facebook/ads/internal/util/o;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_c

    :cond_4e
    move v3, v2

    goto :goto_35

    :cond_50
    move v2, v1

    goto :goto_c

    :cond_52
    move v0, v2

    goto :goto_30
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 6

    const/4 v1, 0x1

    const/4 v0, 0x0

    invoke-static {p1}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    :goto_8
    return v0

    :cond_9
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x1

    :try_start_e
    invoke-virtual {v2, p1, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_11
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_e .. :try_end_11} :catch_13

    move v0, v1

    goto :goto_8

    :catch_13
    move-exception v1

    goto :goto_8
.end method
