.class public final Lcom/google/android/gms/common/api/GoogleApiClient$Builder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/GoogleApiClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private zzOY:Landroid/accounts/Account;

.field private zzQl:Ljava/lang/String;

.field private zzYV:Landroid/os/Looper;

.field private final zzYY:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;"
        }
    .end annotation
.end field

.field private zzYZ:I

.field private zzZa:Landroid/view/View;

.field private zzZb:Ljava/lang/String;

.field private final zzZc:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api",
            "<*>;",
            "Lcom/google/android/gms/common/internal/zzf$zza;",
            ">;"
        }
    .end annotation
.end field

.field private final zzZd:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/android/gms/common/api/Api",
            "<*>;",
            "Lcom/google/android/gms/common/api/Api$ApiOptions;",
            ">;"
        }
    .end annotation
.end field

.field private zzZe:Landroid/support/v4/app/FragmentActivity;

.field private zzZf:I

.field private zzZg:I

.field private zzZh:Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

.field private zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

.field private zzZj:Lcom/google/android/gms/common/api/Api$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/common/api/Api$zza",
            "<+",
            "Lcom/google/android/gms/signin/zzd;",
            "Lcom/google/android/gms/signin/zze;",
            ">;"
        }
    .end annotation
.end field

.field private final zzZk:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/common/api/GoogleApiClient$ConnectionCallbacks;",
            ">;"
        }
    .end annotation
.end field

.field private final zzZl:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;",
            ">;"
        }
    .end annotation
.end field

.field private zzZm:Lcom/google/android/gms/signin/zze$zza;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzYY:Ljava/util/Set;

    new-instance v0, Lcom/google/android/gms/internal/zzld;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzld;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZc:Ljava/util/Map;

    new-instance v0, Lcom/google/android/gms/internal/zzld;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzld;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZd:Ljava/util/Map;

    iput v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZf:I

    iput v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZg:I

    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

    sget-object v0, Lcom/google/android/gms/signin/zzb;->zzQg:Lcom/google/android/gms/common/api/Api$zza;

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZj:Lcom/google/android/gms/common/api/Api$zza;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZk:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZl:Ljava/util/ArrayList;

    new-instance v0, Lcom/google/android/gms/signin/zze$zza;

    invoke-direct {v0}, Lcom/google/android/gms/signin/zze$zza;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZm:Lcom/google/android/gms/signin/zze$zza;

    iput-object p1, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzYV:Landroid/os/Looper;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzQl:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZb:Ljava/lang/String;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/common/api/GoogleApiClient$Builder;)Landroid/support/v4/app/FragmentActivity;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZe:Landroid/support/v4/app/FragmentActivity;

    return-object v0
.end method

.method static synthetic zza(Lcom/google/android/gms/common/api/GoogleApiClient$Builder;Lcom/google/android/gms/common/api/zzp;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zza(Lcom/google/android/gms/common/api/zzp;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    return-void
.end method

.method private zza(Lcom/google/android/gms/common/api/zzp;Lcom/google/android/gms/common/api/GoogleApiClient;)V
    .registers 5

    iget v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZf:I

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZh:Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    invoke-virtual {p1, v0, p2, v1}, Lcom/google/android/gms/common/api/zzp;->zza(ILcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    return-void
.end method

.method private zznj()Lcom/google/android/gms/common/api/GoogleApiClient;
    .registers 12

    new-instance v0, Lcom/google/android/gms/common/api/zzi;

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzYV:Landroid/os/Looper;

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzni()Lcom/google/android/gms/common/internal/zzf;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

    iget-object v5, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZj:Lcom/google/android/gms/common/api/Api$zza;

    iget-object v6, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZd:Ljava/util/Map;

    iget-object v7, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZk:Ljava/util/ArrayList;

    iget-object v8, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZl:Ljava/util/ArrayList;

    iget v9, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZf:I

    const/4 v10, -0x1

    invoke-direct/range {v0 .. v10}, Lcom/google/android/gms/common/api/zzi;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/GoogleApiAvailability;Lcom/google/android/gms/common/api/Api$zza;Ljava/util/Map;Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZe:Landroid/support/v4/app/FragmentActivity;

    invoke-static {v1}, Lcom/google/android/gms/common/api/zzp;->zza(Landroid/support/v4/app/FragmentActivity;)Lcom/google/android/gms/common/api/zzp;

    move-result-object v1

    if-nez v1, :cond_3a

    new-instance v1, Landroid/os/Handler;

    iget-object v2, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/google/android/gms/common/api/GoogleApiClient$Builder$1;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder$1;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient$Builder;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_39
    return-object v0

    :cond_3a
    invoke-direct {p0, v1, v0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zza(Lcom/google/android/gms/common/api/zzp;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    goto :goto_39
.end method

.method private zznk()Lcom/google/android/gms/common/api/GoogleApiClient;
    .registers 13

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZe:Landroid/support/v4/app/FragmentActivity;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzq;->zzc(Landroid/support/v4/app/FragmentActivity;)Lcom/google/android/gms/common/api/zzq;

    move-result-object v11

    iget v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZg:I

    invoke-virtual {v11, v0}, Lcom/google/android/gms/common/api/zzq;->zzbj(I)Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v0

    if-nez v0, :cond_2c

    new-instance v0, Lcom/google/android/gms/common/api/zzi;

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzYV:Landroid/os/Looper;

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzni()Lcom/google/android/gms/common/internal/zzf;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

    iget-object v5, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZj:Lcom/google/android/gms/common/api/Api$zza;

    iget-object v6, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZd:Ljava/util/Map;

    iget-object v7, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZk:Ljava/util/ArrayList;

    iget-object v8, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZl:Ljava/util/ArrayList;

    const/4 v9, -0x1

    iget v10, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZg:I

    invoke-direct/range {v0 .. v10}, Lcom/google/android/gms/common/api/zzi;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/GoogleApiAvailability;Lcom/google/android/gms/common/api/Api$zza;Ljava/util/Map;Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    :cond_2c
    iget v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZg:I

    iget-object v2, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZh:Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    invoke-virtual {v11, v1, v0, v2}, Lcom/google/android/gms/common/api/zzq;->zza(ILcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V

    return-object v0
.end method


# virtual methods
.method public addApi(Lcom/google/android/gms/common/api/Api;)Lcom/google/android/gms/common/api/GoogleApiClient$Builder;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/Api",
            "<+",
            "Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;",
            ">;)",
            "Lcom/google/android/gms/common/api/GoogleApiClient$Builder;"
        }
    .end annotation

    .prologue
    .local p1, "api":Lcom/google/android/gms/common/api/Api;, "Lcom/google/android/gms/common/api/Api<+Lcom/google/android/gms/common/api/Api$ApiOptions$NotRequiredOptions;>;"
    const/4 v2, 0x0

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZd:Ljava/util/Map;

    invoke-interface {v0, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzYY:Ljava/util/Set;

    invoke-virtual {p1}, Lcom/google/android/gms/common/api/Api;->zznb()Lcom/google/android/gms/common/api/Api$zza;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/google/android/gms/common/api/Api$zza;->zzl(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    return-object p0
.end method

.method public build()Lcom/google/android/gms/common/api/GoogleApiClient;
    .registers 12

    const/4 v9, -0x1

    iget-object v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZd:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_18

    const/4 v0, 0x1

    :goto_a
    const-string v1, "must call addApi() to add at least one API"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zzb(ZLjava/lang/Object;)V

    iget v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZf:I

    if-ltz v0, :cond_1a

    invoke-direct {p0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zznj()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v0

    :goto_17
    return-object v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_a

    :cond_1a
    iget v0, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZg:I

    if-ltz v0, :cond_23

    invoke-direct {p0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zznk()Lcom/google/android/gms/common/api/GoogleApiClient;

    move-result-object v0

    goto :goto_17

    :cond_23
    new-instance v0, Lcom/google/android/gms/common/api/zzi;

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzYV:Landroid/os/Looper;

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzni()Lcom/google/android/gms/common/internal/zzf;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZi:Lcom/google/android/gms/common/GoogleApiAvailability;

    iget-object v5, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZj:Lcom/google/android/gms/common/api/Api$zza;

    iget-object v6, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZd:Ljava/util/Map;

    iget-object v7, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZk:Ljava/util/ArrayList;

    iget-object v8, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZl:Ljava/util/ArrayList;

    move v10, v9

    invoke-direct/range {v0 .. v10}, Lcom/google/android/gms/common/api/zzi;-><init>(Landroid/content/Context;Landroid/os/Looper;Lcom/google/android/gms/common/internal/zzf;Lcom/google/android/gms/common/GoogleApiAvailability;Lcom/google/android/gms/common/api/Api$zza;Ljava/util/Map;Ljava/util/ArrayList;Ljava/util/ArrayList;II)V

    goto :goto_17
.end method

.method public zzni()Lcom/google/android/gms/common/internal/zzf;
    .registers 10

    new-instance v0, Lcom/google/android/gms/common/internal/zzf;

    iget-object v1, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzOY:Landroid/accounts/Account;

    iget-object v2, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzYY:Ljava/util/Set;

    iget-object v3, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZc:Ljava/util/Map;

    iget v4, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzYZ:I

    iget-object v5, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZa:Landroid/view/View;

    iget-object v6, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzQl:Ljava/lang/String;

    iget-object v7, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZb:Ljava/lang/String;

    iget-object v8, p0, Lcom/google/android/gms/common/api/GoogleApiClient$Builder;->zzZm:Lcom/google/android/gms/signin/zze$zza;

    invoke-virtual {v8}, Lcom/google/android/gms/signin/zze$zza;->zzzr()Lcom/google/android/gms/signin/zze;

    move-result-object v8

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/common/internal/zzf;-><init>(Landroid/accounts/Account;Ljava/util/Set;Ljava/util/Map;ILandroid/view/View;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/signin/zze;)V

    return-object v0
.end method
