.class public Lcom/facebook/ads/internal/h;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/facebook/ads/internal/server/a$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/ads/internal/h$c;,
        Lcom/facebook/ads/internal/h$b;,
        Lcom/facebook/ads/internal/h$a;
    }
.end annotation


# static fields
.field private static final b:Ljava/lang/String;


# instance fields
.field protected a:Lcom/facebook/ads/internal/a;

.field private final c:Landroid/content/Context;

.field private final d:Ljava/lang/String;

.field private final e:Lcom/facebook/ads/internal/server/a;

.field private final f:Landroid/os/Handler;

.field private final g:Ljava/lang/Runnable;

.field private final h:Ljava/lang/Runnable;

.field private volatile i:Z

.field private j:Z

.field private volatile k:Z

.field private l:Lcom/facebook/ads/internal/adapters/AdAdapter;

.field private m:Landroid/view/View;

.field private n:Lcom/facebook/ads/internal/dto/c;

.field private o:Lcom/facebook/ads/internal/dto/e;

.field private p:Lcom/facebook/ads/internal/e;

.field private q:Lcom/facebook/ads/internal/c;

.field private r:Lcom/facebook/ads/AdSize;

.field private s:I

.field private final t:Lcom/facebook/ads/internal/h$c;

.field private u:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lcom/facebook/ads/internal/h;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/h;->b:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/ads/internal/e;Lcom/facebook/ads/AdSize;Lcom/facebook/ads/internal/c;IZ)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/ads/internal/h;->c:Landroid/content/Context;

    iput-object p2, p0, Lcom/facebook/ads/internal/h;->d:Ljava/lang/String;

    iput-object p3, p0, Lcom/facebook/ads/internal/h;->p:Lcom/facebook/ads/internal/e;

    iput-object p4, p0, Lcom/facebook/ads/internal/h;->r:Lcom/facebook/ads/AdSize;

    iput-object p5, p0, Lcom/facebook/ads/internal/h;->q:Lcom/facebook/ads/internal/c;

    iput p6, p0, Lcom/facebook/ads/internal/h;->s:I

    new-instance v0, Lcom/facebook/ads/internal/h$c;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/facebook/ads/internal/h$c;-><init>(Lcom/facebook/ads/internal/h;Lcom/facebook/ads/internal/h$1;)V

    iput-object v0, p0, Lcom/facebook/ads/internal/h;->t:Lcom/facebook/ads/internal/h$c;

    new-instance v0, Lcom/facebook/ads/internal/server/a;

    invoke-direct {v0}, Lcom/facebook/ads/internal/server/a;-><init>()V

    iput-object v0, p0, Lcom/facebook/ads/internal/h;->e:Lcom/facebook/ads/internal/server/a;

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->e:Lcom/facebook/ads/internal/server/a;

    invoke-virtual {v0, p0}, Lcom/facebook/ads/internal/server/a;->a(Lcom/facebook/ads/internal/server/a$a;)V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/facebook/ads/internal/h;->f:Landroid/os/Handler;

    new-instance v0, Lcom/facebook/ads/internal/h$a;

    invoke-direct {v0, p0}, Lcom/facebook/ads/internal/h$a;-><init>(Lcom/facebook/ads/internal/h;)V

    iput-object v0, p0, Lcom/facebook/ads/internal/h;->g:Ljava/lang/Runnable;

    new-instance v0, Lcom/facebook/ads/internal/h$b;

    invoke-direct {v0, p0}, Lcom/facebook/ads/internal/h$b;-><init>(Lcom/facebook/ads/internal/h;)V

    iput-object v0, p0, Lcom/facebook/ads/internal/h;->h:Ljava/lang/Runnable;

    iput-boolean p7, p0, Lcom/facebook/ads/internal/h;->j:Z

    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->i()V

    return-void
.end method

.method static synthetic a(Lcom/facebook/ads/internal/h;Landroid/view/View;)Landroid/view/View;
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/internal/h;->m:Landroid/view/View;

    return-object p1
.end method

.method private a(Lcom/facebook/ads/internal/adapters/AdAdapter;)V
    .registers 2

    if-eqz p1, :cond_5

    invoke-interface {p1}, Lcom/facebook/ads/internal/adapters/AdAdapter;->onDestroy()V

    :cond_5
    return-void
.end method

.method static synthetic a(Lcom/facebook/ads/internal/h;)V
    .registers 1

    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->m()V

    return-void
.end method

.method static synthetic a(Lcom/facebook/ads/internal/h;Lcom/facebook/ads/internal/adapters/AdAdapter;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/facebook/ads/internal/h;->a(Lcom/facebook/ads/internal/adapters/AdAdapter;)V

    return-void
.end method

.method static synthetic a(Lcom/facebook/ads/internal/h;Z)Z
    .registers 2

    iput-boolean p1, p0, Lcom/facebook/ads/internal/h;->i:Z

    return p1
.end method

.method static synthetic b(Lcom/facebook/ads/internal/h;Lcom/facebook/ads/internal/adapters/AdAdapter;)Lcom/facebook/ads/internal/adapters/AdAdapter;
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/internal/h;->l:Lcom/facebook/ads/internal/adapters/AdAdapter;

    return-object p1
.end method

.method static synthetic b(Lcom/facebook/ads/internal/h;)V
    .registers 1

    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->o()V

    return-void
.end method

.method static synthetic c(Lcom/facebook/ads/internal/h;)V
    .registers 1

    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->n()V

    return-void
.end method

.method static synthetic d(Lcom/facebook/ads/internal/h;)V
    .registers 1

    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->k()V

    return-void
.end method

.method static synthetic e(Lcom/facebook/ads/internal/h;)Landroid/os/Handler;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->f:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic f(Lcom/facebook/ads/internal/h;)Lcom/facebook/ads/internal/adapters/AdAdapter;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->l:Lcom/facebook/ads/internal/adapters/AdAdapter;

    return-object v0
.end method

.method static synthetic g(Lcom/facebook/ads/internal/h;)Z
    .registers 2

    iget-boolean v0, p0, Lcom/facebook/ads/internal/h;->k:Z

    return v0
.end method

.method static synthetic h(Lcom/facebook/ads/internal/h;)V
    .registers 1

    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->p()V

    return-void
.end method

.method static synthetic i(Lcom/facebook/ads/internal/h;)Lcom/facebook/ads/internal/dto/e;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->o:Lcom/facebook/ads/internal/dto/e;

    return-object v0
.end method

.method private i()V
    .registers 4

    iget-boolean v0, p0, Lcom/facebook/ads/internal/h;->j:Z

    if-eqz v0, :cond_5

    :goto_4
    return-void

    :cond_5
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/facebook/ads/internal/h;->c:Landroid/content/Context;

    iget-object v2, p0, Lcom/facebook/ads/internal/h;->t:Lcom/facebook/ads/internal/h$c;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/ads/internal/h;->u:Z

    goto :goto_4
.end method

.method private j()V
    .registers 3

    iget-boolean v0, p0, Lcom/facebook/ads/internal/h;->u:Z

    if-eqz v0, :cond_e

    :try_start_4
    iget-object v0, p0, Lcom/facebook/ads/internal/h;->c:Landroid/content/Context;

    iget-object v1, p0, Lcom/facebook/ads/internal/h;->t:Lcom/facebook/ads/internal/h$c;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/ads/internal/h;->u:Z
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_e} :catch_f

    :cond_e
    :goto_e
    return-void

    :catch_f
    move-exception v0

    const-string v1, "Error unregistering screen state receiever"

    invoke-static {v0, v1}, Lcom/facebook/ads/internal/util/b;->a(Ljava/lang/Throwable;Ljava/lang/String;)Lcom/facebook/ads/internal/util/b;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/c;->a(Lcom/facebook/ads/internal/util/b;)V

    goto :goto_e
.end method

.method private k()V
    .registers 3

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_12

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Adapter listener must be called on the main thread."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_12
    return-void
.end method

.method private l()Lcom/facebook/ads/internal/server/AdPlacementType;
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->r:Lcom/facebook/ads/AdSize;

    if-nez v0, :cond_7

    sget-object v0, Lcom/facebook/ads/internal/server/AdPlacementType;->NATIVE:Lcom/facebook/ads/internal/server/AdPlacementType;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lcom/facebook/ads/internal/h;->r:Lcom/facebook/ads/AdSize;

    sget-object v1, Lcom/facebook/ads/AdSize;->INTERSTITIAL:Lcom/facebook/ads/AdSize;

    if-ne v0, v1, :cond_10

    sget-object v0, Lcom/facebook/ads/internal/server/AdPlacementType;->INTERSTITIAL:Lcom/facebook/ads/internal/server/AdPlacementType;

    goto :goto_6

    :cond_10
    sget-object v0, Lcom/facebook/ads/internal/server/AdPlacementType;->BANNER:Lcom/facebook/ads/internal/server/AdPlacementType;

    goto :goto_6
.end method

.method private m()V
    .registers 9

    new-instance v0, Lcom/facebook/ads/internal/dto/e;

    iget-object v1, p0, Lcom/facebook/ads/internal/h;->c:Landroid/content/Context;

    iget-object v2, p0, Lcom/facebook/ads/internal/h;->d:Ljava/lang/String;

    iget-object v3, p0, Lcom/facebook/ads/internal/h;->r:Lcom/facebook/ads/AdSize;

    iget-object v4, p0, Lcom/facebook/ads/internal/h;->p:Lcom/facebook/ads/internal/e;

    iget-object v5, p0, Lcom/facebook/ads/internal/h;->q:Lcom/facebook/ads/internal/c;

    iget v6, p0, Lcom/facebook/ads/internal/h;->s:I

    iget-object v7, p0, Lcom/facebook/ads/internal/h;->c:Landroid/content/Context;

    invoke-static {v7}, Lcom/facebook/ads/AdSettings;->isTestMode(Landroid/content/Context;)Z

    move-result v7

    invoke-direct/range {v0 .. v7}, Lcom/facebook/ads/internal/dto/e;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/facebook/ads/AdSize;Lcom/facebook/ads/internal/e;Lcom/facebook/ads/internal/c;IZ)V

    iput-object v0, p0, Lcom/facebook/ads/internal/h;->o:Lcom/facebook/ads/internal/dto/e;

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->e:Lcom/facebook/ads/internal/server/a;

    iget-object v1, p0, Lcom/facebook/ads/internal/h;->c:Landroid/content/Context;

    iget-object v2, p0, Lcom/facebook/ads/internal/h;->o:Lcom/facebook/ads/internal/dto/e;

    invoke-virtual {v0, v1, v2}, Lcom/facebook/ads/internal/server/a;->a(Landroid/content/Context;Lcom/facebook/ads/internal/dto/e;)V

    return-void
.end method

.method private n()V
    .registers 9

    const-wide/16 v6, 0x2710

    iget-object v1, p0, Lcom/facebook/ads/internal/h;->n:Lcom/facebook/ads/internal/dto/c;

    invoke-virtual {v1}, Lcom/facebook/ads/internal/dto/c;->c()Lcom/facebook/ads/internal/dto/a;

    move-result-object v2

    if-nez v2, :cond_1b

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->a:Lcom/facebook/ads/internal/a;

    sget-object v1, Lcom/facebook/ads/internal/AdErrorType;->NO_FILL:Lcom/facebook/ads/internal/AdErrorType;

    const-string v2, ""

    invoke-virtual {v1, v2}, Lcom/facebook/ads/internal/AdErrorType;->getAdErrorWrapper(Ljava/lang/String;)Lcom/facebook/ads/internal/b;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/a;->a(Lcom/facebook/ads/internal/b;)V

    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->o()V

    :goto_1a
    return-void

    :cond_1b
    iget-object v3, v2, Lcom/facebook/ads/internal/dto/a;->b:Ljava/lang/String;

    invoke-virtual {v1}, Lcom/facebook/ads/internal/dto/c;->a()Lcom/facebook/ads/internal/dto/d;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/ads/internal/dto/d;->a()Lcom/facebook/ads/internal/server/AdPlacementType;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/facebook/ads/internal/adapters/f;->a(Ljava/lang/String;Lcom/facebook/ads/internal/server/AdPlacementType;)Lcom/facebook/ads/internal/adapters/AdAdapter;

    move-result-object v0

    if-nez v0, :cond_47

    sget-object v0, Lcom/facebook/ads/internal/h;->b:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adapter does not exist: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->n()V

    goto :goto_1a

    :cond_47
    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->l()Lcom/facebook/ads/internal/server/AdPlacementType;

    move-result-object v3

    invoke-interface {v0}, Lcom/facebook/ads/internal/adapters/AdAdapter;->getPlacementType()Lcom/facebook/ads/internal/server/AdPlacementType;

    move-result-object v4

    if-eq v3, v4, :cond_5f

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->a:Lcom/facebook/ads/internal/a;

    sget-object v1, Lcom/facebook/ads/internal/AdErrorType;->INTERNAL_ERROR:Lcom/facebook/ads/internal/AdErrorType;

    const-string v2, ""

    invoke-virtual {v1, v2}, Lcom/facebook/ads/internal/AdErrorType;->getAdErrorWrapper(Ljava/lang/String;)Lcom/facebook/ads/internal/b;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/a;->a(Lcom/facebook/ads/internal/b;)V

    goto :goto_1a

    :cond_5f
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v1}, Lcom/facebook/ads/internal/dto/c;->a()Lcom/facebook/ads/internal/dto/d;

    move-result-object v1

    const-string v4, "data"

    iget-object v2, v2, Lcom/facebook/ads/internal/dto/a;->c:Lorg/json/JSONObject;

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "definition"

    invoke-interface {v3, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/facebook/ads/internal/h;->o:Lcom/facebook/ads/internal/dto/e;

    if-nez v1, :cond_85

    iget-object v1, p0, Lcom/facebook/ads/internal/h;->a:Lcom/facebook/ads/internal/a;

    sget-object v2, Lcom/facebook/ads/internal/AdErrorType;->UNKNOWN_ERROR:Lcom/facebook/ads/internal/AdErrorType;

    const-string v4, "environment is empty"

    invoke-virtual {v2, v4}, Lcom/facebook/ads/internal/AdErrorType;->getAdErrorWrapper(Ljava/lang/String;)Lcom/facebook/ads/internal/b;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/facebook/ads/internal/a;->a(Lcom/facebook/ads/internal/b;)V

    :cond_85
    sget-object v1, Lcom/facebook/ads/internal/h$7;->a:[I

    invoke-interface {v0}, Lcom/facebook/ads/internal/adapters/AdAdapter;->getPlacementType()Lcom/facebook/ads/internal/server/AdPlacementType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/ads/internal/server/AdPlacementType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_e8

    sget-object v0, Lcom/facebook/ads/internal/h;->b:Ljava/lang/String;

    const-string v1, "attempt unexpected adapter type"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1a

    :pswitch_9d
    check-cast v0, Lcom/facebook/ads/internal/adapters/BannerAdapter;

    new-instance v1, Lcom/facebook/ads/internal/h$1;

    invoke-direct {v1, p0, v0}, Lcom/facebook/ads/internal/h$1;-><init>(Lcom/facebook/ads/internal/h;Lcom/facebook/ads/internal/adapters/BannerAdapter;)V

    iget-object v2, p0, Lcom/facebook/ads/internal/h;->f:Landroid/os/Handler;

    invoke-virtual {v2, v1, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    iget-object v2, p0, Lcom/facebook/ads/internal/h;->c:Landroid/content/Context;

    iget-object v4, p0, Lcom/facebook/ads/internal/h;->r:Lcom/facebook/ads/AdSize;

    new-instance v5, Lcom/facebook/ads/internal/h$2;

    invoke-direct {v5, p0, v1}, Lcom/facebook/ads/internal/h$2;-><init>(Lcom/facebook/ads/internal/h;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v2, v4, v5, v3}, Lcom/facebook/ads/internal/adapters/BannerAdapter;->loadBannerAd(Landroid/content/Context;Lcom/facebook/ads/AdSize;Lcom/facebook/ads/internal/adapters/BannerAdapterListener;Ljava/util/Map;)V

    goto/16 :goto_1a

    :pswitch_b7
    check-cast v0, Lcom/facebook/ads/internal/adapters/InterstitialAdapter;

    new-instance v1, Lcom/facebook/ads/internal/h$3;

    invoke-direct {v1, p0, v0}, Lcom/facebook/ads/internal/h$3;-><init>(Lcom/facebook/ads/internal/h;Lcom/facebook/ads/internal/adapters/InterstitialAdapter;)V

    iget-object v2, p0, Lcom/facebook/ads/internal/h;->f:Landroid/os/Handler;

    invoke-virtual {v2, v1, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    iget-object v2, p0, Lcom/facebook/ads/internal/h;->c:Landroid/content/Context;

    new-instance v4, Lcom/facebook/ads/internal/h$4;

    invoke-direct {v4, p0, v1}, Lcom/facebook/ads/internal/h$4;-><init>(Lcom/facebook/ads/internal/h;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v2, v4, v3}, Lcom/facebook/ads/internal/adapters/InterstitialAdapter;->loadInterstitialAd(Landroid/content/Context;Lcom/facebook/ads/internal/adapters/InterstitialAdapterListener;Ljava/util/Map;)V

    goto/16 :goto_1a

    :pswitch_cf
    check-cast v0, Lcom/facebook/ads/internal/adapters/p;

    new-instance v1, Lcom/facebook/ads/internal/h$5;

    invoke-direct {v1, p0, v0}, Lcom/facebook/ads/internal/h$5;-><init>(Lcom/facebook/ads/internal/h;Lcom/facebook/ads/internal/adapters/p;)V

    iget-object v2, p0, Lcom/facebook/ads/internal/h;->f:Landroid/os/Handler;

    invoke-virtual {v2, v1, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    iget-object v2, p0, Lcom/facebook/ads/internal/h;->c:Landroid/content/Context;

    new-instance v4, Lcom/facebook/ads/internal/h$6;

    invoke-direct {v4, p0, v1}, Lcom/facebook/ads/internal/h$6;-><init>(Lcom/facebook/ads/internal/h;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v2, v4, v3}, Lcom/facebook/ads/internal/adapters/p;->a(Landroid/content/Context;Lcom/facebook/ads/internal/adapters/q;Ljava/util/Map;)V

    goto/16 :goto_1a

    nop

    :pswitch_data_e8
    .packed-switch 0x1
        :pswitch_b7
        :pswitch_9d
        :pswitch_cf
    .end packed-switch
.end method

.method private o()V
    .registers 7

    const-wide/16 v4, 0x3e8

    const/4 v1, 0x1

    iget-boolean v0, p0, Lcom/facebook/ads/internal/h;->j:Z

    if-nez v0, :cond_b

    iget-boolean v0, p0, Lcom/facebook/ads/internal/h;->i:Z

    if-eqz v0, :cond_c

    :cond_b
    :goto_b
    return-void

    :cond_c
    sget-object v0, Lcom/facebook/ads/internal/h$7;->a:[I

    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->l()Lcom/facebook/ads/internal/server/AdPlacementType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/ads/internal/server/AdPlacementType;->ordinal()I

    move-result v2

    aget v0, v0, v2

    packed-switch v0, :pswitch_data_72

    goto :goto_b

    :pswitch_1c
    iget-object v0, p0, Lcom/facebook/ads/internal/h;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/facebook/ads/internal/util/g;->a(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_2b

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->f:Landroid/os/Handler;

    iget-object v2, p0, Lcom/facebook/ads/internal/h;->h:Ljava/lang/Runnable;

    invoke-virtual {v0, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2b
    iget-object v0, p0, Lcom/facebook/ads/internal/h;->n:Lcom/facebook/ads/internal/dto/c;

    if-nez v0, :cond_67

    const-wide/16 v2, 0x7530

    :goto_31
    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_b

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->f:Landroid/os/Handler;

    iget-object v4, p0, Lcom/facebook/ads/internal/h;->g:Ljava/lang/Runnable;

    invoke-virtual {v0, v4, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    iput-boolean v1, p0, Lcom/facebook/ads/internal/h;->i:Z

    goto :goto_b

    :pswitch_41
    iget-object v0, p0, Lcom/facebook/ads/internal/h;->n:Lcom/facebook/ads/internal/dto/c;

    if-nez v0, :cond_5c

    move v0, v1

    :goto_46
    iget-object v2, p0, Lcom/facebook/ads/internal/h;->m:Landroid/view/View;

    if-eqz v2, :cond_2b

    iget-object v2, p0, Lcom/facebook/ads/internal/h;->c:Landroid/content/Context;

    iget-object v3, p0, Lcom/facebook/ads/internal/h;->m:Landroid/view/View;

    invoke-static {v2, v3, v0}, Lcom/facebook/ads/internal/util/g;->a(Landroid/content/Context;Landroid/view/View;I)Z

    move-result v0

    if-nez v0, :cond_2b

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->f:Landroid/os/Handler;

    iget-object v1, p0, Lcom/facebook/ads/internal/h;->h:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_b

    :cond_5c
    iget-object v0, p0, Lcom/facebook/ads/internal/h;->n:Lcom/facebook/ads/internal/dto/c;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/dto/c;->a()Lcom/facebook/ads/internal/dto/d;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/ads/internal/dto/d;->e()I

    move-result v0

    goto :goto_46

    :cond_67
    iget-object v0, p0, Lcom/facebook/ads/internal/h;->n:Lcom/facebook/ads/internal/dto/c;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/dto/c;->a()Lcom/facebook/ads/internal/dto/d;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/ads/internal/dto/d;->b()J

    move-result-wide v2

    goto :goto_31

    :pswitch_data_72
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_41
    .end packed-switch
.end method

.method private p()V
    .registers 3

    iget-boolean v0, p0, Lcom/facebook/ads/internal/h;->i:Z

    if-nez v0, :cond_5

    :goto_4
    return-void

    :cond_5
    iget-object v0, p0, Lcom/facebook/ads/internal/h;->f:Landroid/os/Handler;

    iget-object v1, p0, Lcom/facebook/ads/internal/h;->g:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/ads/internal/h;->i:Z

    goto :goto_4
.end method


# virtual methods
.method public a(Lcom/facebook/ads/internal/a;)V
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/internal/h;->a:Lcom/facebook/ads/internal/a;

    return-void
.end method

.method public a(Lcom/facebook/ads/internal/b;)V
    .registers 6

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->a:Lcom/facebook/ads/internal/a;

    invoke-virtual {v0, p1}, Lcom/facebook/ads/internal/a;->a(Lcom/facebook/ads/internal/b;)V

    iget-boolean v0, p0, Lcom/facebook/ads/internal/h;->j:Z

    if-nez v0, :cond_d

    iget-boolean v0, p0, Lcom/facebook/ads/internal/h;->i:Z

    if-eqz v0, :cond_e

    :cond_d
    :goto_d
    return-void

    :cond_e
    invoke-virtual {p1}, Lcom/facebook/ads/internal/b;->a()Lcom/facebook/ads/internal/AdErrorType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/ads/internal/AdErrorType;->getErrorCode()I

    move-result v0

    packed-switch v0, :pswitch_data_38

    :pswitch_19
    goto :goto_d

    :pswitch_1a
    sget-object v0, Lcom/facebook/ads/internal/h$7;->a:[I

    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->l()Lcom/facebook/ads/internal/server/AdPlacementType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/ads/internal/server/AdPlacementType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_42

    goto :goto_d

    :pswitch_2a
    iget-object v0, p0, Lcom/facebook/ads/internal/h;->f:Landroid/os/Handler;

    iget-object v1, p0, Lcom/facebook/ads/internal/h;->g:Ljava/lang/Runnable;

    const-wide/16 v2, 0x7530

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/ads/internal/h;->i:Z

    goto :goto_d

    nop

    :pswitch_data_38
    .packed-switch 0x3e8
        :pswitch_1a
        :pswitch_19
        :pswitch_1a
    .end packed-switch

    :pswitch_data_42
    .packed-switch 0x2
        :pswitch_2a
    .end packed-switch
.end method

.method public a(Lcom/facebook/ads/internal/server/d;)V
    .registers 4

    invoke-virtual {p1}, Lcom/facebook/ads/internal/server/d;->b()Lcom/facebook/ads/internal/dto/c;

    move-result-object v0

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Lcom/facebook/ads/internal/dto/c;->a()Lcom/facebook/ads/internal/dto/d;

    move-result-object v1

    if-nez v1, :cond_14

    :cond_c
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "invalid placement in response"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_14
    iput-object v0, p0, Lcom/facebook/ads/internal/h;->n:Lcom/facebook/ads/internal/dto/c;

    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->n()V

    return-void
.end method

.method public b()V
    .registers 1

    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->m()V

    return-void
.end method

.method public c()V
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->l:Lcom/facebook/ads/internal/adapters/AdAdapter;

    if-nez v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "no adapter ready to start"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iget-boolean v0, p0, Lcom/facebook/ads/internal/h;->k:Z

    if-eqz v0, :cond_18

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ad already started"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_18
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/ads/internal/h;->k:Z

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->l:Lcom/facebook/ads/internal/adapters/AdAdapter;

    invoke-interface {v0}, Lcom/facebook/ads/internal/adapters/AdAdapter;->getPlacementType()Lcom/facebook/ads/internal/server/AdPlacementType;

    move-result-object v0

    sget-object v1, Lcom/facebook/ads/internal/h$7;->a:[I

    invoke-virtual {v0}, Lcom/facebook/ads/internal/server/AdPlacementType;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_64

    sget-object v0, Lcom/facebook/ads/internal/h;->b:Ljava/lang/String;

    const-string v1, "start unexpected adapter type"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_33
    :goto_33
    return-void

    :pswitch_34
    iget-object v0, p0, Lcom/facebook/ads/internal/h;->l:Lcom/facebook/ads/internal/adapters/AdAdapter;

    check-cast v0, Lcom/facebook/ads/internal/adapters/InterstitialAdapter;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/InterstitialAdapter;->show()Z

    goto :goto_33

    :pswitch_3c
    iget-object v0, p0, Lcom/facebook/ads/internal/h;->m:Landroid/view/View;

    if-eqz v0, :cond_33

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->a:Lcom/facebook/ads/internal/a;

    iget-object v1, p0, Lcom/facebook/ads/internal/h;->m:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/a;->a(Landroid/view/View;)V

    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->o()V

    goto :goto_33

    :pswitch_4b
    iget-object v0, p0, Lcom/facebook/ads/internal/h;->l:Lcom/facebook/ads/internal/adapters/AdAdapter;

    check-cast v0, Lcom/facebook/ads/internal/adapters/p;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/adapters/p;->w()Z

    move-result v1

    if-nez v1, :cond_5d

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ad is not ready or already displayed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5d
    iget-object v1, p0, Lcom/facebook/ads/internal/h;->a:Lcom/facebook/ads/internal/a;

    invoke-virtual {v1, v0}, Lcom/facebook/ads/internal/a;->a(Lcom/facebook/ads/internal/adapters/p;)V

    goto :goto_33

    nop

    :pswitch_data_64
    .packed-switch 0x1
        :pswitch_34
        :pswitch_3c
        :pswitch_4b
    .end packed-switch
.end method

.method public d()V
    .registers 2

    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->j()V

    iget-boolean v0, p0, Lcom/facebook/ads/internal/h;->k:Z

    if-nez v0, :cond_8

    :goto_7
    return-void

    :cond_8
    invoke-direct {p0}, Lcom/facebook/ads/internal/h;->p()V

    iget-object v0, p0, Lcom/facebook/ads/internal/h;->l:Lcom/facebook/ads/internal/adapters/AdAdapter;

    invoke-direct {p0, v0}, Lcom/facebook/ads/internal/h;->a(Lcom/facebook/ads/internal/adapters/AdAdapter;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/ads/internal/h;->m:Landroid/view/View;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/ads/internal/h;->k:Z

    goto :goto_7
.end method
