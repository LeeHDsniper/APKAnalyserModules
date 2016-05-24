.class public Lcom/facebook/ads/internal/server/a;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/ads/internal/server/a$a;
    }
.end annotation


# static fields
.field private static final g:Lcom/facebook/ads/internal/util/p;

.field private static final h:Ljava/util/concurrent/ThreadPoolExecutor;


# instance fields
.field a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Lcom/facebook/ads/internal/server/b;

.field private c:Lcom/facebook/ads/internal/server/a$a;

.field private d:Lcom/facebook/ads/internal/dto/e;

.field private e:Lcom/facebook/ads/internal/http/a;

.field private final f:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/facebook/ads/internal/util/p;

    invoke-direct {v0}, Lcom/facebook/ads/internal/util/p;-><init>()V

    sput-object v0, Lcom/facebook/ads/internal/server/a;->g:Lcom/facebook/ads/internal/util/p;

    sget-object v0, Lcom/facebook/ads/internal/server/a;->g:Lcom/facebook/ads/internal/util/p;

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sput-object v0, Lcom/facebook/ads/internal/server/a;->h:Ljava/util/concurrent/ThreadPoolExecutor;

    return-void
.end method

.method public constructor <init>()V
    .registers 5

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/facebook/ads/internal/server/b;->a()Lcom/facebook/ads/internal/server/b;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/ads/internal/server/a;->b:Lcom/facebook/ads/internal/server/b;

    invoke-static {}, Lcom/facebook/ads/AdSettings;->getUrlPrefix()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/facebook/ads/internal/util/AdInternalSettings;->shouldUseLiveRailEndpoint()Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-static {v0}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_20

    const-string v0, "https://ad6.liverail.com/"

    :goto_1d
    iput-object v0, p0, Lcom/facebook/ads/internal/server/a;->f:Ljava/lang/String;

    :goto_1f
    return-void

    :cond_20
    const-string v1, "https://ad6.%s.liverail.com/"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1d

    :cond_2b
    invoke-static {v0}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_36

    const-string v0, "https://graph.facebook.com/network_ads_common/"

    :goto_33
    iput-object v0, p0, Lcom/facebook/ads/internal/server/a;->f:Ljava/lang/String;

    goto :goto_1f

    :cond_36
    const-string v1, "https://graph.%s.facebook.com/network_ads_common/"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_33
.end method

.method static synthetic a(Lcom/facebook/ads/internal/server/a;Lcom/facebook/ads/internal/http/a;)Lcom/facebook/ads/internal/http/a;
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/internal/server/a;->e:Lcom/facebook/ads/internal/http/a;

    return-object p1
.end method

.method static synthetic a(Lcom/facebook/ads/internal/server/a;)Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/server/a;->f:Ljava/lang/String;

    return-object v0
.end method

.method private a(Lcom/facebook/ads/internal/b;)V
    .registers 4

    iget-object v0, p0, Lcom/facebook/ads/internal/server/a;->c:Lcom/facebook/ads/internal/server/a$a;

    if-eqz v0, :cond_15

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/facebook/ads/internal/server/a$4;

    invoke-direct {v1, p0, p1}, Lcom/facebook/ads/internal/server/a$4;-><init>(Lcom/facebook/ads/internal/server/a;Lcom/facebook/ads/internal/b;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_15
    invoke-virtual {p0}, Lcom/facebook/ads/internal/server/a;->a()V

    return-void
.end method

.method static synthetic a(Lcom/facebook/ads/internal/server/a;Lcom/facebook/ads/internal/b;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/facebook/ads/internal/server/a;->a(Lcom/facebook/ads/internal/b;)V

    return-void
.end method

.method static synthetic a(Lcom/facebook/ads/internal/server/a;Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/facebook/ads/internal/server/a;->a(Ljava/lang/String;)V

    return-void
.end method

.method private a(Lcom/facebook/ads/internal/server/d;)V
    .registers 4

    iget-object v0, p0, Lcom/facebook/ads/internal/server/a;->c:Lcom/facebook/ads/internal/server/a$a;

    if-eqz v0, :cond_15

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/facebook/ads/internal/server/a$3;

    invoke-direct {v1, p0, p1}, Lcom/facebook/ads/internal/server/a$3;-><init>(Lcom/facebook/ads/internal/server/a;Lcom/facebook/ads/internal/server/d;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_15
    invoke-virtual {p0}, Lcom/facebook/ads/internal/server/a;->a()V

    return-void
.end method

.method private a(Ljava/lang/String;)V
    .registers 7

    :try_start_0
    iget-object v0, p0, Lcom/facebook/ads/internal/server/a;->b:Lcom/facebook/ads/internal/server/b;

    invoke-virtual {v0, p1}, Lcom/facebook/ads/internal/server/b;->a(Ljava/lang/String;)Lcom/facebook/ads/internal/server/c;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/ads/internal/server/c;->b()Lcom/facebook/ads/internal/dto/c;

    move-result-object v1

    if-eqz v1, :cond_19

    invoke-virtual {v1}, Lcom/facebook/ads/internal/dto/c;->a()Lcom/facebook/ads/internal/dto/d;

    move-result-object v2

    invoke-virtual {v2}, Lcom/facebook/ads/internal/dto/d;->c()J

    move-result-wide v2

    iget-object v4, p0, Lcom/facebook/ads/internal/server/a;->d:Lcom/facebook/ads/internal/dto/e;

    invoke-static {v2, v3, v4}, Lcom/facebook/ads/internal/util/d;->a(JLcom/facebook/ads/internal/dto/e;)V

    :cond_19
    sget-object v2, Lcom/facebook/ads/internal/server/a$5;->a:[I

    invoke-virtual {v0}, Lcom/facebook/ads/internal/server/c;->a()Lcom/facebook/ads/internal/server/c$a;

    move-result-object v3

    invoke-virtual {v3}, Lcom/facebook/ads/internal/server/c$a;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_6c

    sget-object v0, Lcom/facebook/ads/internal/AdErrorType;->UNKNOWN_RESPONSE:Lcom/facebook/ads/internal/AdErrorType;

    invoke-virtual {v0, p1}, Lcom/facebook/ads/internal/AdErrorType;->getAdErrorWrapper(Ljava/lang/String;)Lcom/facebook/ads/internal/b;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/facebook/ads/internal/server/a;->a(Lcom/facebook/ads/internal/b;)V

    :goto_31
    return-void

    :pswitch_32
    check-cast v0, Lcom/facebook/ads/internal/server/d;

    if-eqz v1, :cond_45

    invoke-virtual {v1}, Lcom/facebook/ads/internal/dto/c;->a()Lcom/facebook/ads/internal/dto/d;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/ads/internal/dto/d;->d()Z

    move-result v1

    if-eqz v1, :cond_45

    iget-object v1, p0, Lcom/facebook/ads/internal/server/a;->d:Lcom/facebook/ads/internal/dto/e;

    invoke-static {p1, v1}, Lcom/facebook/ads/internal/util/d;->a(Ljava/lang/String;Lcom/facebook/ads/internal/dto/e;)V

    :cond_45
    invoke-direct {p0, v0}, Lcom/facebook/ads/internal/server/a;->a(Lcom/facebook/ads/internal/server/d;)V
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_48} :catch_49

    goto :goto_31

    :catch_49
    move-exception v0

    sget-object v1, Lcom/facebook/ads/internal/AdErrorType;->PARSER_FAILURE:Lcom/facebook/ads/internal/AdErrorType;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/facebook/ads/internal/AdErrorType;->getAdErrorWrapper(Ljava/lang/String;)Lcom/facebook/ads/internal/b;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/facebook/ads/internal/server/a;->a(Lcom/facebook/ads/internal/b;)V

    goto :goto_31

    :pswitch_58
    :try_start_58
    check-cast v0, Lcom/facebook/ads/internal/server/e;

    invoke-virtual {v0}, Lcom/facebook/ads/internal/server/e;->c()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/facebook/ads/internal/AdErrorType;->ERROR_MESSAGE:Lcom/facebook/ads/internal/AdErrorType;

    if-eqz v0, :cond_63

    move-object p1, v0

    :cond_63
    invoke-virtual {v1, p1}, Lcom/facebook/ads/internal/AdErrorType;->getAdErrorWrapper(Ljava/lang/String;)Lcom/facebook/ads/internal/b;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/facebook/ads/internal/server/a;->a(Lcom/facebook/ads/internal/b;)V
    :try_end_6a
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_6a} :catch_49

    goto :goto_31

    nop

    :pswitch_data_6c
    .packed-switch 0x1
        :pswitch_32
        :pswitch_58
    .end packed-switch
.end method

.method private a(Landroid/content/Context;)Z
    .registers 4

    const/4 v1, 0x1

    const-string v0, "android.permission.ACCESS_NETWORK_STATE"

    invoke-virtual {p1, v0}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_a

    :goto_9
    return v1

    :cond_a
    const-string v0, "connectivity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_21

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_21

    move v0, v1

    :goto_1f
    move v1, v0

    goto :goto_9

    :cond_21
    const/4 v0, 0x0

    goto :goto_1f
.end method

.method private b()Lcom/facebook/ads/internal/http/c;
    .registers 2

    new-instance v0, Lcom/facebook/ads/internal/server/a$2;

    invoke-direct {v0, p0}, Lcom/facebook/ads/internal/server/a$2;-><init>(Lcom/facebook/ads/internal/server/a;)V

    return-object v0
.end method

.method static synthetic b(Lcom/facebook/ads/internal/server/a;)Lcom/facebook/ads/internal/http/c;
    .registers 2

    invoke-direct {p0}, Lcom/facebook/ads/internal/server/a;->b()Lcom/facebook/ads/internal/http/c;

    move-result-object v0

    return-object v0
.end method

.method static synthetic c(Lcom/facebook/ads/internal/server/a;)Lcom/facebook/ads/internal/http/a;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/server/a;->e:Lcom/facebook/ads/internal/http/a;

    return-object v0
.end method

.method static synthetic d(Lcom/facebook/ads/internal/server/a;)Lcom/facebook/ads/internal/dto/e;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/server/a;->d:Lcom/facebook/ads/internal/dto/e;

    return-object v0
.end method

.method static synthetic e(Lcom/facebook/ads/internal/server/a;)Lcom/facebook/ads/internal/server/b;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/server/a;->b:Lcom/facebook/ads/internal/server/b;

    return-object v0
.end method

.method static synthetic f(Lcom/facebook/ads/internal/server/a;)Lcom/facebook/ads/internal/server/a$a;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/server/a;->c:Lcom/facebook/ads/internal/server/a$a;

    return-object v0
.end method


# virtual methods
.method public a()V
    .registers 3

    iget-object v0, p0, Lcom/facebook/ads/internal/server/a;->e:Lcom/facebook/ads/internal/http/a;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/facebook/ads/internal/server/a;->e:Lcom/facebook/ads/internal/http/a;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/http/a;->a(Z)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/ads/internal/server/a;->e:Lcom/facebook/ads/internal/http/a;

    :cond_d
    return-void
.end method

.method public a(Landroid/content/Context;Lcom/facebook/ads/internal/dto/e;)V
    .registers 6

    invoke-virtual {p0}, Lcom/facebook/ads/internal/server/a;->a()V

    invoke-direct {p0, p1}, Lcom/facebook/ads/internal/server/a;->a(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_16

    new-instance v0, Lcom/facebook/ads/internal/b;

    sget-object v1, Lcom/facebook/ads/internal/AdErrorType;->NETWORK_ERROR:Lcom/facebook/ads/internal/AdErrorType;

    const-string v2, "No network connection"

    invoke-direct {v0, v1, v2}, Lcom/facebook/ads/internal/b;-><init>(Lcom/facebook/ads/internal/AdErrorType;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/facebook/ads/internal/server/a;->a(Lcom/facebook/ads/internal/b;)V

    :goto_15
    return-void

    :cond_16
    iput-object p2, p0, Lcom/facebook/ads/internal/server/a;->d:Lcom/facebook/ads/internal/dto/e;

    invoke-static {p2}, Lcom/facebook/ads/internal/util/d;->a(Lcom/facebook/ads/internal/dto/e;)Z

    move-result v0

    if-eqz v0, :cond_33

    invoke-static {p2}, Lcom/facebook/ads/internal/util/d;->c(Lcom/facebook/ads/internal/dto/e;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_28

    invoke-direct {p0, v0}, Lcom/facebook/ads/internal/server/a;->a(Ljava/lang/String;)V

    goto :goto_15

    :cond_28
    sget-object v0, Lcom/facebook/ads/internal/AdErrorType;->LOAD_TOO_FREQUENTLY:Lcom/facebook/ads/internal/AdErrorType;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/facebook/ads/internal/AdErrorType;->getAdErrorWrapper(Ljava/lang/String;)Lcom/facebook/ads/internal/b;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/facebook/ads/internal/server/a;->a(Lcom/facebook/ads/internal/b;)V

    goto :goto_15

    :cond_33
    sget-object v0, Lcom/facebook/ads/internal/server/a;->h:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, Lcom/facebook/ads/internal/server/a$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/facebook/ads/internal/server/a$1;-><init>(Lcom/facebook/ads/internal/server/a;Landroid/content/Context;Lcom/facebook/ads/internal/dto/e;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    goto :goto_15
.end method

.method public a(Lcom/facebook/ads/internal/server/a$a;)V
    .registers 2

    iput-object p1, p0, Lcom/facebook/ads/internal/server/a;->c:Lcom/facebook/ads/internal/server/a$a;

    return-void
.end method
