.class Lcom/google/android/gms/common/api/zzg$zzc;
.super Lcom/google/android/gms/common/api/zzg$zzi;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/zzg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "zzc"
.end annotation


# instance fields
.field final synthetic zzZK:Lcom/google/android/gms/common/api/zzg;


# direct methods
.method private constructor <init>(Lcom/google/android/gms/common/api/zzg;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzg$zzc;->zzZK:Lcom/google/android/gms/common/api/zzg;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/common/api/zzg$zzi;-><init>(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/api/zzg$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/common/api/zzg;Lcom/google/android/gms/common/api/zzg$1;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/google/android/gms/common/api/zzg$zzc;-><init>(Lcom/google/android/gms/common/api/zzg;)V

    return-void
.end method


# virtual methods
.method public zznn()V
    .registers 6

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzg$zzc;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v0}, Lcom/google/android/gms/common/api/zzg;->zzf(Lcom/google/android/gms/common/api/zzg;)Lcom/google/android/gms/signin/zzd;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzg$zzc;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v1}, Lcom/google/android/gms/common/api/zzg;->zzg(Lcom/google/android/gms/common/api/zzg;)Lcom/google/android/gms/common/internal/zzp;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzg$zzc;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-static {v2}, Lcom/google/android/gms/common/api/zzg;->zzd(Lcom/google/android/gms/common/api/zzg;)Lcom/google/android/gms/common/api/zzi;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/gms/common/api/zzi;->zzaah:Ljava/util/Set;

    new-instance v3, Lcom/google/android/gms/common/api/zzg$zza;

    iget-object v4, p0, Lcom/google/android/gms/common/api/zzg$zzc;->zzZK:Lcom/google/android/gms/common/api/zzg;

    invoke-direct {v3, v4}, Lcom/google/android/gms/common/api/zzg$zza;-><init>(Lcom/google/android/gms/common/api/zzg;)V

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/gms/signin/zzd;->zza(Lcom/google/android/gms/common/internal/zzp;Ljava/util/Set;Lcom/google/android/gms/signin/internal/zze;)V

    return-void
.end method
