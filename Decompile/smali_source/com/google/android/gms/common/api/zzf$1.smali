.class Lcom/google/android/gms/common/api/zzf$1;
.super Lcom/google/android/gms/common/api/zzi$zzb;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/common/api/zzf;->zzb(Lcom/google/android/gms/common/api/zzc$zza;)Lcom/google/android/gms/common/api/zzc$zza;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzZr:Lcom/google/android/gms/common/api/zzf;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/api/zzf;Lcom/google/android/gms/common/api/zzj;)V
    .registers 3

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzf$1;->zzZr:Lcom/google/android/gms/common/api/zzf;

    invoke-direct {p0, p2}, Lcom/google/android/gms/common/api/zzi$zzb;-><init>(Lcom/google/android/gms/common/api/zzj;)V

    return-void
.end method


# virtual methods
.method public zznn()V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzf$1;->zzZr:Lcom/google/android/gms/common/api/zzf;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/api/zzf;->onConnectionSuspended(I)V

    return-void
.end method
