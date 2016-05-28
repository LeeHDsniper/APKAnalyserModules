.class public Lcom/facebook/ads/internal/f;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/ads/internal/f$a;,
        Lcom/facebook/ads/internal/f$b;
    }
.end annotation


# static fields
.field public static final a:Ljava/lang/String;


# instance fields
.field private final b:Ljava/lang/String;

.field private final c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lcom/facebook/ads/internal/f;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/f;->a:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/ads/internal/f;->b:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/facebook/ads/internal/f;->c:Z

    return-void
.end method

.method private static a(Landroid/content/Context;)Lcom/facebook/ads/internal/f;
    .registers 8

    const/4 v5, 0x1

    const/4 v1, 0x0

    const/4 v6, 0x0

    const-string v0, "com.google.android.gms.common.GooglePlayServicesUtil"

    const-string v2, "isGooglePlayServicesAvailable"

    new-array v3, v5, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    aput-object v4, v3, v6

    invoke-static {v0, v2, v3}, Lcom/facebook/ads/internal/util/g;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    if-nez v0, :cond_15

    move-object v0, v1

    :goto_14
    return-object v0

    :cond_15
    new-array v2, v5, [Ljava/lang/Object;

    aput-object p0, v2, v6

    invoke-static {v1, v0, v2}, Lcom/facebook/ads/internal/util/g;->a(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_27

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eqz v0, :cond_29

    :cond_27
    move-object v0, v1

    goto :goto_14

    :cond_29
    const-string v0, "com.google.android.gms.ads.identifier.AdvertisingIdClient"

    const-string v2, "getAdvertisingIdInfo"

    new-array v3, v5, [Ljava/lang/Class;

    const-class v4, Landroid/content/Context;

    aput-object v4, v3, v6

    invoke-static {v0, v2, v3}, Lcom/facebook/ads/internal/util/g;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    if-nez v0, :cond_3b

    move-object v0, v1

    goto :goto_14

    :cond_3b
    new-array v2, v5, [Ljava/lang/Object;

    aput-object p0, v2, v6

    invoke-static {v1, v0, v2}, Lcom/facebook/ads/internal/util/g;->a(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_47

    move-object v0, v1

    goto :goto_14

    :cond_47
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v3, "getId"

    new-array v4, v6, [Ljava/lang/Class;

    invoke-static {v0, v3, v4}, Lcom/facebook/ads/internal/util/g;->a(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "isLimitAdTrackingEnabled"

    new-array v5, v6, [Ljava/lang/Class;

    invoke-static {v3, v4, v5}, Lcom/facebook/ads/internal/util/g;->a(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    if-eqz v0, :cond_63

    if-nez v3, :cond_65

    :cond_63
    move-object v0, v1

    goto :goto_14

    :cond_65
    new-array v1, v6, [Ljava/lang/Object;

    invoke-static {v2, v0, v1}, Lcom/facebook/ads/internal/util/g;->a(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-array v1, v6, [Ljava/lang/Object;

    invoke-static {v2, v3, v1}, Lcom/facebook/ads/internal/util/g;->a(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    new-instance v2, Lcom/facebook/ads/internal/f;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-direct {v2, v0, v1}, Lcom/facebook/ads/internal/f;-><init>(Ljava/lang/String;Z)V

    move-object v0, v2

    goto :goto_14
.end method

.method public static a(Landroid/content/Context;Lcom/facebook/ads/internal/util/g$a;)Lcom/facebook/ads/internal/f;
    .registers 5

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_12

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot get advertising info on main thread."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_12
    if-eqz p1, :cond_26

    iget-object v0, p1, Lcom/facebook/ads/internal/util/g$a;->b:Ljava/lang/String;

    invoke-static {v0}, Lcom/facebook/ads/internal/util/s;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_26

    new-instance v0, Lcom/facebook/ads/internal/f;

    iget-object v1, p1, Lcom/facebook/ads/internal/util/g$a;->b:Ljava/lang/String;

    iget-boolean v2, p1, Lcom/facebook/ads/internal/util/g$a;->c:Z

    invoke-direct {v0, v1, v2}, Lcom/facebook/ads/internal/f;-><init>(Ljava/lang/String;Z)V

    :cond_25
    :goto_25
    return-object v0

    :cond_26
    invoke-static {p0}, Lcom/facebook/ads/internal/f;->a(Landroid/content/Context;)Lcom/facebook/ads/internal/f;

    move-result-object v0

    if-nez v0, :cond_25

    invoke-static {p0}, Lcom/facebook/ads/internal/f;->b(Landroid/content/Context;)Lcom/facebook/ads/internal/f;

    move-result-object v0

    goto :goto_25
.end method

.method private static b(Landroid/content/Context;)Lcom/facebook/ads/internal/f;
    .registers 6

    const/4 v1, 0x0

    new-instance v2, Lcom/facebook/ads/internal/f$b;

    invoke-direct {v2, v1}, Lcom/facebook/ads/internal/f$b;-><init>(Lcom/facebook/ads/internal/f$1;)V

    new-instance v0, Landroid/content/Intent;

    const-string v3, "com.google.android.gms.ads.identifier.service.START"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v3, "com.google.android.gms"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const/4 v3, 0x1

    invoke-virtual {p0, v0, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    if-eqz v0, :cond_3e

    :try_start_19
    new-instance v3, Lcom/facebook/ads/internal/f$a;

    invoke-virtual {v2}, Lcom/facebook/ads/internal/f$b;->a()Landroid/os/IBinder;

    move-result-object v0

    invoke-direct {v3, v0}, Lcom/facebook/ads/internal/f$a;-><init>(Landroid/os/IBinder;)V

    new-instance v0, Lcom/facebook/ads/internal/f;

    invoke-virtual {v3}, Lcom/facebook/ads/internal/f$a;->a()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lcom/facebook/ads/internal/f$a;->b()Z

    move-result v3

    invoke-direct {v0, v4, v3}, Lcom/facebook/ads/internal/f;-><init>(Ljava/lang/String;Z)V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_2f} :catch_33
    .catchall {:try_start_19 .. :try_end_2f} :catchall_40

    invoke-virtual {p0, v2}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    :goto_32
    return-object v0

    :catch_33
    move-exception v0

    :try_start_34
    sget-object v3, Lcom/facebook/ads/internal/f;->a:Ljava/lang/String;

    const-string v4, "Unable to get advertising id from service"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3b
    .catchall {:try_start_34 .. :try_end_3b} :catchall_40

    invoke-virtual {p0, v2}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    :cond_3e
    move-object v0, v1

    goto :goto_32

    :catchall_40
    move-exception v0

    invoke-virtual {p0, v2}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    throw v0
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/facebook/ads/internal/f;->b:Ljava/lang/String;

    return-object v0
.end method

.method public b()Z
    .registers 2

    iget-boolean v0, p0, Lcom/facebook/ads/internal/f;->c:Z

    return v0
.end method
