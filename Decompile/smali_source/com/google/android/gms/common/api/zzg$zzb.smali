.class Lcom/google/android/gms/common/api/zzg$zzb;
.super Lcom/google/android/gms/common/internal/zzt$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/zzg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zzb"
.end annotation


# instance fields
.field private final zzZL:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/google/android/gms/common/api/zzg;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/api/zzg;)V
    .registers 3

    invoke-direct {p0}, Lcom/google/android/gms/common/internal/zzt$zza;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzg$zzb;->zzZL:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public zzb(Lcom/google/android/gms/common/internal/ResolveAccountResponse;)V
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zzb;->zzZL:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/zzg;

    if-nez v0, :cond_b

    :goto_a
    return-void

    :cond_b
    invoke-static {v0}, Lcom/google/android/gms/common/api/zzg;->zzd(Lcom/google/android/gms/common/api/zzg;)Lcom/google/android/gms/common/api/zzi;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/common/api/zzg$zzb$1;

    invoke-direct {v2, p0, v0, v0, p1}, Lcom/google/android/gms/common/api/zzg$zzb$1;-><init>(Lcom/google/android/gms/common/api/zzg$zzb;Lcom/google/android/gms/common/api/zzj;Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/internal/ResolveAccountResponse;)V

    invoke-virtual {v1, v2}, Lcom/google/android/gms/common/api/zzi;->zza(Lcom/google/android/gms/common/api/zzi$zzb;)V

    goto :goto_a
.end method
