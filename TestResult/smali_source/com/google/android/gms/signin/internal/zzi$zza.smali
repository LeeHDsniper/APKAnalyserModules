.class Lcom/google/android/gms/signin/internal/zzi$zza;
.super Lcom/google/android/gms/signin/internal/zzd$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/signin/internal/zzi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zza"
.end annotation


# instance fields
.field private final zzaOo:Ljava/util/concurrent/ExecutorService;

.field private final zzade:Lcom/google/android/gms/signin/zze;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/signin/zze;Ljava/util/concurrent/ExecutorService;)V
    .registers 3

    invoke-direct {p0}, Lcom/google/android/gms/signin/internal/zzd$zza;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/signin/internal/zzi$zza;->zzade:Lcom/google/android/gms/signin/zze;

    iput-object p2, p0, Lcom/google/android/gms/signin/internal/zzi$zza;->zzaOo:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/signin/internal/zzi$zza;)Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/signin/internal/zzi$zza;->zzzq()Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;

    move-result-object v0

    return-object v0
.end method

.method private zzzq()Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/signin/internal/zzi$zza;->zzade:Lcom/google/android/gms/signin/zze;

    invoke-virtual {v0}, Lcom/google/android/gms/signin/zze;->zzzq()Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public zza(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/signin/internal/zzf;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/signin/internal/zzi$zza;->zzaOo:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/android/gms/signin/internal/zzi$zza$2;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/google/android/gms/signin/internal/zzi$zza$2;-><init>(Lcom/google/android/gms/signin/internal/zzi$zza;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/signin/internal/zzf;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method

.method public zza(Ljava/lang/String;Ljava/util/List;Lcom/google/android/gms/signin/internal/zzf;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/gms/common/api/Scope;",
            ">;",
            "Lcom/google/android/gms/signin/internal/zzf;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/signin/internal/zzi$zza;->zzaOo:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/google/android/gms/signin/internal/zzi$zza$1;

    invoke-direct {v1, p0, p2, p1, p3}, Lcom/google/android/gms/signin/internal/zzi$zza$1;-><init>(Lcom/google/android/gms/signin/internal/zzi$zza;Ljava/util/List;Ljava/lang/String;Lcom/google/android/gms/signin/internal/zzf;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method