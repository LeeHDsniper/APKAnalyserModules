.class public Lcom/facebook/ads/internal/action/c;
.super Lcom/facebook/ads/internal/action/a;


# static fields
.field private static final a:Ljava/lang/String;


# instance fields
.field private final b:Landroid/content/Context;

.field private final c:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lcom/facebook/ads/internal/action/c;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/action/c;->a:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;)V
    .registers 3

    invoke-direct {p0}, Lcom/facebook/ads/internal/action/a;-><init>()V

    iput-object p1, p0, Lcom/facebook/ads/internal/action/c;->b:Landroid/content/Context;

    iput-object p2, p0, Lcom/facebook/ads/internal/action/c;->c:Landroid/net/Uri;

    return-void
.end method

.method private a(Lcom/facebook/ads/internal/util/i;)Landroid/content/Intent;
    .registers 6

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p1}, Lcom/facebook/ads/internal/util/i;->a()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_30

    invoke-virtual {p1}, Lcom/facebook/ads/internal/util/i;->b()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_30

    new-instance v1, Landroid/content/ComponentName;

    invoke-virtual {p1}, Lcom/facebook/ads/internal/util/i;->a()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/facebook/ads/internal/util/i;->b()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    :cond_30
    invoke-virtual {p1}, Lcom/facebook/ads/internal/util/i;->c()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_45

    invoke-virtual {p1}, Lcom/facebook/ads/internal/util/i;->c()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    :cond_45
    return-object v0
.end method

.method private b(Lcom/facebook/ads/internal/util/i;)Landroid/content/Intent;
    .registers 9

    const/4 v1, 0x0

    invoke-virtual {p1}, Lcom/facebook/ads/internal/util/i;->a()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    move-object v0, v1

    :goto_c
    return-object v0

    :cond_d
    iget-object v0, p0, Lcom/facebook/ads/internal/action/c;->b:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/facebook/ads/internal/util/i;->a()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/facebook/ads/internal/util/f;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1b

    move-object v0, v1

    goto :goto_c

    :cond_1b
    invoke-virtual {p1}, Lcom/facebook/ads/internal/util/i;->c()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_41

    const-string v0, "tel:"

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_35

    const-string v0, "telprompt:"

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_41

    :cond_35
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.CALL"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    goto :goto_c

    :cond_41
    iget-object v0, p0, Lcom/facebook/ads/internal/action/c;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p1}, Lcom/facebook/ads/internal/util/i;->b()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_60

    invoke-static {v2}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_60

    invoke-virtual {p1}, Lcom/facebook/ads/internal/util/i;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    goto :goto_c

    :cond_60
    invoke-direct {p0, p1}, Lcom/facebook/ads/internal/action/c;->a(Lcom/facebook/ads/internal/util/i;)Landroid/content/Intent;

    move-result-object v2

    const/high16 v3, 0x10000

    invoke-virtual {v0, v2, v3}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    if-nez v0, :cond_9e

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_74
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_9e

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    iget-object v5, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/facebook/ads/internal/util/i;->a()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_74

    new-instance v4, Landroid/content/ComponentName;

    iget-object v5, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v4, v5, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    :cond_9e
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_aa

    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    if-nez v0, :cond_ad

    :cond_aa
    move-object v0, v1

    goto/16 :goto_c

    :cond_ad
    move-object v0, v2

    goto/16 :goto_c
.end method

.method private f()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/ads/internal/util/i;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/ads/internal/action/c;->c:Landroid/net/Uri;

    const-string v1, "appsite_data"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_16

    const-string v0, "[]"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    :cond_16
    const/4 v0, 0x0

    :cond_17
    :goto_17
    return-object v0

    :cond_18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :try_start_1d
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "android"

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    if-eqz v2, :cond_17

    const/4 v1, 0x0

    :goto_2b
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v1, v3, :cond_17

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-static {v3}, Lcom/facebook/ads/internal/util/i;->a(Lorg/json/JSONObject;)Lcom/facebook/ads/internal/util/i;

    move-result-object v3

    if-eqz v3, :cond_3e

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3e
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_3e} :catch_41

    :cond_3e
    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    :catch_41
    move-exception v1

    sget-object v2, Lcom/facebook/ads/internal/action/c;->a:Ljava/lang/String;

    const-string v3, "Error parsing appsite_data"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_17
.end method


# virtual methods
.method public a()Lcom/facebook/ads/internal/util/b$a;
    .registers 2

    sget-object v0, Lcom/facebook/ads/internal/util/b$a;->a:Lcom/facebook/ads/internal/util/b$a;

    return-object v0
.end method

.method public b()V
    .registers 5

    iget-object v0, p0, Lcom/facebook/ads/internal/action/c;->b:Landroid/content/Context;

    iget-object v1, p0, Lcom/facebook/ads/internal/action/c;->c:Landroid/net/Uri;

    invoke-virtual {p0, v0, v1}, Lcom/facebook/ads/internal/action/c;->a(Landroid/content/Context;Landroid/net/Uri;)V

    invoke-virtual {p0}, Lcom/facebook/ads/internal/action/c;->d()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2c

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_11
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Intent;

    :try_start_1d
    iget-object v2, p0, Lcom/facebook/ads/internal/action/c;->b:Landroid/content/Context;

    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_22} :catch_23

    :goto_22
    return-void

    :catch_23
    move-exception v0

    sget-object v2, Lcom/facebook/ads/internal/action/c;->a:Ljava/lang/String;

    const-string v3, "Failed to open app intent, falling back"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_11

    :cond_2c
    invoke-virtual {p0}, Lcom/facebook/ads/internal/action/c;->e()V

    goto :goto_22
.end method

.method protected c()Landroid/net/Uri;
    .registers 5

    iget-object v0, p0, Lcom/facebook/ads/internal/action/c;->c:Landroid/net/Uri;

    const-string v1, "store_url"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_13

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    :goto_12
    return-object v0

    :cond_13
    iget-object v0, p0, Lcom/facebook/ads/internal/action/c;->c:Landroid/net/Uri;

    const-string v1, "store_id"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "market://details?id=%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_12
.end method

.method protected d()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/facebook/ads/internal/action/c;->f()Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    if-eqz v0, :cond_25

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_f
    :goto_f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/ads/internal/util/i;

    invoke-direct {p0, v0}, Lcom/facebook/ads/internal/action/c;->b(Lcom/facebook/ads/internal/util/i;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_f

    :cond_25
    return-object v1
.end method

.method public e()V
    .registers 6

    const/high16 v4, 0x10000000

    invoke-virtual {p0}, Lcom/facebook/ads/internal/action/c;->c()Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v1, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :try_start_10
    iget-object v0, p0, Lcom/facebook/ads/internal/action/c;->b:Landroid/content/Context;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_15} :catch_16

    :cond_15
    :goto_15
    return-void

    :catch_16
    move-exception v0

    sget-object v1, Lcom/facebook/ads/internal/action/c;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to open market url: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/facebook/ads/internal/action/c;->c:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v0, p0, Lcom/facebook/ads/internal/action/c;->c:Landroid/net/Uri;

    const-string v1, "store_url_web_fallback"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_15

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_15

    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :try_start_53
    iget-object v2, p0, Lcom/facebook/ads/internal/action/c;->b:Landroid/content/Context;

    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_58} :catch_59

    goto :goto_15

    :catch_59
    move-exception v0

    sget-object v2, Lcom/facebook/ads/internal/action/c;->a:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to open fallback url: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_15
.end method
